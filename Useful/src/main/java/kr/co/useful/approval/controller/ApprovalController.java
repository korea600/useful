package kr.co.useful.approval.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.useful.approval.domain.ApprovalProgressVO;
import kr.co.useful.approval.domain.ApprovalVO;
import kr.co.useful.approval.service.ApprovalService;
import kr.co.useful.manager.domain.EmpVO;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	@Inject
	private ApprovalService service;
	
	@RequestMapping(value="/read/{no}", method=RequestMethod.GET)
	public String read(Model m,@PathVariable int no) throws Exception{
		m.addAttribute("vo", service.select(no));
		return "/approval/read";
	}
	

	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String form(){
		return "/approval/form";
	}
	
	@RequestMapping(value="/form", method=RequestMethod.POST)
	public String insert(ApprovalVO vo) throws Exception{
		service.create(vo);
		return "/approval/form";
	}
	
	/* 문서 리스트 조회
	1. 결재완료이고 수신부서가 우리부서 또는 전체인것 조회 -> 세부내용조회
	2. 우리부서내에서 결재 진행중인것			-> 세부내용조회
	3. 내가 작성한 것 -> 반려된거는 수정기능
	4. 내가 결재할 차례인것 -> 결재하기
	 */

	@RequestMapping("/listmine")	// 내가 작성한 문서 조회
	public String listmine(HttpSession session, Model m) throws Exception{
		ApprovalVO vo = new ApprovalVO();
		vo.setWriter(((EmpVO)session.getAttribute("LoginUser")).getEmpno());
		m.addAttribute("list", service.list(vo));
		return "/approval/list";
	}

	@RequestMapping("/listmyturn")	// 내가 결재할 차례인것 조회
	public String listmyturn(HttpSession session,Model m) throws Exception{
		ApprovalVO vo = new ApprovalVO();
		vo.setNext_approval(((EmpVO)session.getAttribute("LoginUser")).getEmpno());
		m.addAttribute("list", service.list(vo));
		return "/approval/list";
	}
	
	@RequestMapping("/listdept")	// 수신부서가 우리부서 or 전체용 문서 조회
	public String listdept(HttpSession session, Model m) throws Exception{
		ApprovalVO vo = new ApprovalVO();
		int empno=((EmpVO)session.getAttribute("LoginUser")).getEmpno();
		vo.setReceiver(service.getMyDeptno(empno));	// 사번으로 부서번호 얻어서 조회 조건 지정
		vo.setStatus("완료");							// 결재완료인 상태로 조건 지정
		m.addAttribute("list", service.list(vo));
		return "/approval/list";
	}
	
	@RequestMapping("/liststatus")	// 우리부서내에서 결재 진행중인것 조회 (발신부서 조회)
	public String liststatus(HttpSession session, Model m) throws Exception{
		int empno=((EmpVO)session.getAttribute("LoginUser")).getEmpno();
		Map<String, Object> map = new HashMap<>();
		map.put("status","완료");
		map.put("deptno", service.getMyDeptno(empno));	// 사번으로 부서번호 얻어서 조회 조건 지정
		m.addAttribute("list", service.listStatus(map));
		return "/approval/list";
	}
	
	/* <결재하기>
	 * 결재시 update 할것  : curr_approval은 결재한사람, next_approval은 결재한사람의 상사로 바꾸기
	 * <반려하기>
	 * 반려시 update 할것 : curr_approval, next_approval 모두 작성자로 바꾸기, status를 반려로 바꾸기
	 * <수정하기 - 작성자에게 반려된 문서만 수정가능>
	 * status는 진행, next_approval을 작성자의 상사로 바꾸기
	 * <결재선>
	 * 전체결재문서(수신부서가 0인것) : 결재선은 사장(직책번호0)까지
	 * 나머지결재문서(수신부서가 0이 아닌것) : 결재선은 부장(직책번호10)까지
	 * <결재완료 처리 - 결재선에 도달한 경우>
	 * curr_approval, next_approval을 0으로 바꾸기
	 * status를 완료로 바꾸기 */
	
	/* ApprovalVO : 결재문서 정보, ApprovalProgressVO : 결재자 정보 */
	
	// 결재 승인(다음결재자로 정보갱신 or 결재완료처리)
	@RequestMapping("/approval/accept")
	public void approval_accept(ApprovalVO vo, HttpSession session) throws Exception{
		EmpVO emp = (EmpVO) session.getAttribute("LoginUser");
		ApprovalProgressVO progressVO = new ApprovalProgressVO(vo.getNo(),emp.getEmpno(),emp.getPosition(),emp.getEname(),emp.getDeptno(),true);
		service.do_approval(vo, progressVO);
	}
	
	// 결재 반려(결재자 정보를 작성자로 변경, 상태정보를 반려로 변경)
	@RequestMapping("/approval/reject")
	public void approval_reject(ApprovalVO vo, HttpSession session) throws Exception{
		EmpVO emp = (EmpVO) session.getAttribute("LoginUser");
		ApprovalProgressVO progressVO = new ApprovalProgressVO(vo.getNo(),emp.getEmpno(),emp.getPosition(),emp.getEname(),emp.getDeptno(),false);
		service.do_approval(vo, progressVO);
	}
}

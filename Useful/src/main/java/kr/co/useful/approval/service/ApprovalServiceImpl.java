package kr.co.useful.approval.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.approval.domain.ApprovalRestVO;
import kr.co.useful.approval.domain.ApprovalVO;
import kr.co.useful.approval.persistence.ApprovalDAO;
import kr.co.useful.approval.persistence.ApprovalRestDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Inject
	private ApprovalDAO dao;
	@Inject
	private ApprovalRestDAO restdao;
	
	public void create(ApprovalVO vo) throws Exception {
		vo.setCurr_approval(vo.getWriter());			// 작성자를 최근 결재자로 지정
		
		// 다음 결재자가 있는지 확인
		ApprovalRestVO restVO = new ApprovalRestVO(); 
		restVO.setDeptno(vo.getReceiver());				
		restVO.setEmpno(vo.getWriter());
		if(restdao.getLine(restVO).size()>0){		// 다음 결재자가 있으면 다음 결재자로 직속상사 지정
			vo.setNext_approval(dao.getManager(vo.getWriter()));
			vo.setStatus("진행");
		}
		else{
			vo.setNext_approval(vo.getWriter());	// 다음 결재자가 없으면 작성자가 다음 결재자가 됨
			vo.setStatus("완료");
		}
		dao.create(vo);
	}
	
	public int getMyDeptno(int empno) throws Exception {
		return dao.getMyDeptno(empno);
	}

	public void modify(ApprovalVO vo) throws Exception {
		
	}

	public List<ApprovalVO> list(ApprovalVO vo) throws Exception {
		return dao.list(vo);
	}

	public void do_approval(ApprovalVO vo) throws Exception {
		
	}

	public ApprovalVO select(int no) throws Exception {
		return dao.select(no);
	}

	public List<ApprovalVO> listStatus(Map<String, Object> map) throws Exception {
		return dao.listStatus(map);
	}
}

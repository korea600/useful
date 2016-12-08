package kr.co.useful.login.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.useful.approval.domain.ApprovalVO;
import kr.co.useful.approval.service.ApprovalService;
import kr.co.useful.board.domain.AnonymityVO;
import kr.co.useful.board.domain.BoardVO;
import kr.co.useful.board.domain.DeptBoardVO;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.service.AnonymityService;
import kr.co.useful.board.service.BoardService;
import kr.co.useful.board.service.DeptService;
import kr.co.useful.board.service.NoticeService;
import kr.co.useful.email.domain.Email;
import kr.co.useful.email.service.EmailSender;
import kr.co.useful.login.service.LoginService;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.service.RecipientService;


@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Inject
	private LoginService service;
	
	 @Autowired
	    private EmailSender emailSender;
	 
	 @Inject
	 private NoticeService noticeService;
	 
	 @Inject
	 private AnonymityService anoService;
	 
	 @Inject
	 private BoardService boardService;
	 
	 @Inject
	 private ApprovalService appService;
	 
	 @Inject
	 private RecipientService reService;
	 
	
	//로그인 폼 보이기
	@RequestMapping("/Login")
	public void login(){
		
	}
	
	//로그인 체크
	@RequestMapping("/Main")
	public ResponseEntity<String> main(HttpServletRequest req,HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String empno = req.getParameter("empno");
		String pass = req.getParameter("pass");
		
		try {
			String dpass = service.select(Integer.parseInt(empno)).getPass();
			if(pass.equals(dpass)){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
			service.update(Integer.parseInt(empno));
			EmpVO vo = service.selectLoginUser(Integer.parseInt(empno), dpass);
			if(vo != null){
				session.setAttribute("LoginUser", vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return entity;
	}
	
	//초기 로그인 성공시 비밀번호 변경폼
	@RequestMapping("/Modify_Pass")
	public void modifyPass(){
		
	}
	
	@RequestMapping(value="/checkpass",method=RequestMethod.POST)
	public @ResponseBody String checkPass(HttpServletRequest req)throws Exception{
		int empno = ((EmpVO)(req.getSession().getAttribute("LoginUser"))).getEmpno();
		String password = req.getParameter("password");
		
		service.updatepass(empno, password);
		
		return "SUCCESS";
	}
	
	//로그인 성공시 보여주는 메인뷰
	@RequestMapping("/Mainview")
	public String main_view(HttpSession session)throws Exception{
		int empno = ((EmpVO)session.getAttribute("LoginUser")).getEmpno();
		int mynoteid = ((EmpVO)session.getAttribute("LoginUser")).getEmpno();
		
		List<NoticeVO> list = noticeService.list_cut();
		List<AnonymityVO> list2 = anoService.list_cot();
		List<BoardVO> list3 = boardService.select_cut_list();
		List<ApprovalVO> list4 = appService.listMyTurn_forMain(empno); //내가 결재 차례인 문서
		List<ApprovalVO> list5 = appService.listMine_forMain(empno); //내가 작성한 문서
		List<RecipientVO> list6 = reService.recipient_note_list(mynoteid);
		
		
		
		session.setAttribute("notice", list);
		session.setAttribute("anonymity", list2);
		session.setAttribute("board", list3);
		session.setAttribute("list4", list4);
		session.setAttribute("list5", list5);
		session.setAttribute("note", list6);
		
		
		return "/login/Main2";
	}
	
	//로그아웃 눌렀을때 세션 종료
	@RequestMapping("/Logout")
	public void logout(HttpSession session){
		
	}
	
	//로그인 폼에서 비밀번호 찾기 눌렀을 때 폼
	@RequestMapping("/Search_Pass")
	public void searchPass()throws Exception{
		
	}

	//비밀번호 찾기 폼에서 사번과 이메일주소에 해당하는 레코드가 있는지 확인, 임시 비밀번호 발송
	@RequestMapping(value="/check",method=RequestMethod.POST)
	public @ResponseBody String check(EmpVO vo)throws Exception{
		EmpVO empVO=service.selectAll(vo); //사번, 이름, 이메일 뽑아옴.
		
		if(empVO!=null){
			
			 Email email = new Email();
		        
		        int num = EmailSender.generateNumber(6);
		                
		        String subject = "임시 비밀번호를 발송해드립니다.";
		        String content = "임시 비밀번호는" + num + "입니다.";
		        String pass = ""+num;
		        
		        email.setReciver(empVO.getEmail());
		        email.setSubject(subject);
		        email.setContent(content);
		        emailSender.SendEmail(email);
		        
		        service.updatepass(empVO.getEmpno(),pass);
		        
		        return "SUCCESS";
		}else
			return "FAIL";
	}
	//비밀번호 암호화 작업
	@RequestMapping("/Encrypt")
	public void encrypt(){
			
	}
}

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
import kr.co.useful.encrypt.LocalEncrypter;
import kr.co.useful.login.service.LoginService;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.service.RecipientService;
import kr.co.useful.sharetask.domain.ShareTaskVO;
import kr.co.useful.sharetask.service.ShareTaskService;


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
	 
	 @Inject
	 private ShareTaskService shService;
	 
	
	//�α��� �� ���̱�
	@RequestMapping("/Login")
	public void login(){
		
	}
	
	//�α��� üũ
	@RequestMapping("/Main")
	public @ResponseBody String main(HttpServletRequest req,HttpSession session, int empno, String pass)throws Exception{
		String result="FAIL";
		
		String key="cogydnjscogydnjs1";
		LocalEncrypter enc = new LocalEncrypter(key);
		
		String dpass = service.select(empno).getPass();
		String dec = enc.aesDecode(dpass);

		if(pass.equals(dec)){
			result="SUCCESS";
			service.update(empno);
			session.setAttribute("LoginUser", service.selectLoginUser(empno, dpass));
		}
			
		return result;
	}
	
	//�ʱ� �α��� ������ ��й�ȣ ������
	@RequestMapping("/Modify_Pass")
	public void modifyPass(){
		
	}
	
	@RequestMapping(value="/checkpass",method=RequestMethod.POST)
	public @ResponseBody String checkPass(HttpServletRequest req,EmpVO vo)throws Exception{
		int empno = ((EmpVO)(req.getSession().getAttribute("LoginUser"))).getEmpno();
		String password = req.getParameter("password");
		
		 	String key="cogydnjscogydnjs1";
			LocalEncrypter enc = new LocalEncrypter(key);
			
			String str = enc.aesEncode(password);
			
			vo.setPass(str);
			
		service.updatepass(empno, str);
			
		return "SUCCESS";
	}
	
	//�α��� ������ �����ִ� ���κ�
	@RequestMapping("/Mainview")
	public String main_view(HttpSession session)throws Exception{
		int empno = ((EmpVO)session.getAttribute("LoginUser")).getEmpno();
		int mynoteid = ((EmpVO)session.getAttribute("LoginUser")).getEmpno();
		int deptno = ((EmpVO)session.getAttribute("LoginUser")).getDeptno();
		
		List<NoticeVO> list = noticeService.list_cut();
		List<AnonymityVO> list2 = anoService.list_cot();
		List<BoardVO> list3 = boardService.select_cut_list();
		List<ApprovalVO> list4 = appService.listMyTurn_forMain(empno); //���� ���� ������ ����
		List<ApprovalVO> list5 = appService.listMine_forMain(empno); //���� �ۼ��� ����
		List<RecipientVO> list6 = reService.recipient_note_list(mynoteid);
		List<ShareTaskVO> list7 = shService.cutList(deptno);
		
		
		
		session.setAttribute("notice", list);
		session.setAttribute("anonymity", list2);
		session.setAttribute("board", list3);
		session.setAttribute("list4", list4);
		session.setAttribute("list5", list5);
		session.setAttribute("note", list6);
		session.setAttribute("list7", list7);
		
		
		return "/login/Main2";
	}
	
	//�α׾ƿ� �������� ���� ����
	@RequestMapping("/Logout")
	public void logout(HttpSession session){
		
	}
	
	//�α��� ������ ��й�ȣ ã�� ������ �� ��
	@RequestMapping("/Search_Pass")
	public void searchPass()throws Exception{
		
	}

	//��й�ȣ ã�� ������ ����� �̸����ּҿ� �ش��ϴ� ���ڵ尡 �ִ��� Ȯ��, �ӽ� ��й�ȣ �߼�
	@RequestMapping(value="/check",method=RequestMethod.POST)
	public @ResponseBody String check(EmpVO vo)throws Exception{
		EmpVO empVO=service.selectAll(vo); //���, �̸�, �̸��� �̾ƿ�.
		
		if(empVO!=null){
			
			 Email email = new Email();
		        
		        int num = EmailSender.generateNumber(6);
		                
		        String subject = "UsefulWare���� �ӽ� ��й�ȣ�� �߼��ص帳�ϴ�.";
		        String content = "�߼۵� �ӽ� ��й�ȣ�� [" + num + "] �Դϴ�.";
		        String pass = ""+num;
		        
		        email.setReciver(empVO.getEmail());
		        email.setSubject(subject);
		        email.setContent(content);
		        emailSender.SendEmail(email);
		        
		        String key="cogydnjscogydnjs1";
				LocalEncrypter enc = new LocalEncrypter(key);
				
				String str = enc.aesEncode(pass);
				
				vo.setPass(str);
		        
		        service.updatepass(empVO.getEmpno(),str);
				
		        return "SUCCESS";
		}else
			return "FAIL";
	}
	//��й�ȣ ��ȣȭ �۾�
	@RequestMapping("/Encrypt")
	public void encrypt(){
			
	}
}

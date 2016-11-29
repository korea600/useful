package kr.co.useful.login.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.useful.login.service.LoginService;
import kr.co.useful.manager.domain.EmpVO;


@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Inject
	private LoginService service;
	
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
		System.out.println("pass : " + pass);
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
	
	//로그인 성공시 보여주는 메인뷰
	@RequestMapping("/Mainview")
	public String main_view(){

		return "/login/Main2";
	}
	
	//로그아웃 눌렀을때 세션 종료
	@RequestMapping("/Logout")
	public void logout(HttpSession session){
		
	}
	
	//로그인 폼에서 비밀번호 찾기 눌렀을 때 폼
	@RequestMapping("/Search_Pass")
	public void searchPass(){
		
	}
	
	//초기 로그인 성공시 비밀번호 변경폼
	@RequestMapping("/Modify_Pass")
	public void modifyPass(){
		
	}
	
	//비밀번호 암호화 작업
	@RequestMapping("/Encrypt")
	public void encrypt(){
		
	}
}

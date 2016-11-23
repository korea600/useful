package kr.co.useful.login.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.useful.login.service.LoginService;


@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Inject
	private LoginService service;
	
	@RequestMapping("/Login")
	public void login(){
		
	}
	
	@RequestMapping("/Main")
	public ResponseEntity<String> main(HttpServletRequest req){
		
		ResponseEntity<String> entity = null;
		
		String empno = req.getParameter("empno");
		String pass = req.getParameter("pass");
		
		System.out.println("아이디 : "+empno);
		System.out.println("비번: "+pass);
		
		try {
			String dpass = service.select(Integer.parseInt(empno)).getPass();
			if(pass.equals(dpass)){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return entity;
	}
	
	@RequestMapping("/Mainview")
	public String main_view(){
		
		
		return "/login/Main";
	}
	
}

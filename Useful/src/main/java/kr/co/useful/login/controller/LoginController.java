package kr.co.useful.login.controller;

import javax.inject.Inject;

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
}

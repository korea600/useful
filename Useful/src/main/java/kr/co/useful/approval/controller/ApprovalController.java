package kr.co.useful.approval.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.useful.approval.service.ApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	/*@Inject
	private ApprovalService service;*/
	
	@RequestMapping("")
	public String list(Model model){
		return "/approval/list";		
	}
	
	@RequestMapping("/form")
	public String form(){
		return "/approval/form";
	}
	
}

package kr.co.useful.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	@RequestMapping("")
	public String form(){
		return "/approval/form";
	}
	
}

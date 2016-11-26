package kr.co.useful.approval.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.useful.approval.domain.ApprovalVO;
import kr.co.useful.approval.service.ApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	@Inject
	private ApprovalService service;
	
	@RequestMapping("")
	public String list(Model model){
		return "/approval/list";		
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
	
}

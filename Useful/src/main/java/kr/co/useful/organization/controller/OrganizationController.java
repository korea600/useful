package kr.co.useful.organization.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.useful.organization.service.OrganizationService;
@Controller
@RequestMapping("/organization")
public class OrganizationController {
	
	/*@Inject
	private OrganizationService service;*/
	
	@RequestMapping(value="")
	public String view_organization(){
		return "/organization/view";
	}
	
	@RequestMapping("/{empno}")
	public void view_details(@PathVariable int empno){
		
	}
}

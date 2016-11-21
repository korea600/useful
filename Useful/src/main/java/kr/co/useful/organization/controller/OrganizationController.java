package kr.co.useful.organization.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.useful.organization.service.OrganizationService;


public class OrganizationController {
	
	@Inject
	private OrganizationService service;
	
	@RequestMapping("/organization")
	public void view_organization(){
		
	}
	
	@RequestMapping("/view_details/{empno}")
	public void view_details(@PathVariable int empno){
		
	}
}

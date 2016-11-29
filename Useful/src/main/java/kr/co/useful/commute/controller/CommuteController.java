package kr.co.useful.commute.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.useful.commute.domain.CommuteVO;
import kr.co.useful.commute.service.CommuteService;

@Controller
@RequestMapping("/commute")
public class CommuteController {
	
	
	@Inject
	private CommuteService service;
	
	@RequestMapping("/Commute_In")
	public void insert(@RequestParam int empno,HttpSession session)throws Exception{
		
		service.insert(empno);
	}
	
	@RequestMapping("/Commute_Out")
	public void update(@RequestParam int empno)throws Exception{
		service.update(empno);
	}
	
	
}

package kr.co.useful.commute.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.useful.commute.domain.CommuteVO;
import kr.co.useful.commute.service.CommuteService;

@Controller
@RequestMapping("/commute")
public class CommuteController {
	
	
	@Inject
	private CommuteService service;
	
	@RequestMapping("/Commute_In")
	public void insert(CommuteVO vo)throws Exception{
		service.insert(vo);
	}
	
	
}

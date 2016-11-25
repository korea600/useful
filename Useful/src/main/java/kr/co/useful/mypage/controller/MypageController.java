package kr.co.useful.mypage.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Inject
	private MypageService service;
	
	
	@RequestMapping(value="/Mypage",method=RequestMethod.GET)
	public void updateForm(@RequestParam String empno,Model m)throws Exception{
			
			m.addAttribute("vo", service.select(Integer.parseInt(empno)));
		
	}
	
	
	@RequestMapping(value="/Mypage",method=RequestMethod.POST)
	public ResponseEntity<String> updateInfo(@RequestBody EmpVO vo){
		ResponseEntity<String> entity = null;
		try {
			service.update(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return entity;
	}
}

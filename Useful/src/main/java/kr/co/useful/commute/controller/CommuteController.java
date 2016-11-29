package kr.co.useful.commute.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public ResponseEntity<String> insert(@RequestParam int empno){
		ResponseEntity<String> entity = null;
		
		try {
			if(service.insert(empno)){
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("FAIL",HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping("/Commute_Out")
	public void update(@RequestParam int empno)throws Exception{
		service.update(empno);
	}
	
	
}

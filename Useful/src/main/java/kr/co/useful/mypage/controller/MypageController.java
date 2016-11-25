package kr.co.useful.mypage.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Inject
	private MypageService service;
	
	@RequestMapping("")
	public String mypage(int empno, Model m){
		
		try {
			EmpVO info = service.select(empno);
			m.addAttribute("info", info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mypage/Mypage";
	}
	
	@RequestMapping("/MypageUp")
	public ResponseEntity<String> updateInfo(int empno){
		ResponseEntity<String> entity = null;
		try {
			service.update(empno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
}

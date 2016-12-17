package kr.co.useful.commute.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.useful.commute.service.CommuteService;

@Controller
@RequestMapping("/commute")
public class CommuteController {
	
	@Inject
	private CommuteService service;
	
	@RequestMapping("/Commute_In") //출근체크
	public ResponseEntity<String> insert(@RequestParam int empno){
		ResponseEntity<String> entity = null;
		
		try {
			if(service.insert(empno)){
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			}
			else{
				entity = new ResponseEntity<String>("FAIL",HttpStatus.OK);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping("/Commute_Out") //퇴근체크
	public ResponseEntity<String> update(@RequestParam int empno){
		ResponseEntity<String> entity = null;
		
		try {
			if(service.update(empno)){
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
			else{
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}
		}
		catch (Exception e) {
			e.printStackTrace();			
		}
		return entity;
	}
	
	@RequestMapping(value="/Login_Commute",method=RequestMethod.GET)
	public void commuteForm(){}
	
	@RequestMapping(value="/commute_print",method=RequestMethod.POST)
	public String commute(@RequestParam String empno, Model m, @RequestBody Map<String,Object> reqMap)throws Exception{
		Map<String, Object> map = new HashMap<>();

		String startdate = (String) reqMap.get("startdate");
		String enddate = (String) reqMap.get("enddate");
		
		startdate = startdate.replaceAll("-","");
		enddate = enddate.replaceAll("-","");
		
		map.put("startdate", startdate);
		map.put("enddate", enddate);
			
		if(empno !=null && empno!=""){
			map.put("empno", empno);
			m.addAttribute("commute",service.commuteToday(map));
		}
		return "/commute/commute_print";
	}
	
}

package kr.co.useful.manager.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.manager.service.ManagerService;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Inject
	ManagerService service;
	
	@RequestMapping("/employee_List")
	public void employee_List(){
		
	}
	
	@RequestMapping(value="/employee_Insert",method=RequestMethod.GET)
	public void employee_Insert_Form(){
		
	}
	
	@RequestMapping(value="/employee_Insert",method=RequestMethod.POST)
	public void employee_Insert(@RequestBody EmpVO vo) throws Exception{
		System.out.println(vo);
		service.emp_Insert(vo);
		
	}
	
	@RequestMapping(value="/employee_Update",method=RequestMethod.GET)
	public Model employee_Update_Form(@RequestParam String empno)throws Exception{
		
		Model model = new ExtendedModelMap();
		model.addAttribute("vo",service.emp_select(Integer.parseInt(empno)));
		
		return model;
	}
	@RequestMapping(value="/employee_Update",method=RequestMethod.POST)
	public void employee_Update(@RequestBody EmpVO vo)throws Exception{
		System.out.println(vo);
	}
	@RequestMapping(value="/employee_Delete",method=RequestMethod.POST)
	public ResponseEntity<String> employee_Delete(String empno)throws Exception{
		
		ResponseEntity<String> entity =null;
		service.emp_delete(Integer.parseInt(empno));
		entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		return entity;
	}

	@RequestMapping(value="/commute_Employee",method=RequestMethod.GET)
	public void commute_Employee_Form(){
		
	}
	@RequestMapping(value="/commute_Employee",method=RequestMethod.POST)
	public void commute_Employee(@RequestBody Map map){
		String startdate = (String) map.get("startdate");
		startdate = startdate.replaceAll("-","");
	}
	@RequestMapping(value="/commute_Dept",method=RequestMethod.GET)
	public void commute_Dept_Form(){
		
	}
	@RequestMapping(value="/commute_Dept",method=RequestMethod.POST)
	public void commute_Dept(String dept,String year,String month){
		
	}
	@RequestMapping("/commute_Daily")
	public void commute_Daily(){
		
	}
	@RequestMapping("/commute_Monthly")
	public void commute_Monthly(){
		
	}
	@RequestMapping("/salary_List")
	public void salary_List(){
		
	}
	@RequestMapping("/jquery_Test")
	public void jquery_Test(){
		
	}
	
	
}

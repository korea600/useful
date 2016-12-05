package kr.co.useful.manager.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.manager.domain.Commute_DeptVO;
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
	public String commute_Employee(@RequestBody Map<String,Object> requestMap,Model model)throws Exception{
		Map<String,Object> map = new HashMap<>();
		String startdate = (String) requestMap.get("startdate");
		String enddate = (String) requestMap.get("enddate");
		startdate = startdate.replaceAll("-","");
		enddate = enddate.replaceAll("-","");
		
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		if(requestMap.get("empno")!=null&&requestMap.get("empno")!=""){
			map.put("empno", requestMap.get("empno"));
			model.addAttribute("commute",service.commute_list_empno(map));
			return "/manager/commute_Print";
		}
		else if(requestMap.get("ename")!=null&&requestMap.get("ename")!=""){
			map.put("ename", requestMap.get("ename"));
			model.addAttribute("commute",service.commute_list_ename(map));
			return "/manager/commute_Print";
		}		
		else if(requestMap.get("deptno")!=null&&requestMap.get("deptno")!=""){
			map.put("deptno", requestMap.get("deptno"));
			model.addAttribute("commute",service.commute_list_dept(map));
			return "/manager/commute_Print";
		}else {
			model.addAttribute("commute",service.commute_list_all(map));
			return "/manager/commute_Print";
		}
	}

	@RequestMapping(value="/commute_Dept",method=RequestMethod.GET)
	public void commute_Dept_Form(){
		
	}
	@RequestMapping(value="/commute_Dept",method=RequestMethod.POST)
	public String commute_Dept(@RequestBody Map<String,Object> requestMap,Model model)throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("deptno",requestMap.get("dept"));
		map.put("login",(String)requestMap.get("year")+(String)requestMap.get("month"));
		model.addAttribute("commute",service.commute_dept_list(map));
		return "/manager/commute_Printdept";
	}
	
	@RequestMapping(value="/commute_Monthly",method=RequestMethod.GET)
	public void commute_Monthly_form(){
		
	}
	
	@RequestMapping(value="/commute_Monthly",method=RequestMethod.POST)
	public String commute_Monthly(@RequestBody Map<String,Object> requestMap,Model model)throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("deptno",requestMap.get("dept"));
		map.put("login",(String)requestMap.get("year")+(String)requestMap.get("month"));
		model.addAttribute("commute",service.commute_monthly_list(map));
		return "/manager/commute_PrintMonthly";
	}
	@RequestMapping(value="/leave_List",method=RequestMethod.GET)
	public void leave_List_form(){
		
	}
	@RequestMapping(value="/leave_List",method=RequestMethod.POST)
	public String leave_List(@RequestBody Map<String,Object> requestMap,Model model)throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("deptno",(String)requestMap.get("deptno"));
		if(requestMap.get("empno").equals("")){
			map.put("empno",null);
		}else{
			map.put("empno",(String)requestMap.get("empno"));
		}
		if(requestMap.get("ename").equals("")){
			map.put("ename",null);
		}else{
			map.put("ename",(String)requestMap.get("ename"));
		}
		model.addAttribute("commute",service.leave_list_search(map));
		return "/manager/leave_Print";
	}
	@RequestMapping(value="/leave_List_Update",method=RequestMethod.POST)
	public String leave_List_Update(@RequestBody Map<String,Object> requestMap,Model model)throws Exception{
		service.leave_List_Update(requestMap);
		return "/manager/leave_Print";
	}
	
	@RequestMapping("/commute_Daily")
	public void commute_Daily(){
		
	}
	@RequestMapping("/salary_List")
	public void salary_List(){
		
	}
	@RequestMapping("/jquery_Test")
	public void jquery_Test(){
		
	}
	@RequestMapping("/commute_Print")
	public void commute_Print(){
		
	}
	@RequestMapping("/commute_Printdept")
	public void commute_Printdept(){
		
	}
	
	@RequestMapping("/commute_PrintMonthly")
	public void commute_PrintMonthly(){
		
	}
	
	@RequestMapping("/leave_Print")
	public void leave_Print(){
		
	}
	
	
	
	
}

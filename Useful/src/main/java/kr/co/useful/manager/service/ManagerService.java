package kr.co.useful.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.domain.Commute_DeptVO;
import kr.co.useful.manager.domain.Commute_MonthlyVO;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.manager.domain.LeaveVO;
import kr.co.useful.manager.domain.SalaryVO;

public interface ManagerService {
	public List<Map<String, Object>> listAll()throws Exception;
	
	public List<Map<String, Object>> listSearch(String searchType,String keyword)throws Exception;
	
	public void emp_Insert(EmpVO vo)throws Exception;
	
	public EmpVO emp_select(int empno)throws Exception;
	
	public void emp_update(EmpVO vo)throws Exception;
	
	public void emp_delete(int empno)throws Exception;
	
	public List<CommuteVO> commute_list_all(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_list_empno(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_list_ename(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_list_dept(Map<String,Object> map) throws Exception;
	
	public void commute_update(Map<String,Object> map)throws Exception;
	
	public List<Commute_DeptVO> commute_dept_list(Map<String,Object> map)throws Exception;
	
	public List<Commute_MonthlyVO> commute_monthly_list(Map<String,Object> map)throws Exception;
	
	public List<LeaveVO> leave_list_search(Map<String,Object> map)throws Exception;
	
	public void leave_List_Update(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_Monthly_search_oneday(Map<String,Object> map)throws Exception;
	
	public List<EmpVO> emp_search(Map<String, Object> map) throws Exception;
	
	public List<SalaryVO> salary_List(Map<String,Object> map)throws Exception;
	
	public void salary_Insert(Map<String,Object> map)throws Exception;
	
	public void salary_Update(Map<String,Object> map)throws Exception;
	
	public void salary_Delete(int serial)throws Exception;
}

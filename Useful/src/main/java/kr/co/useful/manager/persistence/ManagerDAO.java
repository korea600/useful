package kr.co.useful.manager.persistence;

import java.util.List;
import java.util.Map;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.manager.domain.LeaveVO;
import kr.co.useful.manager.domain.SalaryVO;

public interface ManagerDAO {
	public List<Map<String, Object>> emplist()throws Exception;
	
	public List<Map<String, Object>>  emplistSearch(String searchType,String keyword)throws Exception;
	
	public void emp_Insert(EmpVO vo)throws Exception; 
	
	public EmpVO emp_select(int empno)throws Exception;
	
	public EmpVO emp_select_include_dname(int empno)throws Exception;
	
	public void emp_update(EmpVO vo)throws Exception;
	
	public void emp_delete(int empno)throws Exception;
	
	public List<CommuteVO> commute_emplist_all(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_emplist_empno(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_emplist_deptno(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_emplist_ename(Map<String,Object> map)throws Exception;
	
	public void commute_update(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_dept_list(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_monthly_list(Map<String,Object> map)throws Exception;
	
	public List<Integer> search_ename_from_dept(int deptno)throws Exception;
	
	public List<LeaveVO> leave_list_search(Map<String,Object> map)throws Exception;
	
	public void leave_List_Update(Map<String,Object> map)throws Exception;
	
	public List<CommuteVO> commute_Monthly_search_oneday(Map<String,Object> map)throws Exception;
	
	public List<EmpVO> emp_search(Map<String,Object> map)throws Exception;

	public List<SalaryVO> salary_List(Map<String,Object> map)throws Exception;
	
	public void salary_Insert(SalaryVO vo)throws Exception;
	
	public SalaryVO salary_update_form(int serial)throws Exception;

	public void salary_Update(SalaryVO vo)throws Exception;
	
	public void salary_Delete(int serial)throws Exception;
	
	public void add_Sal_NextMonth()throws Exception;
	
	public int empno_check(int empno) throws Exception;

}

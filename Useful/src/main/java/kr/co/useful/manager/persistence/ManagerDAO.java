package kr.co.useful.manager.persistence;

import java.util.List;
import java.util.Map;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.domain.EmpVO;

public interface ManagerDAO {
	public List<Map<String, Object>> emplist()throws Exception;
	public List<Map<String, Object>>  emplistSearch(String searchType,String keyword)throws Exception;
	public void emp_Insert(EmpVO vo)throws Exception; 
	public EmpVO emp_select(int empno)throws Exception;
	public void emp_update(EmpVO vo)throws Exception;
	public void emp_delete(int empno)throws Exception;
	public List<CommuteVO> commute_emplist_all(Map<String,Object> map)throws Exception;
	public List<CommuteVO> commute_emplist_empno(Map<String,Object> map)throws Exception;
	public List<CommuteVO> commute_emplist_deptno(Map<String,Object> map)throws Exception;
	public List<CommuteVO> commute_emplist_ename(Map<String,Object> map)throws Exception;
	public void commute_update(Map<String,Object> map)throws Exception;
}

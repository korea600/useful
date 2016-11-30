package kr.co.useful.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.domain.EmpVO;

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
}

package kr.co.useful.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.manager.persistence.ManagerDAO;

@Service
class ManagerServiceImpl implements ManagerService {
	
	@Inject
	private ManagerDAO dao;
	
	@Override
	public List<Map<String, Object>> listAll() throws Exception {
		return dao.emplist();
	}

	@Override
	public List<Map<String, Object>> listSearch(String searchType,String keyword) throws Exception {
		return dao.emplistSearch(searchType, keyword);
	}
	
	@Override
	public void emp_Insert(EmpVO vo) throws Exception {
		dao.emp_Insert(vo);
	}
	
	@Override
	public EmpVO emp_select(int empno) throws Exception {
		return dao.emp_select(empno);
	}
	
	@Override
	public void emp_update(EmpVO vo) throws Exception {
		dao.emp_update(vo);
	}
	
	@Override
	public void emp_delete(int empno) throws Exception {
		dao.emp_delete(empno);
	}
	@Override
	public List<CommuteVO> commute_list_all(Map<String, Object> map) throws Exception {
		
		return  time_Division(dao.commute_emplist_all(map));
	}
	
	@Override
	public List<CommuteVO> commute_list_empno(Map<String,Object> map) throws Exception {

		return  time_Division(dao.commute_emplist_empno(map));
	}
	
	@Override
	public List<CommuteVO> commute_list_dept(Map<String,Object> map) throws Exception {
		return  time_Division(dao.commute_emplist_deptno(map));
	}
	
	@Override
	public List<CommuteVO> commute_list_ename(Map<String,Object> map) throws Exception {
		return  time_Division(dao.commute_emplist_ename(map));
	}
	
	public List<CommuteVO> time_Division(List<CommuteVO> list){
		 for(int i=0;i<list.size();i++){
			 list.get(i).setLogin_Time(list.get(i).getLogin().substring(11, 19));
			 list.get(i).setLogin(list.get(i).getLogin().substring(0, 10));
			 if(list.get(i).getLogout()!=null&&list.get(i).getLogout()!=""){
				 list.get(i).setLogout_Time(list.get(i).getLogout().substring(11, 19));
				 list.get(i).setLogout(list.get(i).getLogout().substring(0, 10));
			 }
		 }
		return list;
	}
}

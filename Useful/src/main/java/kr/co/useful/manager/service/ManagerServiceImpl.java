package kr.co.useful.manager.service;

import java.util.HashMap;
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
	public List<CommuteVO> commute_list_dept(int deptno, String startdate, String enddate) throws Exception {
/*		List<CommuteVO> vo;
		List<CommuteVO> vo2;
		List<Integer> list = dao.search_empnolist(deptno);
		Map<String,Object> map = new HashMap<>();
		for (int i = 0; i < list.size(); i++) {
			
			vo = dao.commute_emplist(map);
		}*/
		return null;
	}
	@Override
	public List<CommuteVO> commute_list_empno(int empno) throws Exception {
		return null;
	}
	
	@Override
	public List<CommuteVO> commute_list_ename(String ename) throws Exception {
		return null;
	}
}

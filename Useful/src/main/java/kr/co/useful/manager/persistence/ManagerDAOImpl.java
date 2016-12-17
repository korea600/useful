package kr.co.useful.manager.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.manager.domain.LeaveVO;
import kr.co.useful.manager.domain.SalaryVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Inject
	private SqlSession sqlSession;	
	
	public List<Map<String, Object>> emplist() throws Exception {
		return sqlSession.selectList("manager.emplist");
	}

	public List<Map<String, Object>> emplistSearch(String searchType,String keyword) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("searchType",	searchType);
		map.put("keyword",	keyword);
		return sqlSession.selectList("manager.emplistSearch",map);
	}

	public void emp_Insert(EmpVO vo) throws Exception {
		sqlSession.insert("manager.emp_insert",vo);
	}

	public EmpVO emp_select(int empno) throws Exception {
		return sqlSession.selectOne("manager.emp_select",empno);
	}

	public EmpVO emp_select_include_dname(int empno) throws Exception {
		return sqlSession.selectOne("manager.emp_select_include_dname",empno);
	}

	public void emp_update(EmpVO vo) throws Exception {
		sqlSession.update("manager.emp_update",vo);
	}

	public void emp_delete(int empno) throws Exception {
		sqlSession.delete("manager.emp_delete",empno);
	}

	public List<CommuteVO> commute_emplist_all(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_emplist_all",map);
	}

	public List<CommuteVO> commute_emplist_empno(Map<String,Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_emplist_empno",map);
	}
	
	public List<CommuteVO> commute_emplist_deptno(Map<String,Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_emplist_deptno",map);
	}

	public List<CommuteVO> commute_emplist_ename(Map<String,Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_emplist_ename",map);
	}

	public void commute_update(Map<String, Object> map) throws Exception {
		sqlSession.update("manager.commute_update",map);
	}

	public List<CommuteVO> commute_dept_list(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_dept",map);
	}

	public List<Integer> search_ename_from_dept(int deptno) throws Exception {
		Map<String,Integer> map =new HashMap<>();
		map.put("deptno", deptno);
		return sqlSession.selectList("manager.search_ename_from_dept",map);
	}

	public List<CommuteVO> commute_monthly_list(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_monthly_list",map);
	}

	public List<LeaveVO> leave_list_search(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.leave_list_search",map);
	}

	public void leave_List_Update(Map<String, Object> map) throws Exception {
		sqlSession.update("manager.leave_List_Update",map);
	}

	public List<CommuteVO> commute_Monthly_search_oneday(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_Monthly_search_oneday",map);
	}

	public List<EmpVO> emp_search(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.emp_search",map);
	}

	public List<SalaryVO> salary_List(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.salary_List",map);
	}

	public void salary_Insert(SalaryVO vo) throws Exception {
		sqlSession.insert("manager.salary_Insert",vo);
		
	}

	public SalaryVO salary_update_form(int serial) throws Exception {
		return sqlSession.selectOne("manager.salary_update_form",serial);
	}

	public void salary_Update(SalaryVO vo) throws Exception {
		sqlSession.update("manager.salary_Update",vo);
		
	}

	public void salary_Delete(int serial) throws Exception {
		sqlSession.delete("manager.salary_Delete",serial);
	}

	public void add_Sal_NextMonth() throws Exception {
		sqlSession.insert("manager.add_Sal_NextMonth");
	}

	public int empno_check(int empno) throws Exception {
		return sqlSession.selectOne("manager.empno_check",empno);
	}
}

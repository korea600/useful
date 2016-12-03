package kr.co.useful.manager.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.domain.EmpVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Inject
	private SqlSession sqlSession;	
	
	@Override
	public List<Map<String, Object>> emplist() throws Exception {
		return sqlSession.selectList("manager.emplist");
	}
	
	@Override
	public List<Map<String, Object>> emplistSearch(String searchType,String keyword) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("searchType",	searchType);
		map.put("keyword",	keyword);
		return sqlSession.selectList("manager.emplistSearch",map);
	}
	
	@Override
	public void emp_Insert(EmpVO vo) throws Exception {
		sqlSession.insert("manager.emp_insert",vo);
	}
	
	@Override
	public EmpVO emp_select(int empno) throws Exception {
		return sqlSession.selectOne("manager.emp_select",empno);
	}
	
	@Override
	public EmpVO emp_select_include_dname(int empno) throws Exception {
		return sqlSession.selectOne("manager.emp_select_include_dname",empno);
	}
	@Override
	public void emp_update(EmpVO vo) throws Exception {
		sqlSession.update("manager.emp_update",vo);
	}
	
	@Override
	public void emp_delete(int empno) throws Exception {
		sqlSession.delete("manager.emp_delete",empno);
	}
	
	@Override
	public List<CommuteVO> commute_emplist_all(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_emplist_all",map);
	}
	@Override
	public List<CommuteVO> commute_emplist_empno(Map<String,Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_emplist_empno",map);
	}
	
	@Override
	public List<CommuteVO> commute_emplist_deptno(Map<String,Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_emplist_deptno",map);
	}
	
	@Override
	public List<CommuteVO> commute_emplist_ename(Map<String,Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_emplist_ename",map);
	}
	
	@Override
	public void commute_update(Map<String, Object> map) throws Exception {
		sqlSession.update("manager.commute_update",map);
	}
	
	@Override
	public List<CommuteVO> commute_deptlist(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("manager.commute_dept",map);

	}
	
	@Override
	public List<Integer> search_ename_from_dept(int deptno) throws Exception {
		Map<String,Integer> map =new HashMap<>();
		map.put("deptno", deptno);
		return sqlSession.selectList("manager.search_ename_from_dept",map);
	}
}

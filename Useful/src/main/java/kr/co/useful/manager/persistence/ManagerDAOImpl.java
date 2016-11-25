package kr.co.useful.manager.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public void emp_update(EmpVO vo) throws Exception {
		sqlSession.update("manager.emp_update",vo);
	}
	
	@Override
	public void emp_delete(int empno) throws Exception {
		sqlSession.delete("manager.emp_delete",empno);
	}
}

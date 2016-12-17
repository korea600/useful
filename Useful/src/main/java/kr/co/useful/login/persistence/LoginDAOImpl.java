package kr.co.useful.login.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.manager.domain.EmpVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	public EmpVO select(int empno) throws Exception {
		return sqlSession.selectOne("login.select",empno);
	}

	public EmpVO selectLoginUser(int empno, String pass) throws Exception {
		Map<String, Object> map = new HashMap<>();
			map.put("empno", empno);
			map.put("pass", pass);
		
		return sqlSession.selectOne("login.selectLoginUser", map);
	}

	public int update(int empno) throws Exception {
		return sqlSession.update("login.update",empno);
	}

	public EmpVO selectAll(EmpVO vo) throws Exception {
		return sqlSession.selectOne("login.selectAll",vo);
	}

	public int updatepass(int empno, String pass) throws Exception {
		Map<String, Object> map = new HashMap<>();
			map.put("empno", empno);
			map.put("pass", pass);
		return sqlSession.update("login.updatepass", map);
	}

	public EmpVO selectempno(int empno, String pass) throws Exception {
		Map<String, Object> map = new HashMap<>();
			map.put("empno", empno);
			map.put("pass", pass);
		return sqlSession.selectOne("login.selectempno", map);
	}

}

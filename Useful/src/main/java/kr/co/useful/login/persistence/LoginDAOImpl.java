package kr.co.useful.login.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.organization.domain.OrganizationVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public EmpVO select(int empno) throws Exception {
		
		return sqlSession.selectOne("login.select",empno);
	}

	@Override
	public EmpVO selectLoginUser(int empno, String pass) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
			map.put("empno", empno);
			map.put("pass", pass);
		
		return sqlSession.selectOne("login.selectLoginUser", map);
	}

	@Override
	public int update(int empno) throws Exception {
		return sqlSession.update("login.update",empno);
	}

}

package kr.co.useful.login.persistence;

import java.util.List;

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

}

package kr.co.useful.mypage.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.mypage.domain.ProofEmpVO;

@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public EmpVO select(int empno) throws Exception {
		return sqlSession.selectOne("mypage.select", empno);
	}

	@Override
	public void update(EmpVO vo) throws Exception {
		sqlSession.update("mypage.update", vo);
	}

	@Override
	public EmpVO select_pass(int empno) throws Exception {
		return sqlSession.selectOne("mypage.select_pass", empno);
	}
	
	@Override
	public ProofEmpVO proof_emp(int empno) throws Exception {
		return sqlSession.selectOne("mapage.proof_emp",empno);
	}
}

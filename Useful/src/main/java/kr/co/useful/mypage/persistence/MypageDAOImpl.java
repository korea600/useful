package kr.co.useful.mypage.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.manager.domain.EmpVO;

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

}

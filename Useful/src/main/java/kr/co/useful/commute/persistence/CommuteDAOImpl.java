package kr.co.useful.commute.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.commute.domain.CommuteVO;

@Repository
public class CommuteDAOImpl implements CommuteDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(CommuteVO vo) throws Exception {
		sqlSession.insert("commute.insert", vo);
	}

	@Override
	public void update(CommuteVO vo) throws Exception {
		sqlSession.update("commute.update", vo);
	}

}

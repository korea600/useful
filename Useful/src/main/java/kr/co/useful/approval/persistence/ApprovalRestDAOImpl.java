package kr.co.useful.approval.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.approval.domain.ApprovalRestVO;

@Repository
public class ApprovalRestDAOImpl implements ApprovalRestDAO{

	@Inject
	private SqlSession sqlSession;
	
	public List<ApprovalRestVO> getDept(int deptno) throws Exception{
		return sqlSession.selectList("approval.getDept",deptno);
	}
	public List<ApprovalRestVO> getLine(ApprovalRestVO vo) throws Exception{
		return sqlSession.selectList("approval.getLine",vo);
	}
}

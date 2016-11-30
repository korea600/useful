package kr.co.useful.approval.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.approval.domain.ApprovalCommentVO;

@Repository
public class ApprovalCommentDAOImpl implements ApprovalCommentDAO{

	@Inject
	private SqlSession sqlSession;

	public List<ApprovalCommentVO> list(int no) throws Exception {
		return sqlSession.selectList("approval_comment.list", no);
	}

	public void insert(ApprovalCommentVO vo) throws Exception {
		sqlSession.insert("approval_comment.insert",vo);
	}

	public int listcount(int no) throws Exception {
		return sqlSession.selectOne("approval_comment.listcount", no);
	}

}

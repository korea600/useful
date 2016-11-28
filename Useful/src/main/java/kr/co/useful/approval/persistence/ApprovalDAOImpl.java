package kr.co.useful.approval.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.approval.domain.ApprovalVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	
	@Inject
	private SqlSession sqlSession;

	public void create(ApprovalVO vo) throws Exception {
		sqlSession.insert("approval.create",vo);
	}

	public void modify(ApprovalVO vo) throws Exception {
		
	}

	public ApprovalVO select(int no) throws Exception {

		return null;
	}

	public List<ApprovalVO> list(ApprovalVO vo) throws Exception {
		return sqlSession.selectList("approval.list", vo);
	}

	public void do_approval(ApprovalVO vo) throws Exception {

	}
	public int getManager(int empno)throws Exception{
		return sqlSession.selectOne("approval.getManager", empno);
	}

	public int getMyDeptno(int empno) throws Exception {
		return sqlSession.selectOne("approval.getmydeptno",empno);
	}

	public List<ApprovalVO> listStatus(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("approval.liststatus",map);
	}


}

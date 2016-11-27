package kr.co.useful.approval.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.approval.domain.ApprovalVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	
	@Inject
	private SqlSession sqlSession;

	public void create(ApprovalVO vo) throws Exception {
	//	System.out.println(vo.toString());
		sqlSession.insert("approval.create",vo);
	}

	public void modify(ApprovalVO vo) throws Exception {
		
	}

	public ApprovalVO select(int no) throws Exception {

		return null;
	}

	public List<ApprovalVO> list(int deptno) throws Exception {

		return null;
	}

	public List<ApprovalVO> list_from_me(int writer) throws Exception {

		return null;
	}


	public List<ApprovalVO> list_approval(int next_approval) throws Exception {

		return null;
	}

	public void do_approval(ApprovalVO vo) throws Exception {

	}
	public int getManager(int empno)throws Exception{
		return sqlSession.selectOne("approval.getManager", empno);
	}

}

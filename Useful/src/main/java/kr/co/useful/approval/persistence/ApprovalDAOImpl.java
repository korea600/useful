package kr.co.useful.approval.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.approval.domain.ApprovalCriteria;
import kr.co.useful.approval.domain.ApprovalVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	
	@Inject
	private SqlSession sqlSession;

	public void create(ApprovalVO vo) throws Exception {
		sqlSession.insert("approval.create",vo);
	}

	public void update(ApprovalVO vo) throws Exception {
		sqlSession.update("approval.update",vo);
	}

	public ApprovalVO select(int no) throws Exception {
		return sqlSession.selectOne("approval.select", no);
	}

	public List<ApprovalVO> list(ApprovalVO vo, ApprovalCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("vo", vo);	map.put("cri", cri);
		return sqlSession.selectList("approval.list", map,new RowBounds(cri.getPageStart(), cri.getPerPage()));
	}

	
	public int getManager(int empno)throws Exception{
		return sqlSession.selectOne("approval.getManager", empno);
	}

	public int getMyDeptno(int empno) throws Exception {
		return sqlSession.selectOne("approval.getmydeptno",empno);
	}

	public List<ApprovalVO> listStatus(Map<String, Object> map, ApprovalCriteria cri) throws Exception {
		map.put("cri", cri);
		return sqlSession.selectList("approval.liststatus",map,new RowBounds(cri.getPageStart(),cri.getPerPage()));
	}

	public void change_approval(ApprovalVO vo) throws Exception {
		sqlSession.update("approval.change_approval",vo);	
	}

	public void change_status(ApprovalVO vo) throws Exception {
		sqlSession.update("approval.change_status",vo);	
	}

	public String getDname(int deptno) throws Exception {
		return sqlSession.selectOne("approval.getdname",deptno);
	}

	public void delete(int no) throws Exception {
		sqlSession.delete("approval.delete",no);
		
	}

	public int listCount(ApprovalVO vo, ApprovalCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("vo", vo);	map.put("cri", cri);
		return sqlSession.selectOne("approval.listCount", map);
	}

	public int listStatusCount(Map<String, Object> map, ApprovalCriteria cri) throws Exception {
		map.put("cri", cri);
		return sqlSession.selectOne("approval.liststatusCount", map);
	}


}

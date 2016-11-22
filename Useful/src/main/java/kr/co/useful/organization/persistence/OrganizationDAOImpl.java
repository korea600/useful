package kr.co.useful.organization.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.co.useful.organization.domain.OrganizationVO;

public class OrganizationDAOImpl implements OrganizationDAO{
	@Inject
	private SqlSession sqlSession;

	
	public List<OrganizationVO> getDeptList() throws Exception {
		return sqlSession.selectList("organization.getDeptno");
	}

	public List<OrganizationVO> list_by_deptno(int deptno) throws Exception {
		return sqlSession.selectList("organization.list_by_deptno",deptno);
	}

	public OrganizationVO getDetails(int empno) throws Exception {
		return sqlSession.selectOne("organization.getDetails", empno);
	}

}

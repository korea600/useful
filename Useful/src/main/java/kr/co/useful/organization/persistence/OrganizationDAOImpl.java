package kr.co.useful.organization.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class OrganizationDAOImpl {
	@Inject
	private SqlSession sqlSession;

}

package kr.co.useful.organization.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.organization.domain.OrganizationVO;
import kr.co.useful.organization.persistence.OrganizationDAO;

@Service
public class OrganizationServiceImpl implements OrganizationService{
	
	@Inject
	private OrganizationDAO dao;

	public List<OrganizationVO> getDeptList() throws Exception {
		return dao.getDeptList();
	}

	public List<OrganizationVO> list_by_deptno(int deptno) throws Exception {
		return dao.list_by_deptno(deptno);
	}

	public OrganizationVO getDetails(int empno) throws Exception {
		return dao.getDetails(empno);
	}
	
}

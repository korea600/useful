package kr.co.useful.organization.persistence;

import java.util.List;

import kr.co.useful.organization.domain.OrganizationVO;

public interface OrganizationDAO {
	public List<OrganizationVO> getDeptList() throws Exception;		// 출력해야할 부서정보 선택
	public List<OrganizationVO> list_by_deptno(int deptno) throws Exception;	// 해당 부서의 조직도 출력
	public OrganizationVO getDetails(int empno) throws Exception;		// 특정 사원의 상세 정보 출력
}

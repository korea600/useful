package kr.co.useful.manager.persistence;

import java.util.List;

import kr.co.useful.manager.domain.EmpVO;

public interface ManagerDAO {
	public List<EmpVO> emplist()throws Exception;
}

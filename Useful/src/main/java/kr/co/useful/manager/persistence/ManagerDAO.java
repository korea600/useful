package kr.co.useful.manager.persistence;

import java.util.List;
import java.util.Map;

import kr.co.useful.manager.domain.EmpVO;

public interface ManagerDAO {
	public List<Map<String, Object>> emplist()throws Exception;
}

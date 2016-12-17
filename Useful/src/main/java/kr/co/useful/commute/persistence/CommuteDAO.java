package kr.co.useful.commute.persistence;

import java.util.List;
import java.util.Map;

import kr.co.useful.manager.domain.CommuteVO;

public interface CommuteDAO {
	
	public void insert(int empno)throws Exception;
	
	public void update(int empno)throws Exception;
	
	public int select(int empno)throws Exception;
	
	public List<CommuteVO> commuteselect(int empno)throws Exception;
	
	public List<CommuteVO> commuteToday(Map<String, Object> map)throws Exception;
}

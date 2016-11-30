package kr.co.useful.commute.persistence;

import java.util.List;

import kr.co.useful.commute.domain.CommuteVO;

public interface CommuteDAO {
	
	public void insert(int empno)throws Exception;
	
	public void update(int empno)throws Exception;
	
	public int select(int empno)throws Exception;
}

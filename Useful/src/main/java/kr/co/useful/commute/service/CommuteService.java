package kr.co.useful.commute.service;

import java.util.List;

import kr.co.useful.manager.domain.CommuteVO;

public interface CommuteService {
	
	public boolean insert(int empno)throws Exception;
	
	public boolean update(int empno)throws Exception;
	
	public List<CommuteVO> commuteselect(int empno)throws Exception;
}

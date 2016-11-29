package kr.co.useful.commute.service;

import kr.co.useful.commute.domain.CommuteVO;

public interface CommuteService {
	
	public void insert(int empno)throws Exception;
	
	public void update(int empno)throws Exception;
}

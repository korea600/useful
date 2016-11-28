package kr.co.useful.commute.service;

import kr.co.useful.commute.domain.CommuteVO;

public interface CommuteService {
	
	public void insert(CommuteVO vo)throws Exception;
	
	public void update(CommuteVO vo)throws Exception;
}

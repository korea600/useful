package kr.co.useful.commute.persistence;

import kr.co.useful.commute.domain.CommuteVO;

public interface CommuteDAO {
	
	public void insert(CommuteVO vo)throws Exception;
	
	public void update(CommuteVO vo)throws Exception;
}

package kr.co.useful.mypage.service;

import kr.co.useful.manager.domain.EmpVO;

public interface MypageService {
	
	public EmpVO select(int empno)throws Exception;
	
	public int update(int empno)throws Exception;
}

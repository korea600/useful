package kr.co.useful.mypage.persistence;

import kr.co.useful.manager.domain.EmpVO;

public interface MypageDAO {
	
	//사원 정보 출력
	public EmpVO select(int empno)throws Exception;
	
	//사원 개인정보 수정
	public int update(int empno)throws Exception;
}

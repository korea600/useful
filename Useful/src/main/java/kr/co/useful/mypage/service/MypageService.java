package kr.co.useful.mypage.service;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.mypage.domain.ProofEmpVO;

public interface MypageService {
	
	public EmpVO select(int empno)throws Exception;
	
	public void update(EmpVO vo)throws Exception;
	
	public EmpVO select_pass(int empno)throws Exception;
	
	//증명서 내용 출력
	public ProofEmpVO proof_emp(int empno)throws Exception;
}

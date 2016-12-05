package kr.co.useful.mypage.persistence;

import java.util.Map;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.mypage.domain.ProofEmpVO;

public interface MypageDAO {
	
	//사원 정보 출력
	public EmpVO select(int empno)throws Exception;
	
	//사원 개인정보 수정
	public void update(EmpVO vo)throws Exception;
	
	//비밀번호 확인
	public EmpVO select_pass(int empno)throws Exception;
	
	//증명서 내용 출력
	public ProofEmpVO proof_emp(int empno)throws Exception;
}

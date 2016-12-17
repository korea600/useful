package kr.co.useful.mypage.persistence;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.mypage.domain.ProofEmpVO;

public interface MypageDAO {
	
	//��� ���� ���
	public EmpVO select(int empno)throws Exception;
	
	//��� �������� ����
	public void update(EmpVO vo)throws Exception;
	
	//��й�ȣ Ȯ��
	public EmpVO select_pass(int empno)throws Exception;
	
	//���� ���� ���
	public ProofEmpVO proof_emp(int empno)throws Exception;
}

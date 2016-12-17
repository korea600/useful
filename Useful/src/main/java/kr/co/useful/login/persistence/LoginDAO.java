package kr.co.useful.login.persistence;

import kr.co.useful.manager.domain.EmpVO;

public interface LoginDAO {
	
	//�α����� ��� ���
	public EmpVO select(int empno)throws Exception;
	
	//����ó���� empno,pass ���
	public EmpVO selectLoginUser(int empno, String pass)throws Exception;
	
	public int update(int empno)throws Exception;
	
	public EmpVO selectAll(EmpVO vo)throws Exception;
	
	public int updatepass(int empno, String pass)throws Exception;
	
	public EmpVO selectempno(int empno, String pass)throws Exception;

}

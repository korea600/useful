package kr.co.useful.login.persistence;

import kr.co.useful.manager.domain.EmpVO;

public interface LoginDAO {
	
	//로그인할 사원 출력
	public EmpVO select(int empno)throws Exception;
	
	//세션처리할 empno,pass 출력
	public EmpVO selectLoginUser(int empno, String pass)throws Exception;
	
	public int update(int empno)throws Exception;
	
	public EmpVO selectAll(EmpVO vo)throws Exception;
	
	public int updatepass(int empno, String pass)throws Exception;
	
	public EmpVO selectempno(int empno, String pass)throws Exception;

}

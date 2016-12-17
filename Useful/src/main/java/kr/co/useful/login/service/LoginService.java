package kr.co.useful.login.service;

import kr.co.useful.manager.domain.EmpVO;

public interface LoginService {
	
	public EmpVO select(int empno)throws Exception;

	public EmpVO selectLoginUser(int empno,String pass)throws Exception;
	
	public int update(int empno)throws Exception;
	
	public EmpVO selectAll(EmpVO vo)throws Exception;
	
	public int updatepass(int empno,String pass)throws Exception;
	
	public EmpVO selectempno(int empno, String pass)throws Exception;
}

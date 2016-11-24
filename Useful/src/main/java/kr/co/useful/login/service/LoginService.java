package kr.co.useful.login.service;

import java.util.List;

import kr.co.useful.manager.domain.EmpVO;


public interface LoginService {
	
	public EmpVO select(int empno)throws Exception;

	public EmpVO selectLoginUser(int empno,String pass)throws Exception;
	
	public int update(int empno)throws Exception;
}

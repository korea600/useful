package kr.co.useful.login.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.login.persistence.LoginDAO;
import kr.co.useful.manager.domain.EmpVO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Inject
	private LoginDAO dao;
	
	public EmpVO select(int empno) throws Exception {
		return dao.select(empno);
	}

	public EmpVO selectLoginUser(int empno, String pass) throws Exception {
		return dao.selectLoginUser(empno, pass);
	}

	public int update(int empno) throws Exception {
		return dao.update(empno);
	}

	public EmpVO selectAll(EmpVO vo) throws Exception {
		return dao.selectAll(vo);
	}

	public int updatepass(int empno, String pass) throws Exception {
		return dao.updatepass(empno, pass);
	}

	public EmpVO selectempno(int empno, String pass) throws Exception {
		return dao.selectempno(empno, pass);
	}

}

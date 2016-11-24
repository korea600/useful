package kr.co.useful.mypage.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.mypage.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService{

	@Inject
	private MypageDAO dao;
	
	@Override
	public EmpVO select(int empno) throws Exception {
		return dao.select(empno);
	}

	@Override
	public int update(int empno) throws Exception {
		return dao.update(empno);
	}

}

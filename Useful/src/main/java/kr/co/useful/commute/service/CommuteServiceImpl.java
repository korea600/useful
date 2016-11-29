package kr.co.useful.commute.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.commute.domain.CommuteVO;
import kr.co.useful.commute.persistence.CommuteDAO;

@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Inject
	private CommuteDAO dao;
	
	@Override
	public void insert(int empno) throws Exception {
		
		if(dao.select(empno) == 0){	
			dao.insert(empno);
		}
	}

	@Override
	public void update(int empno) throws Exception {
		dao.update(empno);
	}



	

	

}

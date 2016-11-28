package kr.co.useful.commute.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.commute.domain.CommuteVO;
import kr.co.useful.commute.persistence.CommuteDAO;

@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Inject
	private CommuteDAO dao;
	
	@Override
	public void insert(CommuteVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public void update(CommuteVO vo) throws Exception {
		dao.update(vo);
	}

}

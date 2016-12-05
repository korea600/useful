package kr.co.useful.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.AnonymityVO;
import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.persistence.AnonymityDAO;
@Service
public class AnonymityServiceImpl implements AnonymityService{
@Inject
private AnonymityDAO dao;
	@Override
	public void create(AnonymityVO vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public AnonymityVO read(int serial) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(serial);
	}

	@Override
	public void update(AnonymityVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void delete(int serial) throws Exception {
		dao.delete(serial);
		
	}

	@Override
	public void viewcnt(int serial) throws Exception {
		dao.viewcnt(serial);
		
	}

	@Override
	public List<AnonymityVO> readAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.readAll();
	}

	@Override
	public int boardTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.boardTotalCount();
	}

	@Override
	public List<AnonymityVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public List<AnonymityVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listFindCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listFindCount(cri);
	}

	@Override
	public List<AnonymityVO> list_cot() throws Exception {
		// TODO Auto-generated method stub
		return dao.list_cut();
	}

	@Override
	public boolean pass_check(int serial) throws Exception {
		// TODO Auto-generated method stub
		return dao.pass_check(serial);
	}

}

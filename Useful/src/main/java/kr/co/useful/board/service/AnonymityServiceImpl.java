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
	
	public void create(AnonymityVO vo) throws Exception {
		dao.create(vo);
	}

	public AnonymityVO read(int serial) throws Exception {
		return dao.read(serial);
	}

	public void update(AnonymityVO vo) throws Exception {
		dao.update(vo);
	}

	public void delete(int serial) throws Exception {
		dao.delete(serial);
	}

	public void viewcnt(int serial) throws Exception {
		dao.viewcnt(serial);
	}

	public List<AnonymityVO> readAll() throws Exception {
		return dao.readAll();
	}

	public int boardTotalCount() throws Exception {
		return dao.boardTotalCount();
	}

	public List<AnonymityVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	public List<AnonymityVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	public int listFindCount(SearchCriteria cri) throws Exception {
		return dao.listFindCount(cri);
	}

	public List<AnonymityVO> list_cot() throws Exception {
		return dao.list_cut();
	} 

	public String pass_check(int serial) throws Exception {
		return dao.pass_check(serial);
	}

}

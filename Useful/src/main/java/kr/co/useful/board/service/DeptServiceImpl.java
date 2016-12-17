package kr.co.useful.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.DeptBoardVO;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.persistence.DeptBoardDAO;

@Service
public class DeptServiceImpl implements DeptService {
	
	@Inject
	private DeptBoardDAO dao;

	public void create(DeptBoardVO vo) throws Exception { //등록
		dao.create(vo);		
	}

	public void modify(DeptBoardVO vo) throws Exception { //수정
		dao.update(vo);		
	}

	public DeptBoardVO read(int serial) throws Exception { //읽기
		return dao.read(serial);
	}

	public void remove(int serial) throws Exception { //삭제
		dao.delete(serial);		
	}

	public List<DeptBoardVO> listAll() throws Exception { //전체출력		
		return dao.listAll();
	}

	public List<DeptBoardVO> listCriteria(Criteria cri) throws Exception { //특정페이지조히
		return dao.listCriteria(cri);
	}

	public int listCount() throws Exception { //전체 카운트
		return dao.listcount();
	}

	public List<DeptBoardVO> listSearch(SearchCriteria cri) throws Exception { //검색어 출려	
		return dao.listSearch(cri);
	}

	public int SearchCount(SearchCriteria cri) throws Exception { //검색어 카운트		
		return dao.SearchCount(cri);
	}
}
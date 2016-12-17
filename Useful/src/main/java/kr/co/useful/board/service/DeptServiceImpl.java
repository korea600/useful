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

	public void create(DeptBoardVO vo) throws Exception { //���
		dao.create(vo);		
	}

	public void modify(DeptBoardVO vo) throws Exception { //����
		dao.update(vo);		
	}

	public DeptBoardVO read(int serial) throws Exception { //�б�
		return dao.read(serial);
	}

	public void remove(int serial) throws Exception { //����
		dao.delete(serial);		
	}

	public List<DeptBoardVO> listAll() throws Exception { //��ü���		
		return dao.listAll();
	}

	public List<DeptBoardVO> listCriteria(Criteria cri) throws Exception { //Ư������������
		return dao.listCriteria(cri);
	}

	public int listCount() throws Exception { //��ü ī��Ʈ
		return dao.listcount();
	}

	public List<DeptBoardVO> listSearch(SearchCriteria cri) throws Exception { //�˻��� ���	
		return dao.listSearch(cri);
	}

	public int SearchCount(SearchCriteria cri) throws Exception { //�˻��� ī��Ʈ		
		return dao.SearchCount(cri);
	}
}
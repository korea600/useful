package kr.co.useful.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	private NoticeDAO dao;

	public void create(NoticeVO vo) throws Exception { //등록
		dao.create(vo);
	}

	public void modify(NoticeVO vo) throws Exception { //수정
		dao.update(vo);
	}

	public NoticeVO read(int serial) throws Exception { //읽기
		return dao.read(serial);
	}

	public void remove(int serial,int empno) throws Exception { //삭제
		dao.delete(serial,empno);
	}

	public List<NoticeVO> listAll() throws Exception { //전체리스트 조회
		return dao.listAll();
	}

	public List<NoticeVO> listCriteria(Criteria cri) throws Exception { //특정페이지 조회
		return dao.listCriteria(cri);
	}

	public int listCount() throws Exception { //전체 카운트
		return dao.listcount();
	}

	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception { //검색후 리스트
		return dao.listSearch(cri);
	}

	public int SearchCount(SearchCriteria cri) throws Exception { //검색후 카운트
		return dao.SearchCount(cri);
	}

	public List<NoticeVO> mainlist() throws Exception {
		return dao.mainlist();
	}

	public void viewcnt(int serial) throws Exception {
		dao.viewcnt(serial);	
	}

	public List<NoticeVO> list_cut() throws Exception {
		return dao.list_cut();
	}

	public String save_file_name(int serial) throws Exception {
		return dao.save_file_name(serial);
	}

}

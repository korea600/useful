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
	@Override
	public void create(NoticeVO vo) throws Exception { //등록
		dao.create(vo);
		
	}

	@Override
	public void modify(NoticeVO vo) throws Exception { //수정
		dao.update(vo);
		
	}

	@Override
	public NoticeVO read(int serial) throws Exception { //읽기
		
		return dao.read(serial);
	}

	@Override
	public void remove(NoticeVO vo) throws Exception { //삭제
		dao.delete(vo);
		
	}

	@Override
	public List<NoticeVO> listAll() throws Exception { //전체출력
		
		return dao.listAll();
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception { //특정페이지조히
	
		return dao.listCriteria(cri);
	}

	@Override
	public int listCount() throws Exception { //전체 카운트
		// TODO Auto-generated method stub
		return dao.listcount();
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception { //검색어 출려
	
		return dao.listSearch(cri);
	}

	@Override
	public int SearchCount(SearchCriteria cri) throws Exception { //검색어 카운트
		
		return dao.SearchCount(cri);
	}

	@Override
	public List<NoticeVO> mainlist() throws Exception {
		// TODO Auto-generated method stub
		return dao.mainlist();
	}

	@Override
	public void viewcnt(int serial) throws Exception {
		dao.viewcnt(serial);
		
	}

	@Override
	public List<NoticeVO> list_cut() throws Exception {
		// TODO Auto-generated method stub
		return dao.list_cut();
	}

	@Override
	public String save_file_name(int serial) throws Exception {
		// TODO Auto-generated method stub
		return dao.save_file_name(serial);
	}

}

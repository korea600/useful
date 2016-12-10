package kr.co.useful.board.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import kr.co.useful.board.domain.*;
import kr.co.useful.board.persistence.*;
@Service
public class BoardServiceImpl implements BoardService {
@Inject
private BoardDAO dao;

	@Override
	public void insert(BoardVO vo) throws Exception {
		dao.create(vo);

	}

	@Override
	public BoardVO read(int serial) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(serial);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);

	}

	@Override
	public void delete(int serial) throws Exception {
		dao.delete(serial);

	}

	@Override
	public List<BoardVO> readAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.readAll();
	}

	@Override
	public int boardTotalcount() throws Exception {
		// TODO Auto-generated method stub
		return dao.boardTotalCount();
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listFindCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listFindCount(cri);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public void viewcnt(int serial) throws Exception {
		dao.viewcnt(serial);
		
	}

	@Override
	public List<BoardVO> select_cut_list() throws Exception {
		// TODO Auto-generated method stub
		return dao.select_cut_list();
	}

	@Override
	public int reply_cut() throws Exception {
		// TODO Auto-generated method stub
		return dao.reply_count();
	}

	@Override
	public void fileupload(String originalfileName, String saveFileName, long fileSize) throws Exception {
		dao.fileupload(originalfileName, saveFileName, fileSize);
		
	}

	@Override
	public String sava_File_name(int serial) throws Exception {
		// TODO Auto-generated method stub
		return dao.Sava_File_name(serial);
	}

}

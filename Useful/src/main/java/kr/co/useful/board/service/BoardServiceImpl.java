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

	public void insert(BoardVO vo) throws Exception {
		dao.create(vo);
	}

	public BoardVO read(int serial) throws Exception {
		return dao.read(serial);
	}

	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	public void delete(int serial) throws Exception {
		dao.delete(serial);
	}

	public List<BoardVO> readAll() throws Exception {
		return dao.readAll();
	}

	public int boardTotalcount() throws Exception {
		return dao.boardTotalCount();
	}

	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	public int listFindCount(SearchCriteria cri) throws Exception {
		return dao.listFindCount(cri);
	}

	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	public void viewcnt(int serial) throws Exception {
		dao.viewcnt(serial);		
	}

	public List<BoardVO> select_cut_list() throws Exception {
		return dao.select_cut_list();
	}

	public int reply_cut() throws Exception {
		return dao.reply_count();
	}

	public void fileupload(String originalfileName, String saveFileName, long fileSize) throws Exception {
		dao.fileupload(originalfileName, saveFileName, fileSize);
	}

	public String sava_File_name(int serial) throws Exception {
		return dao.Sava_File_name(serial);
	}

}

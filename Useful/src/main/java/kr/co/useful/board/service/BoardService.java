package kr.co.useful.board.service;

import java.util.*;

import kr.co.useful.board.domain.*;

public interface BoardService {
	public void insert(BoardVO vo)throws Exception;
	public BoardVO read(int serial)throws Exception;
	public void modify(BoardVO vo)throws Exception;
	public void delete(int serial)throws Exception;
	public void viewcnt(int serial)throws Exception;
	public List<BoardVO> readAll()throws Exception;
	public int boardTotalcount()throws Exception;
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	public int listFindCount(SearchCriteria cri)throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public List<BoardVO> select_cut_list()throws Exception;
}

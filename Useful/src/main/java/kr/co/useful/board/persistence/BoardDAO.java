package kr.co.useful.board.persistence;

import java.util.*;

import kr.co.useful.board.domain.*;

public interface BoardDAO {

	public void create(BoardVO vo)throws Exception;
	public BoardVO read(int serial)throws Exception;
	public void update(BoardVO vo)throws Exception;
	public void delete(int serial)throws Exception;
	public void viewcnt(int serial)throws Exception;
	public List<BoardVO> readAll()throws Exception;
	public int boardTotalCount()throws Exception; //게시판 전체수
	public List<BoardVO> listCriteria(Criteria cri) throws Exception; //특정페이지조회
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception; //검색어조회
	public int listFindCount(SearchCriteria cri)throws Exception; //검색어조회수
	public List<BoardVO> select_cut_list()throws Exception;//리스트 컷
	public int reply_count()throws Exception;
}

package kr.co.useful.board.persistence;

import java.util.*;

import kr.co.useful.board.domain.*;

public interface BoardDAO {

	public void create(BoardVO vo)throws Exception;
	public BoardVO read(int serial)throws Exception;
	public void update(BoardVO vo)throws Exception;
	public void delete(int serial)throws Exception;
	public List<BoardVO> readAll()throws Exception;
	public int boardTotalCount()throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	public int listFindCount(SearchCriteria cri)throws Exception;
	
}

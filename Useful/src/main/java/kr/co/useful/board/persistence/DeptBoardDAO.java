package kr.co.useful.board.persistence;

import java.util.List;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.DeptBoardVO;
import kr.co.useful.board.domain.SearchCriteria;

public interface DeptBoardDAO {
	public void create(DeptBoardVO vo)throws Exception;
	public DeptBoardVO read(int serial)throws Exception;
	public void update(DeptBoardVO vo)throws Exception;
	public void delete(int serial)throws Exception;
	public List<DeptBoardVO> listAll()throws Exception;
	public int listcount()throws Exception;
	public List<DeptBoardVO> listSearch(SearchCriteria cri)throws Exception;
	public int SearchCount(SearchCriteria cri)throws Exception;
	public List<DeptBoardVO> listCriteria(Criteria cri)throws Exception;
}

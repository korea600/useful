package kr.co.useful.board.service;

import java.util.List;

import kr.co.useful.board.domain.AnonymityVO;
import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.SearchCriteria;

public interface AnonymityService {
	public void create(AnonymityVO vo)throws Exception;
	public AnonymityVO read(int serial)throws Exception;
	public void update(AnonymityVO vo)throws Exception;
	public void delete(int serial)throws Exception;
	public void viewcnt(int serial)throws Exception;
	public List<AnonymityVO> readAll()throws Exception;
	public int boardTotalCount()throws Exception; 
	public List<AnonymityVO> listCriteria(Criteria cri) throws Exception;
	public List<AnonymityVO> listSearch(SearchCriteria cri)throws Exception; 
	public int listFindCount(SearchCriteria cri)throws Exception; 
	public List<AnonymityVO> list_cot()throws Exception;
}

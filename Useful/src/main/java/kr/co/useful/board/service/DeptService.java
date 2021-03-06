package kr.co.useful.board.service;

import java.util.List;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.DeptBoardVO;
import kr.co.useful.board.domain.SearchCriteria;

public interface DeptService {
	public void create(DeptBoardVO vo)throws Exception; //생성
	public void modify(DeptBoardVO vo)throws Exception; //수정
	public DeptBoardVO read(int serial)throws Exception; //읽기
	public void remove(int serial)throws Exception; //삭제
	public List<DeptBoardVO> listAll()throws Exception; //전체출력
	public List<DeptBoardVO> listCriteria(Criteria cri)throws Exception; //페이지조회
	public int listCount()throws Exception;  //전체카운트
	public List<DeptBoardVO> listSearch(SearchCriteria cri)throws Exception; //리스트검색
	public int SearchCount(SearchCriteria cri)throws Exception; //검색후 카운트
}

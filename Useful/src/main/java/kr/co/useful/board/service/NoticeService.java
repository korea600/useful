package kr.co.useful.board.service;

import java.util.List;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.SearchCriteria;

public interface NoticeService {
public void create(NoticeVO vo)throws Exception; //생성	
public void modify(NoticeVO vo)throws Exception; // 수정
public NoticeVO read(int serial)throws Exception; //일기
public void remove(int serial)throws Exception; //삭제
public List<NoticeVO> listAll()throws Exception; //전체 출력
public List<NoticeVO> listCriteria(Criteria cri)throws Exception; // 페이지조히
public int listCount()throws Exception;  //전체 카운트
public List<NoticeVO> listSearch(SearchCriteria cri)throws Exception; //리스트검색
public int SearchCount(SearchCriteria cri)throws Exception; //검색어 카운트
public List<NoticeVO> mainlist()throws Exception;
public void viewcnt(int serial)throws Exception; //조회수 카운트
}

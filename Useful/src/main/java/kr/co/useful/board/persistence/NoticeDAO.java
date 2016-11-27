package kr.co.useful.board.persistence;

import java.util.List;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.SearchCriteria;

public interface NoticeDAO {
public void create(NoticeVO vo)throws Exception;
public NoticeVO read(int serial)throws Exception;
public void update(NoticeVO vo)throws Exception;
public void delete(int serial)throws Exception;
public List<NoticeVO> listAll()throws Exception;
public int listcount()throws Exception;
public List<NoticeVO> listSearch(SearchCriteria cri)throws Exception;
public int SearchCount(SearchCriteria cri)throws Exception;
public List<NoticeVO> listCriteria(Criteria cri)throws Exception;
public List<NoticeVO> mainlist()throws Exception;

}

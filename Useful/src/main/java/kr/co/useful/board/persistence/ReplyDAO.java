package kr.co.useful.board.persistence;

import java.util.List;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.ReplyVO;

public interface ReplyDAO {
public List<ReplyVO> listAll(int serial)throws Exception;
public List<ReplyVO> listPage(int serial,Criteria cri)throws Exception;
public int count(int serial)throws Exception;
public void create(ReplyVO vo)throws Exception;
public void update(ReplyVO vo)throws Exception;
//public void delete(int serial,int rno)throws Exception;
public void delete(ReplyVO vo)throws Exception;
public int getno(int rno)throws Exception;
public ReplyVO select(ReplyVO vo)throws Exception;
}

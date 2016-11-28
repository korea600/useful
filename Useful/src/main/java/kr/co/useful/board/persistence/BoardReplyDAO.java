package kr.co.useful.board.persistence;

import java.util.*;

import kr.co.useful.board.domain.*;

public interface BoardReplyDAO {
public void create(ReplyVO vo)throws Exception;
public void update(ReplyVO vo)throws Exception;
public void delete(int serial)throws Exception;
public List<ReplyVO> replyAll(int serial)throws Exception;
public List<ReplyVO> replylistCriteria(Criteria cri,int serial)throws Exception;
public int replytotalcount()throws Exception;
public int getserial(int rno)throws Exception;
}

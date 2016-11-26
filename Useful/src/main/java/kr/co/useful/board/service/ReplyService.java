package kr.co.useful.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> listAll(int serial)throws Exception;
	public List<ReplyVO> listAllPage(int serial,Criteria cri)throws Exception;
	public int count(int serial)throws Exception;
	public void create(ReplyVO vo)throws Exception;
	public void update(ReplyVO vo)throws Exception;
	public void delete(int serial)throws Exception;
}

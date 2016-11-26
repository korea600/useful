package kr.co.useful.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.ReplyVO;
import kr.co.useful.board.persistence.ReplyDAO;
@Service
public class ReplyServiceImpl implements ReplyService {
@Inject
private ReplyDAO dao;
	@Override
	public List<ReplyVO> listAll(int serial) throws Exception { //댓글전체출력
		// TODO Auto-generated method stub
		return dao.listAll(serial);
	}

	@Override
	public List<ReplyVO> listAllPage(int serial, Criteria cri) throws Exception { //댓글페이지처리
		// TODO Auto-generated method stub
		return dao.listAllPage(serial, cri);
	}

	@Override
	public int count(int serial) throws Exception { //댓글 카운트
		// TODO Auto-generated method stub
		return dao.count(serial);
	}

	@Override
	public void create(ReplyVO vo) throws Exception { //댓글생성
	dao.create(vo);

	}

	@Override
	public void update(ReplyVO vo) throws Exception { //댓글 수정
		dao.update(vo);

	}

	@Override
	public void delete(int serial) throws Exception { //댓글 삭제
		dao.delete(serial);

	}

}

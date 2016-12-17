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

	public List<ReplyVO> listAll(int serial) throws Exception {
		return dao.listAll(serial);
	}

	public List<ReplyVO> listPage(int serial, Criteria cri) throws Exception {
		return dao.listPage(serial, cri);
	}

	public int count(int serial) throws Exception {
		return dao.count(serial);
	}

	public void create(ReplyVO vo) throws Exception {
		dao.create(vo);		
	}

	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);		
	}

	public void delete(ReplyVO vo) throws Exception {
		dao.delete(vo);
	}

	public int getno(int rno) throws Exception {
		return dao.getno(rno);
	}

	public String idcheck(int empno) throws Exception {
		return dao.idcheck(empno);
	}

}

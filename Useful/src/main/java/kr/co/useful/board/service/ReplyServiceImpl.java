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
public List<ReplyVO> listAll(int serial) throws Exception {
	// TODO Auto-generated method stub
	return dao.listAll(serial);
}

@Override
public List<ReplyVO> listPage(int serial, Criteria cri) throws Exception {
	// TODO Auto-generated method stub
	return dao.listPage(serial, cri);
}

@Override
public int count(int serial) throws Exception {
	// TODO Auto-generated method stub
	return dao.count(serial);
}

@Override
public void create(ReplyVO vo) throws Exception {
	dao.create(vo);
	
}

@Override
public void update(ReplyVO vo) throws Exception {
	dao.update(vo);
	
}

@Override
public void delete(ReplyVO vo) throws Exception {
	dao.delete(vo);
	
}

@Override
public int getno(int rno) throws Exception {
	// TODO Auto-generated method stub
	return dao.getno(rno);
}

@Override
public String idcheck(int empno) throws Exception {
	// TODO Auto-generated method stub
	return dao.idcheck(empno);
}
	

}

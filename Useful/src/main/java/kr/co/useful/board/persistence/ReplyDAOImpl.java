package kr.co.useful.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.ReplyVO;
@Repository
public class ReplyDAOImpl implements ReplyDAO {
@Inject
private SqlSession session;
	@Override
	public List<ReplyVO> listAll(int serial) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("board_reply.list", serial);
	}//전체 댓글보기

	@Override
	public List<ReplyVO> listPage(int serial, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("board_reply.list", serial, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}//댓글 게시판 처럼 페이지처리

	@Override
	public int count(int serial) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("board_reply.count", serial);
	}//댓글수

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert("board_reply.create", vo);

	}//댓글쓰기

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update("board_reply.update", vo);

	}//댓글수정



	@Override
	public void delete(ReplyVO vo) throws Exception {
		session.delete("board_reply.delete", vo);
		
	}

	@Override
	public int getno(int rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("board_reply.getbno", rno);
	}

}

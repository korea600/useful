package kr.co.useful.board.persistence;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.ReplyVO;

@Repository
public class ReplyNoticeDAOImpl implements RelyNoticeDAO {
	
	@Inject
	private SqlSession session;
	
	public List<ReplyVO> listAll(int serial) throws Exception {
		return session.selectList("board_reply_notice.list", serial);
	}

	public List<ReplyVO> listPage(int serial, Criteria cri) throws Exception {
		return session.selectList("board_reply_notice.list", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int count(int serial) throws Exception {
		return session.selectOne("board_reply_notice.count", serial);
	}

	public void create(ReplyVO vo) throws Exception {
		session.insert("board_reply_notice.create", vo);
	}

	public void update(ReplyVO vo) throws Exception {
		session.update("board_reply_notice.update", vo);
	}

	public void delete(ReplyVO vo) throws Exception {
		session.delete("board_reply_notice.delete", vo);
	}

	public int getno(int rno) throws Exception {
		return session.selectOne("board_reply_notice.getbno", rno);
	}

	public ReplyVO select(ReplyVO vo) throws Exception {
		return session.selectOne("board_reply_notice.select", vo);
	}

	public String idcheck(int empno) throws Exception {
		return session.selectOne("board_reply_notice.id_check", empno);
	}

}

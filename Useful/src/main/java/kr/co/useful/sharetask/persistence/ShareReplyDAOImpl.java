package kr.co.useful.sharetask.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.ShareReplyVO;

@Repository
public class ShareReplyDAOImpl implements ShareReplyDAO {

	@Inject
	SqlSession sqs;

	public List<ShareReplyVO> list(int bno) throws Exception {
		return sqs.selectList("ShareTaskReply.replyList", bno);
	}

	public void create(ShareReplyVO vo) throws Exception {
		sqs.insert("ShareTaskReply.plusReply", vo);
	}

	public void update(ShareReplyVO vo) throws Exception {
		sqs.update("ShareTaskReply.changeReply", vo);
	}

	public void delete(int rno) throws Exception {
		sqs.delete("ShareTaskReply.deleteReply", rno);
	}

	public List<ShareReplyVO> listPage(int bno, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqs.selectList("ShareTaskReply.replyList",bno, bound);
	}

	public int count(int bno) throws Exception {
		return sqs.selectOne("ShareTaskReply.countReply", bno);
	}

	public int getBno(int rno) throws Exception {
		return sqs.selectOne("ShareTaskReply.eqBno", rno);
	}

}

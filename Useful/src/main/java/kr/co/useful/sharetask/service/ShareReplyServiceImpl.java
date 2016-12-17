package kr.co.useful.sharetask.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.ShareReplyVO;
import kr.co.useful.sharetask.persistence.ShareReplyDAO;

@Service
public class ShareReplyServiceImpl implements ShareReplyService {

	@Inject
	private ShareReplyDAO dao;

	public List<ShareReplyVO> listReply(int bno) throws Exception {
		return dao.list(bno);
	}

	public void addReply(ShareReplyVO vo) throws Exception {
		dao.create(vo);
	}

	public void modifyReply(ShareReplyVO vo) throws Exception {
		dao.update(vo);
	}

	public void removeReply(int rno) throws Exception {
		dao.delete(rno);
	}

	public List<ShareReplyVO> listReplyPage(int bno, Criteria cri) throws Exception {
		return dao.listPage(bno, cri);
	}

	public int count(int bno) throws Exception {
		return dao.count(bno);
	}

}

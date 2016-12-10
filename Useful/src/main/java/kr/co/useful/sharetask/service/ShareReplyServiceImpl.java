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

	@Override
	public List<ShareReplyVO> listReply(int bno) throws Exception {
		
		return dao.list(bno);
	}

	@Override
	public void addReply(ShareReplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void modifyReply(ShareReplyVO vo) throws Exception {
		dao.update(vo);

	}

	@Override
	public void removeReply(int rno) throws Exception {
		dao.delete(rno);

	}

	@Override
	public List<ShareReplyVO> listReplyPage(int bno, Criteria cri) throws Exception {
	
		return dao.listPage(bno, cri);
	}

	@Override
	public int count(int bno) throws Exception {
		
		return dao.count(bno);
	}

}

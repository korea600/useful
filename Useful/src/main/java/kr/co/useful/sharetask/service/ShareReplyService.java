package kr.co.useful.sharetask.service;

import java.util.List;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.ShareReplyVO;



public interface ShareReplyService {
	
	public List<ShareReplyVO> listReply(int bno)throws Exception;
	public void addReply(ShareReplyVO vo)throws Exception;
	public void modifyReply(ShareReplyVO vo)throws Exception;
	public void removeReply(int rno)throws Exception;
	
	public List<ShareReplyVO> listReplyPage(int bno, Criteria cri)throws Exception;
	public int count(int bno)throws Exception;
	
	


}

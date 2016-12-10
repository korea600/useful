package kr.co.useful.sharetask.persistence;

import java.util.List;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.ShareReplyVO;



public interface ShareReplyDAO {
	
	
	// 체 댓글 조회
		public List<ShareReplyVO> list(int bno) throws Exception;
		
	   //댓글 입력
		public void create(ShareReplyVO vo) throws Exception;
		
	   //댓글 수정
		public void update(ShareReplyVO vo) throws Exception;
		
	   //댓글 삭제
		public void delete(int rno) throws Exception;

	  //특정 게시물 번호에 대한 페이지 처리한 댓글 조회
		public List<ShareReplyVO> listPage(int bno, Criteria cri)throws Exception;
		
	  //특정 게시물 번호에 대한 전체 댓글 수 조회
		public int count(int bno)throws Exception;
		
		//삭제될 댓글이 속한 게시물 번호 리턴 --->게시물의 댓글 수를 감소하기 위해 (rno가 속한 bno)
	    public int getBno(int rno)throws Exception;
}

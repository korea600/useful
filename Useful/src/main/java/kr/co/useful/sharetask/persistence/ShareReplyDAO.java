package kr.co.useful.sharetask.persistence;

import java.util.List;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.ShareReplyVO;



public interface ShareReplyDAO {
	
	
	// ü ��� ��ȸ
		public List<ShareReplyVO> list(int bno) throws Exception;
		
	   //��� �Է�
		public void create(ShareReplyVO vo) throws Exception;
		
	   //��� ����
		public void update(ShareReplyVO vo) throws Exception;
		
	   //��� ����
		public void delete(int rno) throws Exception;

	  //Ư�� �Խù� ��ȣ�� ���� ������ ó���� ��� ��ȸ
		public List<ShareReplyVO> listPage(int bno, Criteria cri)throws Exception;
		
	  //Ư�� �Խù� ��ȣ�� ���� ��ü ��� �� ��ȸ
		public int count(int bno)throws Exception;
		
		//������ ����� ���� �Խù� ��ȣ ���� --->�Խù��� ��� ���� �����ϱ� ���� (rno�� ���� bno)
	    public int getBno(int rno)throws Exception;
}

package kr.co.useful.sharetask.service;

import java.util.List;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.SearchCriteria;
import kr.co.useful.sharetask.domain.ShareTaskVO;



public interface ShareTaskService {

	public void regist(ShareTaskVO vo) throws Exception;

	public ShareTaskVO read(int bno) throws Exception;

	public void change(ShareTaskVO vo) throws Exception;

	public void remove(int bno) throws Exception;

	public List<ShareTaskVO> listAll() throws Exception;

	public List<ShareTaskVO> listCriteria(Criteria cri) throws Exception;

	public int totalListCount() throws Exception;
	
	
	
    //�˻�� ���� ����Ʈ ��ȸ
    public List<ShareTaskVO> listSearchCriteria(SearchCriteria cri)throws Exception;
    
    public int listSearchCount(SearchCriteria cri)throws Exception;
    
    //������ ������
  		public ShareTaskVO prevRead(int bno, int deptno) throws Exception;
  		
  		public ShareTaskVO nextRead(int bno, int deptno) throws Exception;
  		//��ȸ��
  		public void viewcnt(int bno)throws Exception;
    
}

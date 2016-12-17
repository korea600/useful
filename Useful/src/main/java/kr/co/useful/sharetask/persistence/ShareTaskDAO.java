package kr.co.useful.sharetask.persistence;

import java.util.List;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.ShareTaskVO;
import kr.co.useful.sharetask.domain.SearchCriteria;

public interface ShareTaskDAO {
    // �Է�
	public void create(ShareTaskVO vo) throws Exception;

	// �Ѱ���ȸ
	public ShareTaskVO read(int bno) throws Exception;

	// ����
	public void update(ShareTaskVO vo) throws Exception;

	// ����
	public void delete(int bno) throws Exception;

	// ��ü��ȸ
	public List<ShareTaskVO> listAll() throws Exception;
		
	public List<ShareTaskVO> listCriteria(Criteria cri) throws Exception;
		
	public int totalListCount() throws Exception;
		
	//�˻�����Ʈ
	public List<ShareTaskVO> listSearch(SearchCriteria cri) throws Exception;
		
	//�˻�����Ʈ ��
	public int listSearchCount(SearchCriteria cri)throws Exception;
		
	//��ȸ��
	public void viewcnt(int bno)throws Exception;
		
	//������
	public ShareTaskVO prevRead(int bno,  int deptno) throws Exception;
		
	//������
	public ShareTaskVO nextRead(int bno,  int deptno) throws Exception;
		
	public List<ShareTaskVO> cutList(int deptno)throws Exception;
		
}

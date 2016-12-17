package kr.co.useful.sharetask.persistence;

import java.util.List;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.ShareTaskVO;
import kr.co.useful.sharetask.domain.SearchCriteria;

public interface ShareTaskDAO {
    // 입력
	public void create(ShareTaskVO vo) throws Exception;

	// 한개조회
	public ShareTaskVO read(int bno) throws Exception;

	// 수정
	public void update(ShareTaskVO vo) throws Exception;

	// 삭제
	public void delete(int bno) throws Exception;

	// 전체조회
	public List<ShareTaskVO> listAll() throws Exception;
		
	public List<ShareTaskVO> listCriteria(Criteria cri) throws Exception;
		
	public int totalListCount() throws Exception;
		
	//검색리스트
	public List<ShareTaskVO> listSearch(SearchCriteria cri) throws Exception;
		
	//검색리스트 수
	public int listSearchCount(SearchCriteria cri)throws Exception;
		
	//조회수
	public void viewcnt(int bno)throws Exception;
		
	//이전글
	public ShareTaskVO prevRead(int bno,  int deptno) throws Exception;
		
	//다음글
	public ShareTaskVO nextRead(int bno,  int deptno) throws Exception;
		
	public List<ShareTaskVO> cutList(int deptno)throws Exception;
		
}

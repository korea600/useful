package kr.co.useful.sharetask.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.SearchCriteria;
import kr.co.useful.sharetask.domain.ShareTaskVO;
import kr.co.useful.sharetask.persistence.ShareTaskDAO;

@Service
public class ShareTaskServiceImpl implements ShareTaskService{
	
	@Inject
	private ShareTaskDAO dao;

	@Override
	public void regist(ShareTaskVO vo) throws Exception {
	  dao.create(vo);
		
	}

	@Override
	public ShareTaskVO read(int bno) throws Exception {
		
		return dao.read(bno);
	}

	@Override
	public void change(ShareTaskVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void remove(int bno) throws Exception {
		
		dao.delete(bno);
	}

	@Override
	public List<ShareTaskVO> listAll() throws Exception {
		
		return dao.listAll();
	}

	@Override
	public List<ShareTaskVO> listCriteria(Criteria cri) throws Exception {
		
		return dao.listCriteria(cri);
	}

	@Override
	public int totalListCount() throws Exception {
		
		return dao.totalListCount();
	}

	@Override
	public List<ShareTaskVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

	@Override
	public ShareTaskVO prevRead(int bno, int deptno) throws Exception {
		
		return dao.prevRead(bno, deptno);
	}

	@Override
	public ShareTaskVO nextRead(int bno, int deptno) throws Exception {
	
		return dao.nextRead(bno, deptno);
	}

	@Override
	public void viewcnt(int bno) throws Exception {
		
		dao.viewcnt(bno);
		
	}

}

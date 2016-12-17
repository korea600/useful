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

	public void regist(ShareTaskVO vo) throws Exception {
		dao.create(vo);
	}

	public ShareTaskVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	public void change(ShareTaskVO vo) throws Exception {
		dao.update(vo);
	}

	public void remove(int bno) throws Exception {
		dao.delete(bno);
	}

	public List<ShareTaskVO> listAll() throws Exception {
		return dao.listAll();
	}

	public List<ShareTaskVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	public int totalListCount() throws Exception {
		return dao.totalListCount();
	}

	public List<ShareTaskVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	public ShareTaskVO prevRead(int bno, int deptno) throws Exception {
		return dao.prevRead(bno, deptno);
	}

	public ShareTaskVO nextRead(int bno, int deptno) throws Exception {
		return dao.nextRead(bno, deptno);
	}

	public void viewcnt(int bno) throws Exception {
		dao.viewcnt(bno);
	}

	public List<ShareTaskVO> cutList(int deptno) throws Exception {
		return dao.cutList(deptno);
	}

}

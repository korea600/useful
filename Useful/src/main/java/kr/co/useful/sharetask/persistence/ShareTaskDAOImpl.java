package kr.co.useful.sharetask.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.SearchCriteria;
import kr.co.useful.sharetask.domain.ShareTaskVO;

@Repository
public class ShareTaskDAOImpl implements ShareTaskDAO {

	@Inject
	private SqlSession sqs;
	
	public void create(ShareTaskVO vo) throws Exception {
		sqs.insert("sharetask.create",vo);
	}

	public ShareTaskVO read(int bno) throws Exception {
		return sqs.selectOne("sharetask.oneRead", bno);
	}

	public void update(ShareTaskVO vo) throws Exception {
		sqs.update("sharetask.update", vo);
	}

	public void delete(int bno) throws Exception {
		sqs.delete("sharetask.delete", bno);
	}

	public List<ShareTaskVO> listAll() throws Exception {
		RowBounds bound = new RowBounds(0,10);
		return sqs.selectList("sharetask.listAll", bound);
	}

	public List<ShareTaskVO> listCriteria(Criteria cri) throws Exception {
		return sqs.selectList("sharetask.listAll", null, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int totalListCount() throws Exception {
		return sqs.selectOne("sharetask.shareListCount");
	}//전체리스트수
	
	//검색 리스트 수 
	public List<ShareTaskVO> listSearch(SearchCriteria cri) throws Exception {
		return sqs.selectList("sharetask.listSearch", cri, 
				               new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqs.selectOne("sharetask.listSearchCount", cri);
	}

	public ShareTaskVO prevRead(int bno, int deptno) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("deptno", deptno);
		return sqs.selectOne("sharetask.prevShare", map);
	}

	public ShareTaskVO nextRead(int bno, int deptno) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("deptno", deptno);
		return sqs.selectOne("sharetask.nextShare", map);
	}

	public void viewcnt(int bno) throws Exception {
		sqs.update("sharetask.viewcnt", bno);
	}

	public List<ShareTaskVO> cutList(int deptno) throws Exception {
		return sqs.selectList("sharetask.cutList", deptno);
	}
}

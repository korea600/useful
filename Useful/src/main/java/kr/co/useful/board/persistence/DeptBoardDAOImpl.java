package kr.co.useful.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.DeptBoardVO;
import kr.co.useful.board.domain.SearchCriteria;

@Repository
public class DeptBoardDAOImpl implements DeptBoardDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	//게시물 추가
	public void create(DeptBoardVO vo) throws Exception {
		sqlsession.insert("deptboard.insert", vo);
	}

	//게시물 선택보기
	public DeptBoardVO read(int serial) throws Exception {
		return sqlsession.selectOne("deptboard.selectRead", serial);
	}

	public void update(DeptBoardVO vo) throws Exception {
		sqlsession.update("deptboard.update", vo);
	}

	public void delete(int serial) throws Exception {
		sqlsession.delete("deptboard.delete", serial);
	}

	public List<DeptBoardVO> listAll() throws Exception {
		return sqlsession.selectList("deptboard.listAll");
	}

	public List<DeptBoardVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlsession.selectList("deptboard.listSearch", cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int SearchCount(SearchCriteria cri) throws Exception {
		return sqlsession.selectOne("deptboard.listcount", cri);
	}

	public List<DeptBoardVO> listCriteria(Criteria cri) throws Exception {
		return sqlsession.selectList("deptboard.listAll", null, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int listcount() throws Exception {
		return sqlsession.selectOne("deptboard.count");
	}
}

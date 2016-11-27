package kr.co.useful.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.useful.board.domain.BoardVO;
import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.DeptBoardVO;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.SearchCriteria;

public class DeptBoardDAOImpl implements DeptBoardDAO{
	@Inject
	private SqlSession sqlsession;
	@Override //게시물 추가
	public void create(DeptBoardVO vo) throws Exception {
		sqlsession.insert("deptboard.insert", vo);

	}

	@Override //게시물 선태보기
	public DeptBoardVO read(int serial) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("deptboard.selectRead", serial);
	}

	@Override
	public void update(DeptBoardVO vo) throws Exception {
		sqlsession.update("deptboard.update", vo);

	}

	@Override
	public void delete(int serial) throws Exception {
		sqlsession.delete("deptboard.delete", serial);

	}

	@Override
	public List<DeptBoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("deptboard.listAll");
	}

	@Override
	public List<DeptBoardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("deptboard.listSearch", cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int SearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("deptboard.listcount", cri);
	}

	@Override
	public List<DeptBoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("deptboard.listAll", null, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("deptboard.count");
	}




}

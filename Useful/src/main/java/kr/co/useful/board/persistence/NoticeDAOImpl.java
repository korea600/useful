package kr.co.useful.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.SearchCriteria;
@Repository
public class NoticeDAOImpl implements NoticeDAO {
@Inject
private SqlSession sqlsession;
	@Override //게시물 추가
	public void create(NoticeVO vo) throws Exception {
		sqlsession.insert("notice.insert", vo);

	}

	@Override //게시물 선태보기
	public NoticeVO read(int serial) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("notice.selectRead", serial);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		sqlsession.update("notice.update", vo);

	}

	@Override
	public void delete(int serial) throws Exception {
		sqlsession.delete("notice.delete", serial);

	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("notice.listAll");
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("notice.listSearch", cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int SearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("notice.listcount", cri);
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("notice.listAll", null, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("notice.count");
	}

	@Override
	public List<NoticeVO> mainlist() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("notice.mainlist");
	}

	@Override
	public void viewcnt(int serial) throws Exception {
		sqlsession.insert("notice.viewcnt", serial);
		
	}

}

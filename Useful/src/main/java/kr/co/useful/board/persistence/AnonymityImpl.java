package kr.co.useful.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.board.domain.AnonymityVO;
import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.SearchCriteria;

@Repository
public class AnonymityImpl implements AnonymityDAO{
	
	@Inject
	private SqlSession sqlsesson;
	
	public void create(AnonymityVO vo) throws Exception {
		sqlsesson.insert("anonymity.create", vo);
	}

	public AnonymityVO read(int serial) throws Exception {
		return sqlsesson.selectOne("anonymity.read", serial);
	}

	public void update(AnonymityVO vo) throws Exception {
		sqlsesson.update("anonymity.update", vo);
	}

	public void delete(int serial) throws Exception {
		sqlsesson.delete("anonymity.delete", serial);
	}

	public void viewcnt(int serial) throws Exception {
		sqlsesson.selectOne("anonymity.viewcnt", serial);
	}

	public List<AnonymityVO> readAll() throws Exception {
		return sqlsesson.selectList("anonymity.readAll");
	}

	public int boardTotalCount() throws Exception {
		return sqlsesson.selectOne("anonymity.listcount");
	}

	public List<AnonymityVO> listCriteria(Criteria cri) throws Exception {
		return sqlsesson.selectList("anonymity.readAll", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public List<AnonymityVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlsesson.selectList("anonymity.listSearch", cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int listFindCount(SearchCriteria cri) throws Exception {
		return sqlsesson.selectOne("anonymity.listcount",cri);
	}

	public List<AnonymityVO> list_cut() throws Exception {
		return sqlsesson.selectList("anonymity.main_list_cout");
	}

	public String pass_check(int serial) throws Exception {
		return sqlsesson.selectOne("anonymity.pass_check", serial);
	}

}

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
	@Override
	public void create(AnonymityVO vo) throws Exception {
		sqlsesson.insert("anonymity.create", vo);
		
	}

	@Override
	public AnonymityVO read(int serial) throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectOne("anonymity.read", serial);
	}

	@Override
	public void update(AnonymityVO vo) throws Exception {
		sqlsesson.update("anonymity.update", vo);
		
	}

	@Override
	public void delete(int serial) throws Exception {
		sqlsesson.delete("anonymity.delete", serial);
		
	}

	@Override
	public void viewcnt(int serial) throws Exception {
		sqlsesson.selectOne("anonymity.viewcnt", serial);
		
	}

	@Override
	public List<AnonymityVO> readAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectList("anonymity.readAll");
	}

	@Override
	public int boardTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectOne("anonymity.listcount");
	}

	@Override
	public List<AnonymityVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectList("anonymity.readAll", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public List<AnonymityVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectList("anonymity.listSearch", cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listFindCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectOne("anonymity.listcount",cri);
	}

	@Override
	public List<AnonymityVO> list_cut() throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectList("anonymity.main_list_cout");
	}

	@Override
	public String pass_check(int serial) throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectOne("anonymity.pass_check", serial);
	}

	@Override
	public String save_file_name(int serial) throws Exception {
		// TODO Auto-generated method stub
		return sqlsesson.selectOne("anonymity.savaFile_download", serial);
	}

}

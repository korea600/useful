package kr.co.useful.board.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import kr.co.useful.board.domain.*;
@Repository
public class BoardDAOImpl implements BoardDAO {
@Inject
private SqlSession sqlsession;
	@Override
	public void create(BoardVO vo) throws Exception {
		sqlsession.insert("board.create", vo);

	}

	@Override
	public BoardVO read(int serial) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("board.read", serial);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlsession.update("board.update", vo);

	}

	@Override
	public void delete(int serial) throws Exception {
		sqlsession.delete("board.delete", serial);

	}

	@Override
	public List<BoardVO> readAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("board.readAll");
	}


	@Override
	public int boardTotalCount() throws Exception {
		return sqlsession.selectOne("board.listcount");
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		
		return sqlsession.selectList("board.listSearch", cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listFindCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("board.listcount",cri);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("board.readAll", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public void viewcnt(int serial) throws Exception {
		sqlsession.update("board.viewcnt", serial);
		
	}

	@Override
	public List<BoardVO> select_cut_list() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("board.select_cut_list");
	}

	@Override
	public int reply_count() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("board.listSearch2");
	}

	@Override
	public void fileupload(String originalfileName, String saveFileName, long fileSize) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("originalfileName", originalfileName);
		map.put("saveFileName", saveFileName);
		map.put("fileSize", fileSize);
		sqlsession.insert("board.upload", map);
		
	}


}

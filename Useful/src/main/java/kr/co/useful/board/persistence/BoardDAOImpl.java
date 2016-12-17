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
	
	public void create(BoardVO vo) throws Exception {
		sqlsession.insert("board.create", vo);
	}

	public BoardVO read(int serial) throws Exception {
		return sqlsession.selectOne("board.read", serial);
	}

	public void update(BoardVO vo) throws Exception {
		sqlsession.update("board.update", vo);
	}

	public void delete(int serial) throws Exception {
		sqlsession.delete("board.delete", serial);
	}

	public List<BoardVO> readAll() throws Exception {
		return sqlsession.selectList("board.readAll");
	}

	public int boardTotalCount() throws Exception {
		return sqlsession.selectOne("board.listcount");
	}

	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlsession.selectList("board.listSearch", cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int listFindCount(SearchCriteria cri) throws Exception {
		return sqlsession.selectOne("board.listcount",cri);
	}

	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return sqlsession.selectList("board.readAll", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public void viewcnt(int serial) throws Exception {
		sqlsession.update("board.viewcnt", serial);
	}

	public List<BoardVO> select_cut_list() throws Exception {
		return sqlsession.selectList("board.select_cut_list");
	}

	public int reply_count() throws Exception {
		return sqlsession.selectOne("board.listSearch2");
	}

	public void fileupload(String originalfileName, String saveFileName, long fileSize) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("originalfileName", originalfileName);
		map.put("saveFileName", saveFileName);
		map.put("fileSize", fileSize);
		sqlsession.insert("board.upload", map);
	}

	public String Sava_File_name(int serial) throws Exception {
		return sqlsession.selectOne("board.savaFile_download", serial);
	}
}

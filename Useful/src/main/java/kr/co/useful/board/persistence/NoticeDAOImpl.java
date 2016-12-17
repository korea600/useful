package kr.co.useful.board.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//게시물 추가
	public void create(NoticeVO vo) throws Exception {
		sqlsession.insert("notice.insert", vo);
	}

	//게시물 선택보기
	public NoticeVO read(int serial) throws Exception {
		return sqlsession.selectOne("notice.selectRead", serial);
	}

	public void update(NoticeVO vo) throws Exception {
		sqlsession.update("notice.update", vo);
	}

	public void delete(int serial,int empno) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("serial", serial);
		map.put("empno", empno);
		sqlsession.delete("notice.delete", map);
	}

	public List<NoticeVO> listAll() throws Exception {
		return sqlsession.selectList("notice.listAll");
	}

	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlsession.selectList("notice.listSearch", cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int SearchCount(SearchCriteria cri) throws Exception {
		return sqlsession.selectOne("notice.listcount", cri);
	}

	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return sqlsession.selectList("notice.listAll", null, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int listcount() throws Exception {
		return sqlsession.selectOne("notice.count");
	}

	public List<NoticeVO> mainlist() throws Exception {
		return sqlsession.selectList("notice.mainlist");
	}

	public void viewcnt(int serial) throws Exception {
		sqlsession.insert("notice.viewcnt", serial);
	}	

	public List<NoticeVO> list_cut() throws Exception {
		return sqlsession.selectList("notice.main_list_cut");
	}

	public String save_file_name(int serial) throws Exception {
		return sqlsession.selectOne("notice.savaFile_download", serial);
	}

}

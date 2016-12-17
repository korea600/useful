package kr.co.useful.note.persistence;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.domain.SendVO;

@Repository
public class RecipientDAOImpl implements RecipientDAO {
	
	@Inject
	private SqlSession session;

	public List<RecipientVO> recipient_note_list(int mynoteid) throws Exception {
		return session.selectList("recipien_note.list_note", mynoteid);
	}

	public void create_recipient_note(RecipientVO recipientVO) throws Exception {
		session.insert("recipien_note.create_note_recipient", recipientVO);
	}

	public void create_send_note(SendVO sendVO) throws Exception {
		session.insert("recipien_note.create_send_note", sendVO);
	}

	public void delete_recipient_note(RecipientVO recipientVO) throws Exception {
		session.delete("recipien_note.delete_note", recipientVO);
	}

	public RecipientVO select_recipient_note(RecipientVO recipientVO) throws Exception {
		return session.selectOne("recipien_note.select_note", recipientVO);
	}

	public List<RecipientVO> search_Recipient_note(SearchCriteria cri, int mynoteid) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mynoteid", mynoteid);
		return session.selectList("recipien_note.search_note", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int search_Recipient_count_note(SearchCriteria cri, int mynoteid) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mynoteid", mynoteid);
		return session.selectOne("recipien_note.search_Count_note", map);
	}

	public List<RecipientVO> main_list_cout(int mynoteid) throws Exception {
		return session.selectList("recipien_note.list_note_cout", mynoteid);
	}

}

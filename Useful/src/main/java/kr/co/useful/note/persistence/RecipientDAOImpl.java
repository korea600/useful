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
	@Override
	public List<RecipientVO> recipient_note_list(String mynote) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("recipien_note.list_note", mynote);
	}
	@Override
	public void create_recipient_note(RecipientVO recipientVO) throws Exception {
		session.insert("recipien_note.create_note_recipient", recipientVO);
		
	}
	@Override
	public void create_send_note(SendVO sendVO) throws Exception {
		session.insert("recipien_note.create_send_note", sendVO);
		
	}
	@Override
	public void delete_recipient_note(RecipientVO recipientVO) throws Exception {
		session.delete("recipien_note.delete_note", recipientVO);
		
	}
	@Override
	public RecipientVO select_recipient_note(RecipientVO recipientVO) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectOne("recipien_note.select_note", recipientVO);
	}
	@Override
	public List<RecipientVO> search_Recipient_note(SearchCriteria cri, String mynote) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mynote", mynote);
		return session.selectList("recipien_note.search_note", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}
	@Override
	public int search_Recipient_count_note(SearchCriteria cri, String mynote) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mynote", mynote);
		return session.selectOne("recipien_note.search_Count_note", map);
	}



}

package kr.co.useful.note.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.note.domain.NoteFindUserVO;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.domain.SendVO;

@Repository
public class SendDAOImpl implements SendDAO {
	
	@Inject
	private SqlSession session;

	public List<SendVO> list_note(String mynote) throws Exception {
		return session.selectList("send_note.list_note", mynote);
	}

	public void create_note(SendVO vo) throws Exception {
		session.insert("send_note.create_note", vo);
	}

	public SendVO select_note(SendVO vo) throws Exception {
		return session.selectOne("send_note.select_note", vo);
	}

	public void delete_note(SendVO vo) throws Exception {
		session.delete("send_note.delete_note", vo);
	}

	public int count_note(String mynote) throws Exception {		// 자기쪽지 전체카운트
		return session.selectOne("send_note.count_note", mynote);
	}

	public List<SendVO> search_not(SearchCriteria cri,int myempno) throws Exception {
		// 메시지 검색할때 검색어랑 검색타입 보내는 데 아이디로도 조회 해야되는데 값2개 넘어갈때 어떻게해야될지 물어보기
		Map<String, Object> map=new HashMap<>();
		map.put("cri", cri);
		map.put("myempno", myempno);
		return session.selectList("send_note.search_note", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int search_count_note(SearchCriteria cri,int myempno) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("cri", cri);
		map.put("myempno", myempno);
		return session.selectOne("send_note.search_Count_note", map);
	}

	public List<NoteFindUserVO> find_user_note(SearchCriteria cri) throws Exception {
		return session.selectList("send_note.note_find_user", cri);
	}

	public void recipient_note(RecipientVO recipientVO) throws Exception {
		session.insert("send_note.create_note_recipient", recipientVO);
		
	}

	public int sendemp(String ename) throws Exception {
		return session.selectOne("sendemp", ename);
	}

}

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

	@Override
	public List<SendVO> list_note(String mynote) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("send_note.list_note", mynote);
	}

	@Override
	public void create_note(SendVO vo) throws Exception {
		session.insert("send_note.create_note", vo);

	}

	@Override
	public SendVO select_note(SendVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("send_note.select_note", vo);
	}

	@Override
	public void delete_note(SendVO vo) throws Exception {
		session.delete("send_note.delete_note", vo);

	}

	@Override
	public int count_note(String mynote) throws Exception {
		// TODO Auto-generated method stub 자기쪽지 전체카운트
		return session.selectOne("send_note.count_note", mynote);
	}

	@Override
	public List<SendVO> search_not(SearchCriteria cri,int myempno) throws Exception {
		// 메시지 검색할때 검색어랑 검색타입 보내는 데 아이디로도 조회 해야되는데 값2개 넘어갈때 어떻게해야될지 물어보기
		Map<String, Object> map=new HashMap<>();
		map.put("cri", cri);
		map.put("myempno", myempno);
		return session.selectList("send_note.search_note", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int search_count_note(SearchCriteria cri,int myempno) throws Exception {
		System.out.println("send의 myempno값 = "+myempno);
		Map<String, Object> map=new HashMap<>();
		map.put("cri", cri);
		map.put("myempno", myempno);
		return session.selectOne("send_note.search_Count_note", map);
	}

	@Override
	public List<NoteFindUserVO> find_user_note(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("send_note.note_find_user", cri);
	}

	@Override
	public void recipient_note(RecipientVO recipientVO) throws Exception {
		System.out.println("recivo id값="+recipientVO.getMynoteid());
		System.out.println("recivo name값="+recipientVO.getMynotename());
		System.out.println("recivo값 reciid="+recipientVO.getReciid());
		System.out.println("recivo값 reciname="+recipientVO.getReciname());
		System.out.println("recivo값 recicontent="+recipientVO.getRecontent());
		session.insert("send_note.create_note_recipient", recipientVO);
		
	}

	@Override
	public int sendemp(String ename) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("sendemp", ename);
	}

}

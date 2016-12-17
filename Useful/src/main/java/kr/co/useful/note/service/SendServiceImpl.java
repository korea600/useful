package kr.co.useful.note.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.note.domain.NoteFindUserVO;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.domain.SendVO;
import kr.co.useful.note.persistence.SendDAO;

@Service
public class SendServiceImpl implements SendService {
	
	@Inject
	private SendDAO dao;
	
	public List<SendVO> list_note(String mynote) throws Exception {
		return dao.list_note(mynote);
	}

	public void create_note(SendVO vo) throws Exception {
		dao.create_note(vo);
	}

	public SendVO select_note(SendVO vo) throws Exception {
		return dao.select_note(vo);
	}

	public void delete_note(SendVO vo) throws Exception {
		dao.delete_note(vo);
	}

	public int count_note(String mynote) throws Exception {
		return dao.count_note(mynote);
	}

	public List<SendVO> search_not(SearchCriteria cri,int myempno) throws Exception {
		return dao.search_not(cri,myempno);
	}

	public int search_count_note(SearchCriteria cri,int myempno) throws Exception {
		return dao.search_count_note(cri,myempno);
	}

	public List<NoteFindUserVO> find_user_note(SearchCriteria cri) throws Exception {
		return dao.find_user_note(cri);
	}

	public void recipient_note(RecipientVO recipientVO) throws Exception {
		dao.recipient_note(recipientVO);
	}

	public int sendemp(String ename) throws Exception {
		return dao.sendemp(ename);
	}

}

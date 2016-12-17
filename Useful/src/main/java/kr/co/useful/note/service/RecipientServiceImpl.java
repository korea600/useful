package kr.co.useful.note.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.domain.SendVO;
import kr.co.useful.note.persistence.RecipientDAO;

@Service
public class RecipientServiceImpl implements RecipientService {
	@Inject
	private RecipientDAO redao;

	public List<RecipientVO> recipient_note_list(int mynoteid) throws Exception {
		return redao.recipient_note_list(mynoteid);
	}

	public void create_recipient_note(RecipientVO recipientVO) throws Exception {
		redao.create_recipient_note(recipientVO);
	}

	public void create_send_note(SendVO sendVO) throws Exception {
		redao.create_send_note(sendVO);
	}

	public void delete_recipient_note(RecipientVO recipientVO) throws Exception {
		redao.delete_recipient_note(recipientVO);
	}

	public RecipientVO select_recipient_note(RecipientVO recipientVO) throws Exception {
		return redao.select_recipient_note(recipientVO);
	}

	public List<RecipientVO> search_Recipient_note(SearchCriteria cri, int mynoteid) throws Exception {
		return redao.search_Recipient_note(cri, mynoteid);
	}

	public int search_Recipient_count_note(SearchCriteria cri, int mynoteid) throws Exception {
		return redao.search_Recipient_count_note(cri, mynoteid);
	}

	public List<RecipientVO> main_list_cout(int mynoteid) throws Exception {
		return redao.main_list_cout(mynoteid);
	}

}

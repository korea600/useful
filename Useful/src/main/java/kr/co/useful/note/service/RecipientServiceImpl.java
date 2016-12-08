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
	@Override
	public List<RecipientVO> recipient_note_list(int mynoteid) throws Exception {
		// TODO Auto-generated method stub
		return redao.recipient_note_list(mynoteid);
	}

	@Override
	public void create_recipient_note(RecipientVO recipientVO) throws Exception {
		// TODO Auto-generated method stub
		redao.create_recipient_note(recipientVO);
	}

	@Override
	public void create_send_note(SendVO sendVO) throws Exception {
		redao.create_send_note(sendVO);

	}



	@Override
	public void delete_recipient_note(RecipientVO recipientVO) throws Exception {
		redao.delete_recipient_note(recipientVO);

	}

	@Override
	public RecipientVO select_recipient_note(RecipientVO recipientVO) throws Exception {
		// TODO Auto-generated method stub
		return redao.select_recipient_note(recipientVO);
	}

	@Override
	public List<RecipientVO> search_Recipient_note(SearchCriteria cri, int mynoteid) throws Exception {
		return redao.search_Recipient_note(cri, mynoteid);
	}

	@Override
	public int search_Recipient_count_note(SearchCriteria cri, int mynoteid) throws Exception {
		// TODO Auto-generated method stub
		return redao.search_Recipient_count_note(cri, mynoteid);
	}

}

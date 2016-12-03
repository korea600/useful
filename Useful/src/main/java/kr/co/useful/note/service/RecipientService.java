package kr.co.useful.note.service;

import java.util.List;

import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.domain.SendVO;

public interface RecipientService {
	public List<RecipientVO> recipient_note_list(String mynote)throws Exception;
	public void create_recipient_note(RecipientVO recipientVO)throws Exception;
	public void create_send_note(SendVO sendVO)throws Exception;
	public void select_recipient_note(RecipientVO recipientVO)throws Exception;
	public void delete_recipient_note(RecipientVO recipientVO)throws Exception;
}

package kr.co.useful.note.service;

import java.util.List;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.domain.SendVO;

public interface RecipientService {
	public List<RecipientVO> recipient_note_list(int mynoteid)throws Exception;
	public void create_recipient_note(RecipientVO recipientVO)throws Exception;
	public void create_send_note(SendVO sendVO)throws Exception;
	public RecipientVO select_recipient_note(RecipientVO recipientVO)throws Exception;
	public void delete_recipient_note(RecipientVO recipientVO)throws Exception;
	public List<RecipientVO> search_Recipient_note(SearchCriteria cri,int mynoteid)throws Exception;
	public int search_Recipient_count_note(SearchCriteria cri,int mynoteid)throws Exception;
	public List<RecipientVO> main_list_cout(int mynoteid)throws Exception;
}

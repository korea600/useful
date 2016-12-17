package kr.co.useful.note.persistence;

import java.util.List;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.note.domain.NoteFindUserVO;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.domain.SendVO;

public interface SendDAO {
	public List<SendVO> list_note(String mynote)throws Exception;
	public void create_note(SendVO vo)throws Exception;
	public SendVO select_note(SendVO vo)throws Exception;
	public void delete_note(SendVO vo)throws Exception;
	public int count_note(String mynote)throws Exception;
	public List<SendVO> search_not(SearchCriteria cri,int myempno)throws Exception;
	public int search_count_note(SearchCriteria cri,int myempno)throws Exception;
	public List<NoteFindUserVO> find_user_note(SearchCriteria cri)throws Exception;
	public void recipient_note(RecipientVO recipientVO)throws Exception;
	public int sendemp(String ename)throws Exception;
}

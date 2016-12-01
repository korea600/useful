package kr.co.useful.note.service;

import java.util.List;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.note.domain.SendVO;

public interface SendService {
	public List<SendVO> list_note(String mynote)throws Exception;
	public void create_note(SendVO vo)throws Exception;
	public SendVO select_note(SendVO vo)throws Exception;
	public void delete_note(int serial)throws Exception;
	public int count_note(String mynote)throws Exception;
	public List<SendVO> search_not(SearchCriteria cri)throws Exception;
	public int search_count_note(SearchCriteria cri)throws Exception;
}

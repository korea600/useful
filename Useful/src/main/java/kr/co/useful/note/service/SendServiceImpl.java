package kr.co.useful.note.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.note.domain.SendVO;
import kr.co.useful.note.persistence.SendDAO;
@Service
public class SendServiceImpl implements SendService {
@Inject
private SendDAO dao;
	@Override
	public List<SendVO> list_note(String mynote) throws Exception {
		// TODO Auto-generated method stub
		return dao.list_note(mynote);
	}

	@Override
	public void create_note(SendVO vo) throws Exception {
		// TODO Auto-generated method stub
dao.create_note(vo);
	}

	@Override
	public SendVO select_note(SendVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.select_note(vo);
	}

	@Override
	public void delete_note(int serial) throws Exception {
		// TODO Auto-generated method stub
dao.delete_note(serial);
	}

	@Override
	public int count_note(String mynote) throws Exception {
		// TODO Auto-generated method stub
		return dao.count_note(mynote);
	}

	@Override
	public List<SendVO> search_not(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.search_not(cri);
	}

	@Override
	public int search_count_note(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.search_count_note(cri);
	}

}

package kr.co.useful.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	private NoticeDAO dao;

	public void create(NoticeVO vo) throws Exception { //���
		dao.create(vo);
	}

	public void modify(NoticeVO vo) throws Exception { //����
		dao.update(vo);
	}

	public NoticeVO read(int serial) throws Exception { //�б�
		return dao.read(serial);
	}

	public void remove(int serial,int empno) throws Exception { //����
		dao.delete(serial,empno);
	}

	public List<NoticeVO> listAll() throws Exception { //��ü����Ʈ ��ȸ
		return dao.listAll();
	}

	public List<NoticeVO> listCriteria(Criteria cri) throws Exception { //Ư�������� ��ȸ
		return dao.listCriteria(cri);
	}

	public int listCount() throws Exception { //��ü ī��Ʈ
		return dao.listcount();
	}

	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception { //�˻��� ����Ʈ
		return dao.listSearch(cri);
	}

	public int SearchCount(SearchCriteria cri) throws Exception { //�˻��� ī��Ʈ
		return dao.SearchCount(cri);
	}

	public List<NoticeVO> mainlist() throws Exception {
		return dao.mainlist();
	}

	public void viewcnt(int serial) throws Exception {
		dao.viewcnt(serial);	
	}

	public List<NoticeVO> list_cut() throws Exception {
		return dao.list_cut();
	}

	public String save_file_name(int serial) throws Exception {
		return dao.save_file_name(serial);
	}

}

package kr.co.useful.board.service;

import java.util.List;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.SearchCriteria;

public interface NoticeService {
	public void create(NoticeVO vo)throws Exception; //����
	public void modify(NoticeVO vo)throws Exception; //����
	public NoticeVO read(int serial)throws Exception; //�б�
	public void remove(int serial,int empno)throws Exception; //����
	public List<NoticeVO> listAll()throws Exception; //��ü���
	public List<NoticeVO> listCriteria(Criteria cri)throws Exception; //��������ȸ
	public int listCount()throws Exception;  //��ü ī��Ʈ
	public List<NoticeVO> listSearch(SearchCriteria cri)throws Exception; //����Ʈ�˻�
	public int SearchCount(SearchCriteria cri)throws Exception; //�˻���ī��Ʈ
	public List<NoticeVO> mainlist()throws Exception;
	public void viewcnt(int serial)throws Exception; //��ȸ�� ī��Ʈ
	public List<NoticeVO> list_cut()throws Exception;
	public String save_file_name(int serial)throws Exception;
}

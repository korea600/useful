package kr.co.useful.board.service;

import java.util.List;

import kr.co.useful.board.domain.Criteria;
import kr.co.useful.board.domain.DeptBoardVO;
import kr.co.useful.board.domain.SearchCriteria;

public interface DeptService {
	public void create(DeptBoardVO vo)throws Exception; //����
	public void modify(DeptBoardVO vo)throws Exception; //����
	public DeptBoardVO read(int serial)throws Exception; //�б�
	public void remove(int serial)throws Exception; //����
	public List<DeptBoardVO> listAll()throws Exception; //��ü���
	public List<DeptBoardVO> listCriteria(Criteria cri)throws Exception; //��������ȸ
	public int listCount()throws Exception;  //��üī��Ʈ
	public List<DeptBoardVO> listSearch(SearchCriteria cri)throws Exception; //����Ʈ�˻�
	public int SearchCount(SearchCriteria cri)throws Exception; //�˻��� ī��Ʈ
}

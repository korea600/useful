package kr.co.useful.board.persistence;

import java.util.*;

import kr.co.useful.board.domain.*;

public interface BoardDAO {

	public void create(BoardVO vo)throws Exception;
	public BoardVO read(int serial)throws Exception;
	public void update(BoardVO vo)throws Exception;
	public void delete(int serial)throws Exception;
	public void viewcnt(int serial)throws Exception;
	public List<BoardVO> readAll()throws Exception;
	public int boardTotalCount()throws Exception; //�Խ��� ��ü��
	public List<BoardVO> listCriteria(Criteria cri) throws Exception; //Ư����������ȸ
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception; //�˻�����ȸ
	public int listFindCount(SearchCriteria cri)throws Exception; //�˻�����ȸ��
	public List<BoardVO> select_cut_list()throws Exception;//����Ʈ ��
	public int reply_count()throws Exception;
	public void fileupload(String originalfileName, String saveFileName, long fileSize)throws Exception;
	public String Sava_File_name(int serial)throws Exception;
}

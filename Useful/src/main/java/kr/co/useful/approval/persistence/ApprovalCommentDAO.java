package kr.co.useful.approval.persistence;

import java.util.List;

import kr.co.useful.approval.domain.ApprovalCommentVO;

public interface ApprovalCommentDAO {
	public List<ApprovalCommentVO> list(int no) throws Exception;
	public int listcount(int no) throws Exception;
	public void insert(ApprovalCommentVO vo) throws Exception;
	public void delelte(int no) throws Exception;
}

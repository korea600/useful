package kr.co.useful.approval.service;

import java.util.List;

import kr.co.useful.approval.domain.ApprovalCommentVO;

public interface ApprovalCommentService {
	public List<ApprovalCommentVO> list(int no) throws Exception;
	public int listcount(int no) throws Exception;
	public void insert(ApprovalCommentVO vo) throws Exception;
}

package kr.co.useful.approval.service;

import java.util.List;

import kr.co.useful.approval.domain.ApprovalVO;

public interface ApprovalService {
	public void create(ApprovalVO vo) throws Exception;						// 결재문서 등록
	public void modify(ApprovalVO vo) throws Exception;						// 수정하기 (반려된 문서)
	public ApprovalVO select(int no) throws Exception;						// 특정문서 조회
	public List<ApprovalVO> list(int deptno) throws Exception;				// 우리부서+전체 조회
	public List<ApprovalVO> list_from_me(int writer) throws Exception;		// 내가 작성한 문서 조회
	public List<ApprovalVO> list_approval(int next_approval)throws Exception;	// 내가 결재할 문서 조회
	public void do_approval(ApprovalVO vo) throws Exception;				// 결재/반려 하기 (코멘트 달기)

}

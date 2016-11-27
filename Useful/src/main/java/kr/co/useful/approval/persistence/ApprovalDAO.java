package kr.co.useful.approval.persistence;

import java.util.List;

import kr.co.useful.approval.domain.ApprovalVO;

public interface ApprovalDAO {
	public void create(ApprovalVO vo) throws Exception;						// 결재문서 등록
	public void modify(ApprovalVO vo) throws Exception;						// 수정하기 (반려된 문서)
	public ApprovalVO select(int no) throws Exception;						// 특정문서 조회
	public List<ApprovalVO> list(ApprovalVO vo)throws Exception;			// 조건에 따른 문서리스트 조회
	public void do_approval(ApprovalVO vo) throws Exception;				// 결재/반려 하기 (코멘트 달기)
	public int getManager(int empno)throws Exception;						// 직속상사 사번 정보 조회
}

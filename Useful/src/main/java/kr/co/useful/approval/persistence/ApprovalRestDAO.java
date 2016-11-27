package kr.co.useful.approval.persistence;

import java.util.List;

import kr.co.useful.approval.domain.ApprovalRestVO;

public interface ApprovalRestDAO {
	// 타부서 이름 얻어오기
	public List<ApprovalRestVO> getDept(int deptno) throws Exception;
	// 결재선 얻어오기
	public List<ApprovalRestVO> getLine(ApprovalRestVO vo) throws Exception;
}

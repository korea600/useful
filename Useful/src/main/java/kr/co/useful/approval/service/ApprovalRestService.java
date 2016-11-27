package kr.co.useful.approval.service;

import java.util.List;

import kr.co.useful.approval.domain.ApprovalRestVO;

public interface ApprovalRestService {

	public List<ApprovalRestVO> getDept(int deptno) throws Exception;
	public List<ApprovalRestVO> getLine(ApprovalRestVO vo) throws Exception;
}

package kr.co.useful.approval.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.approval.domain.ApprovalRestVO;
import kr.co.useful.approval.persistence.ApprovalRestDAO;

@Service
public class ApprovalRestServiceImpl implements ApprovalRestService{

	@Inject
	private ApprovalRestDAO dao;
	
	public List<ApprovalRestVO> getDept(int deptno) throws Exception {
		return dao.getDept(deptno);
	}

	public List<ApprovalRestVO> getLine(ApprovalRestVO vo) throws Exception {
		return dao.getLine(vo);
	}

}

package kr.co.useful.approval.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.useful.approval.domain.ApprovalVO;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	public void create(ApprovalVO vo) throws Exception {
		
	}


	public void modify(ApprovalVO vo) throws Exception {
		
	}


	public List<ApprovalVO> list(int deptno) throws Exception {
		return null;
	}


	public List<ApprovalVO> list_from_me(int writer) throws Exception {

		return null;
	}


	public List<ApprovalVO> list_approval(int next_approval) throws Exception {

		return null;
	}

	public void do_approval(ApprovalVO vo) throws Exception {
		
	}

	public ApprovalVO select(int no) throws Exception {
		return null;
	}

}

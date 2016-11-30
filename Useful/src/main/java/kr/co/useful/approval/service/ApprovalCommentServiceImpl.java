package kr.co.useful.approval.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.approval.domain.ApprovalCommentVO;
import kr.co.useful.approval.persistence.ApprovalCommentDAO;
import kr.co.useful.approval.service.ApprovalCommentService;

@Service
public class ApprovalCommentServiceImpl implements ApprovalCommentService{

	@Inject
	private ApprovalCommentDAO dao;
	
	public List<ApprovalCommentVO> list(int no) throws Exception {
		return dao.list(no);
	}

	public int listcount(int no) throws Exception {
		return dao.listcount(no);
	}

	public void insert(ApprovalCommentVO vo) throws Exception {
		dao.insert(vo);
	}

}

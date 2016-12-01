package kr.co.useful.approval.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.useful.approval.domain.ApprovalRestVO;
import kr.co.useful.approval.service.ApprovalRestService;

@RestController
public class ApprovalRestController {	// 입력폼 페이지 내에서 Ajax 처리를 위한 controller
	
	@Inject
	private ApprovalRestService service;
	
	@RequestMapping("/approval/getDept")		// 작성자의 부서 외 타부서의 정보 얻기
	public List<ApprovalRestVO> getDept(int deptno) throws Exception{
		List<ApprovalRestVO> list = service.getDept(deptno);
		return list;
	}
	
	@RequestMapping("/approval/getLine")		// 결재선 정보 얻기
	public List<ApprovalRestVO> getLine(ApprovalRestVO vo) throws Exception{
		List<ApprovalRestVO> list = service.getLine(vo);
		return list;
	}
	
}

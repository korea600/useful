package kr.co.useful.approval.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.useful.approval.domain.ApprovalCommentVO;
import kr.co.useful.approval.service.ApprovalCommentService;

@Controller
@RequestMapping("/approval/comment")
public class ApprovalCommentController {
	
	@Inject
	private ApprovalCommentService service;
	
	// 특정 결재문서에 연결된 코멘트의 갯수 얻어오기 (1개 이상일때 코멘트 리스트를 띄우기 위한 Ajax 처리용)
	@RequestMapping("/count/{no}")
	public @ResponseBody int getCommentCount(@PathVariable int no) throws Exception{
		return service.listcount(no);
	}

	// 코멘트가 1개 이상일 때 코멘트 리스트 띄우기
	@RequestMapping(value="/list/{no}")
	public String list(@PathVariable int no,Model m)throws Exception{
		m.addAttribute("list", service.list(no));
		return "/approval/comment/view";
	}
}

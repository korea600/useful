package kr.co.useful.approval.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

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
	
	@RequestMapping("/count/{no}")
	public @ResponseBody int getCommentCount(@PathVariable int no) throws Exception{
		return service.listcount(no);
	}
	
	
	@RequestMapping(value="/accept",method=RequestMethod.POST)
	public @ResponseBody String insertAcceptComment(ApprovalCommentVO vo)throws Exception{
		vo.setChecked("결재");
		service.insert(vo);
		return "success";
	}
	
	@RequestMapping(value="/reject",method=RequestMethod.POST)
	public @ResponseBody String insertRejectComment(ApprovalCommentVO vo)throws Exception{
		vo.setChecked("반려");
		service.insert(vo);
		return "success";
	}
	
	@RequestMapping(value="/list/{no}")
	public String list(@PathVariable int no,Model m)throws Exception{
		m.addAttribute("list", service.list(no));
		return "/approval/comment/view";
	}
}

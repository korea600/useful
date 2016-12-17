package kr.co.useful.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.useful.board.domain.ReplyVO;
import kr.co.useful.board.service.ReplyNoticeService;
import kr.co.useful.manager.domain.EmpVO;

@RestController
@RequestMapping("/reply/notice")
public class BoardNoticeReplyController {
	
	@Inject
	private ReplyNoticeService rnservice;
	
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public ResponseEntity<String> create(@RequestBody ReplyVO vo,HttpServletRequest request,HttpSession httpSession){
		ResponseEntity<String> entity=null;
		try {
			String replyname=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
			vo.setReplyname(replyname);
			rnservice.create(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity=null;
		try {
			rnservice.delete(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ResponseEntity<String> update(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity=null;
		try {
			rnservice.update(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
}

package kr.co.useful.board.controller;

import javax.inject.*;
import javax.servlet.http.*;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import kr.co.useful.board.domain.*;
import kr.co.useful.board.service.*;
import kr.co.useful.manager.domain.EmpVO;

@RestController
@RequestMapping("/reply")
public class BoardReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo,HttpServletRequest request,HttpSession httpSession){
		ResponseEntity<String> entity=null;
		try {
			String replyname=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
			vo.setReplyname(replyname);
			service.create(vo);
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
			service.delete(vo);
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
			service.update(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}

}
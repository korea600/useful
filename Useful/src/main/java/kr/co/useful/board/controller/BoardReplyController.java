package kr.co.useful.board.controller;

import javax.inject.*;
import javax.servlet.http.*;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import kr.co.useful.board.domain.*;
import kr.co.useful.board.service.*;

@RestController
@RequestMapping("/reply")
public class BoardReplyController {
@Inject
private ReplyService service;
@RequestMapping(value="/create",method=RequestMethod.POST)
public ResponseEntity<String> register(@RequestBody ReplyVO vo,HttpServletRequest request){
	ResponseEntity<String> entity=null;
	try {
		service.create(vo);
entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	} catch (Exception e) {
		// TODO Auto-generated catch block
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
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return entity;
}

}

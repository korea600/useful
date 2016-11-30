package kr.co.useful.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.useful.board.domain.ReplyVO;
import kr.co.useful.board.service.ReplyNoticeService;

@RestController
@RequestMapping("/reply/notice")
public class BoardNoticeReplyController {
@Inject
private ReplyNoticeService rnservice;

@RequestMapping(value="/create",method=RequestMethod.POST)
public ResponseEntity<String> create(@RequestBody ReplyVO vo,HttpServletRequest request){
	ResponseEntity<String> entity=null;
	try {
		rnservice.create(vo);
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
		rnservice.delete(vo);
		entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	} catch (Exception e) {
		// TODO Auto-generated catch block
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
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return entity;
}
}

package kr.co.useful.board.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/board/upload")
public class BoardUploadController {

	@RequestMapping(value="/uploadFrom",method=RequestMethod.GET)
	public void upload()throws Exception{}

}

package kr.co.useful.board.controller;

import java.util.logging.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/board/upload")
public class BoardUploadController {
private static final Logger logger=(Logger) LoggerFactory.getLogger(BoardUploadController.class);
@RequestMapping(value="/uploadFrom",method=RequestMethod.GET)
public void upload()throws Exception{
	
};

}

package kr.co.useful.sharetask.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.PageMaker;
import kr.co.useful.sharetask.domain.ShareReplyVO;
import kr.co.useful.sharetask.service.ShareReplyService;

@RestController
@RequestMapping("/ShareReply")
public class ShareReplyController {
       ShareReplyService service;
       
       //댓글 등록
       @RequestMapping(value="", method=RequestMethod.POST)
     	public ResponseEntity<String> register(@RequestBody ShareReplyVO vo, HttpServletRequest req){
   		
   		System.out.println(vo);
   		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
   		
   		ResponseEntity<String> entity = null;
   		
   		try {
   			service.addReply(vo);
   			System.out.println("reply="+vo);
   			entity=new ResponseEntity<>("SUCCESS", HttpStatus.OK);
   			
   			
   		} catch (Exception e) {
   			
   			e.printStackTrace();
   			
   			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
   		}
   		
   		return entity;
   	}
   	

   	
   	
   	//특정게시물에 대한 모든 댓글 목록요청
   		@RequestMapping(value="/all/{bno}", method=RequestMethod.GET)
   		public List<ShareReplyVO> list(@PathVariable("bno") int bno){
   			
   		   System.out.println("bno: "+ bno);
   		   List<ShareReplyVO> list=null;
   		   try {
   			  list = service.listReply(bno);
   		   } catch (Exception e) {
   			e.printStackTrace();
   		   }
   		   return list;
   		}
   		
   		
      //특정댓글에 대한 수정
   		
   	@RequestMapping(value="/{rno}",method=RequestMethod.PATCH)
   	//rno에 번호와 일치하는 댓글 수정
   	public ResponseEntity<String> update(@PathVariable("rno") int rno, @RequestBody ShareReplyVO vo){
   		//ReplyVO ---->  수정할 댓글 정보가 JSON으로 전달
   		vo.setRno(rno);
   		ResponseEntity<String> entity = null;
   		try {
   			service.modifyReply(vo);
   			entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
   		} catch (Exception e) {
   		
   			e.printStackTrace();
   			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
   		}
   		
   		return entity;
   		
   	}
   	
   	//특정댓글에 대한 삭제
   	@RequestMapping(value="/{rno}",method=RequestMethod.DELETE)
   	//rno에 번호와 일치하는 댓글 수정
   	public ResponseEntity<String> remove(@PathVariable("rno") int rno, @RequestBody ShareReplyVO vo){
   		//ReplyVO ---->  수정할 댓글 정보가 JSON으로 전달
   		vo.setRno(rno);
   		ResponseEntity<String> entity = null;
   		try {
   			service.removeReply(rno);
   			entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
   		} catch (Exception e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
   		}
   		
   		return entity;
   		
   	}
   	
   	//특정게시물에 대한 특정페이지 댓글 목록요청
   	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
   	public ResponseEntity<Map<String,Object>> listPage(@PathVariable("bno") int bno,
   			                      @PathVariable("page") int page) {
   	
   		System.out.println("bno: " + bno);
   		
   		ResponseEntity<Map<String,Object>> entity = null;
   		
   		Criteria cri = new Criteria();//기본페이지 1페이지, 기본행의 개수: 10개
   		
   		cri.setPage(page);
   		
   		PageMaker pageMaker = new PageMaker();
   		   pageMaker.setCri(cri);
   		   
   		Map<String,Object> map = new HashMap<>();
   		
   	  try{
   	    List<ShareReplyVO> list = service.listReplyPage(bno, cri);
   	                     
   	       map.put("list", list);
   	       
   	    int replyCount = service.count(bno);
   	                    
   	    pageMaker.setTotalCount(replyCount);
   	    
   	    map.put("pageMaker", pageMaker);
   	    
   	    entity = new ResponseEntity<>(map,HttpStatus.OK);
   	    
   	   }catch(Exception e){
   		  e.printStackTrace();
   		  entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
   	  }		
   		
   		return entity;
   	}
   	
}

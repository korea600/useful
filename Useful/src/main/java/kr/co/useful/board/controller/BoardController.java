package kr.co.useful.board.controller;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import kr.co.useful.board.domain.*;
import kr.co.useful.board.service.*;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Inject
	private BoardService service;
	@Inject
	private ReplyService reservice;
	//----------------------------여기부터 게시판 관련 ----------------------------------------------------
	@RequestMapping(value="/view",method=RequestMethod.GET)
	public void createPageGET1()throws Exception{
	
	}
	@RequestMapping(value="/Main",method=RequestMethod.GET)
	public void createPageGET2()throws Exception{
		
	}
	@RequestMapping(value="/createPage",method=RequestMethod.GET)
	public void createPageGET()throws Exception{
		
	}
	@RequestMapping(value="/createPage",method=RequestMethod.POST)
	public String createPagePOST(BoardVO vo,RedirectAttributes att)throws Exception{
	service.insert(vo);
	att.addFlashAttribute("message", "SUCCESS");
	return "redirect:/board/listPage";
	}
	
	@RequestMapping("/listPage")
	public void listPage(SearchCriteria cri,Model model)throws Exception {
//	Map<String, Object> map=new HashMap<String,Object>();
	PageMaker pageMaker=new PageMaker();
	pageMaker.setCri(cri);
	pageMaker.setTotalCount(service.boardTotalcount());
	pageMaker.calc();
	model.addAttribute("pageMaker", pageMaker);
	model.addAttribute("list", service.listCriteria(cri));
//	map.put("maker", maker);
//	map.put("list", service.listCriteria(cri));
//	model.addAttribute("map", map);
	}
	
	@RequestMapping("/readPage")
	public void readPage(int serial,Model model,SearchCriteria cri)throws Exception {
	BoardVO board=service.read(serial);
	PageMaker pageMaker=new PageMaker();
	List<ReplyVO> list=reservice.listAll(serial);
	service.viewcnt(serial);
	pageMaker.setCri(cri);
	pageMaker.calc();
	model.addAttribute("maker", pageMaker);
	model.addAttribute("list", list);
	model.addAttribute("board", board);
	model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value="modifyPage",method=RequestMethod.GET) 
	public void modifyPage(int serial,Model model)throws Exception{
		BoardVO board=service.read(serial);
		model.addAttribute("board", board);
		
	}
	
	@RequestMapping(value="modifyPage",method=RequestMethod.POST) 
	public String modifyPage(BoardVO vo,RedirectAttributes attr,SearchCriteria cri)throws Exception {
		service.modify(vo);
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perpageNum", cri.getPerPageNum());
		return "redirect:/board/listPage";
	}
	@RequestMapping("/deletePage") 
	public String deletePage(int serial) {
		return "redirect:/board/listPage";
	}
	//----------------------------여기까지 게시판 관련 ----------------------------------------------------
	
	//----------------------------여기부터 댓글 관련 ----------------------------------------------------
	@RequestMapping(value="",method=RequestMethod.POST)
	public void replycreate(ReplyVO vo)throws Exception{
	reservice.create(vo);
	};
	public void replyupdate()throws Exception{};
	public void replydelete()throws Exception{};
	//----------------------------여기까지 댓글 관련 ----------------------------------------------------

}

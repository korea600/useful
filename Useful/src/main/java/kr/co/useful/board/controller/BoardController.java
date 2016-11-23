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
	
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public void createPageGET()throws Exception{
	
	}
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public String createPagePOST(BoardVO vo,RedirectAttributes att)throws Exception{
	service.insert(vo);
	att.addFlashAttribute("message", "SUCCESS");
	return "redirct:/board/listPage";
	}
	
	@RequestMapping("/listPage")
	public void listPage(@RequestParam("cri")Criteria cri,Model model)throws Exception {
	Map<String, Object> map=new HashMap<String,Object>();
	PageMaker maker=new PageMaker();
	maker.setCri(cri);
	maker.setTotalCount(service.boardTotalcount());
	maker.calc();
	model.addAttribute("maker", maker);
	model.addAttribute("list", service.listCriteria(cri));
//	map.put("maker", maker);
//	map.put("list", service.listCriteria(cri));
//	model.addAttribute("map", map);
	}
	
	@RequestMapping("/readPage")
	public void readPage(int serial,Model model,Criteria cri)throws Exception {
	BoardVO board=service.read(serial);
	model.addAttribute("board", board);
	model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value="modifyPage",method=RequestMethod.GET) 
	public void modifyPage(int serial,Model model)throws Exception{
		BoardVO board=service.read(serial);
		model.addAttribute("board", board);
		
	}
	
	@RequestMapping(value="modifyPage",method=RequestMethod.POST) 
	public String modifyPage(BoardVO vo,RedirectAttributes attr,Criteria cri)throws Exception {
		service.modify(vo);
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perpageNum", cri.getPerPageNum());
		return "redirect:/board/listPage";
	}
	@RequestMapping("/deletePage") 
	public String deletePage(int serial) {
		return "redirect:/board/listPage";
	}
}

package kr.co.useful.board.controller;

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

	@RequestMapping("/listPage")
	public void listPage(Criteria cri,Model model)throws Exception {
	PageMaker maker=new PageMaker();
	maker.setCri(cri);
	maker.setTotalCount(service.boardTotalcount());
	maker.calc();
	model.addAttribute("maker", maker);
	model.addAttribute("list", service.listCriteria(cri));
	}
	@RequestMapping("/readPage")
	public String readPage(int serial,Model model,Criteria cri)throws Exception {
	BoardVO board=service.read(serial);
	model.addAttribute("board", board);
	model.addAttribute("cri", cri);
	return "/board/readPage";
	}
	
	@RequestMapping(value="modifyPage",method=RequestMethod.GET)
	public String modifyPage(int serial,Model model)throws Exception{
		BoardVO board=service.read(serial);
		model.addAttribute("board", board);
		return "/board/modifyPage";
	}
	
	@RequestMapping("/modifyPage")
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

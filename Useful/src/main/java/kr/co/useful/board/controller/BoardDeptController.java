package kr.co.useful.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.board.domain.DeptBoardVO;
import kr.co.useful.board.domain.PageMaker;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.service.DeptService;

@Controller
@RequestMapping("/board/dept")
public class BoardDeptController {

	@Inject
	private DeptService service;
	
	@RequestMapping("/listPage")
	public void listPage(SearchCriteria cri,Model model) throws Exception {
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		pageMaker.calc();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	@RequestMapping(value="/createPage",method=RequestMethod.GET)
	public void createPageGET() throws Exception {}
	
	@RequestMapping(value="/createPage",method=RequestMethod.POST)
	public String createPagePOST(DeptBoardVO vo,RedirectAttributes att)throws Exception{
		service.create(vo);
		att.addFlashAttribute("message", "SUCCESS");
		return "redirect:/board/notice/listPage";
	}

	@RequestMapping(value="/modifyPage",method=RequestMethod.GET) 
	public void modifyPage(int serial,Model model)throws Exception{
		DeptBoardVO board=service.read(serial);
		model.addAttribute("board", board);
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST) 
	public String modifyPage(DeptBoardVO vo,RedirectAttributes attr,SearchCriteria cri)throws Exception {
		service.modify(vo);
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perpageNum", cri.getPerPageNum());
		return "redirect:/board/listPage";
	}

	@RequestMapping("/deletePage") 
	public String deletePage(int serial) {
		return "redirect:/board/listPage";
	}

	@RequestMapping("/readPage")
	public void readPage(int serial,Model model,SearchCriteria cri)throws Exception {
		DeptBoardVO board=service.read(serial);
		PageMaker pageMaker=new PageMaker();
	
		pageMaker.setCri(cri);
		pageMaker.calc();
		model.addAttribute("maker", pageMaker);
	
		model.addAttribute("board", board);
		model.addAttribute("cri", cri);
	}
}

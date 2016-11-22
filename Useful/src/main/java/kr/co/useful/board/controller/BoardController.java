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
	
	@RequestMapping(value="/create",method=RequestMethod.GET)//게시글 등록페이지 불러오기
	public void createPageGET()throws Exception{
	
	}
	@RequestMapping(value="/create",method=RequestMethod.POST)//게시글 등록
	public String createPagePOST(BoardVO vo,RedirectAttributes att)throws Exception{
	service.insert(vo);
	att.addFlashAttribute("message", "SUCCESS");
	return "redirct:/board/listPage";
	}
	
	@RequestMapping("/listPage") //전체중 특정 페이지 보기
	public void listPage(Criteria cri,Model model)throws Exception {
	PageMaker maker=new PageMaker();
	maker.setCri(cri);
	maker.setTotalCount(service.boardTotalcount());
	maker.calc();
	model.addAttribute("maker", maker);
	model.addAttribute("list", service.listCriteria(cri));
	}
	
	@RequestMapping("/readPage") //선택 게시물 보기
	public void readPage(int serial,Model model,Criteria cri)throws Exception {
	BoardVO board=service.read(serial);
	model.addAttribute("board", board);
	model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value="modifyPage",method=RequestMethod.GET) //수정 내용 불러오기
	public void modifyPage(int serial,Model model)throws Exception{
		BoardVO board=service.read(serial);
		model.addAttribute("board", board);
		
	}
	
	@RequestMapping(value="modifyPage",method=RequestMethod.POST) //게시물 수정 후 입력
	public String modifyPage(BoardVO vo,RedirectAttributes attr,Criteria cri)throws Exception {
		service.modify(vo);
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perpageNum", cri.getPerPageNum());
		return "redirect:/board/listPage";
	}
	@RequestMapping("/deletePage") //게시물 삭제
	public String deletePage(int serial) {
		return "redirect:/board/listPage";
	}
}

package kr.co.useful.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.board.domain.AnonymityVO;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.PageMaker;
import kr.co.useful.board.domain.ReplyVO;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.service.AnonymityService;
import kr.co.useful.board.service.ReplyService;

@Controller
@RequestMapping("/board/anonymity")
public class BoardanonymityController {
	
		@Inject
		private AnonymityService service;
		@Inject
		private ReplyService reservice;
		
		@RequestMapping("/listPage")
		public void listPage(SearchCriteria cri,Model model) throws Exception {
			PageMaker pageMaker=new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.boardTotalCount());
			pageMaker.calc();
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("list", service.listCriteria(cri));
		};
		@RequestMapping(value="/createPage",method=RequestMethod.GET)
		public void createPageGET() throws Exception {
		};
		
		@RequestMapping(value="/createPage",method=RequestMethod.POST)
		public String createPagePOST(AnonymityVO vo,RedirectAttributes att)throws Exception{
		service.create(vo);
		att.addFlashAttribute("message", "SUCCESS");
		return "redirect:/board/notice/listPage";
		}

		@RequestMapping(value="/modifyPage",method=RequestMethod.GET) 
		public void modifyPage(int serial,Model model)throws Exception{
			AnonymityVO board=service.read(serial);
			model.addAttribute("board", board);
			
		}
		
		@RequestMapping(value="/modifyPage",method=RequestMethod.POST) 
		public String modifyPage(AnonymityVO vo,RedirectAttributes attr,SearchCriteria cri)throws Exception {
			service.update(vo);
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
		AnonymityVO board=service.read(serial);
		PageMaker pageMaker=new PageMaker();
		List<ReplyVO> list=reservice.listAll(serial);
		pageMaker.setCri(cri);
		pageMaker.calc();
		model.addAttribute("maker", pageMaker);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		model.addAttribute("cri", cri);
		}
	}


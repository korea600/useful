package kr.co.useful.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.co.useful.board.domain.AnonymityVO;

import kr.co.useful.board.domain.PageMaker;
import kr.co.useful.board.domain.ReplyVO;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.service.AnonymityService;
import kr.co.useful.board.service.ReplyAnonymityService;

@Controller
@RequestMapping("/board/anonymity")
public class BoardanonymityController {
	
		@Inject
		private AnonymityService service;
		@Inject
		private ReplyAnonymityService reservice; 
		
		@RequestMapping("/listPage")
		public void listPage(SearchCriteria cri,Model model) throws Exception {
			PageMaker pageMaker=new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.listFindCount(cri));
			pageMaker.calc();
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("list", service.listSearch(cri));
		};

		@RequestMapping(value="/createPage",method=RequestMethod.GET)
		public void createPageGET() throws Exception {}
		
		@RequestMapping(value="/createPage",method=RequestMethod.POST)
		public String createPagePOST(AnonymityVO vo,RedirectAttributes att)throws Exception{
			service.create(vo);
			att.addFlashAttribute("message", "SUCCESS");
			return "redirect:/board/anonymity/listPage";
		}

		@RequestMapping(value="/modifyPage",method=RequestMethod.GET) 
		public void modifyPage(int serial,Model model)throws Exception{
			AnonymityVO board=service.read(serial);
			model.addAttribute("board", board);
		}
		
		@RequestMapping(value="/modifyPage",method=RequestMethod.POST) 
		public String modifyPage(AnonymityVO vo,RedirectAttributes attr)throws Exception {
			service.update(vo);
			return "redirect:/board/anonymity/listPage";
		}

		@RequestMapping("/deletePage") 
		public String deletePage(int serial)throws Exception{
			service.delete(serial);
			return "redirect:/board/anonymity/listPage";
		}

		@RequestMapping("/readPage")
		public void readPage(int serial,Model model,SearchCriteria cri)throws Exception {
			AnonymityVO board=service.read(serial);
			List<ReplyVO> list=reservice.listAll(serial);
			service.viewcnt(serial);
			PageMaker pageMaker=new PageMaker();
	
			pageMaker.setCri(cri);
			pageMaker.calc();
			model.addAttribute("maker", pageMaker);
			model.addAttribute("list", list);
			model.addAttribute("board", board);
			model.addAttribute("cri", cri);
		}

		@RequestMapping(value="/passcheckPage",method=RequestMethod.GET)
		public void passcheckPage(int serial,Model model)throws Exception{
			model.addAttribute("serial", serial);
		}
		
		@RequestMapping(value="/passcheckPage",method=RequestMethod.POST)
		public @ResponseBody String passcheck(int serial, String pass,	Model model)throws Exception{
			String correctpass = service.pass_check(serial);
			if(correctpass.equals(pass)){
				return "SUCCESS";
			}
			else return "fail";
		}
		@RequestMapping(value="/bPassPage",method=RequestMethod.GET)
		public void bPassPage(int serial,Model model)throws Exception{
			model.addAttribute("serial", serial);
		}
		
		@RequestMapping(value="/bPassPage",method=RequestMethod.POST)
		public @ResponseBody String bPassPage2(int serial,Model model,String pass)throws Exception{
			String dpass=service.pass_check(serial);
			if(dpass.equals(pass)){
				service.delete(serial);
				return "SUCCESS";
			}
			return "fail";
			
		}		
	}


package kr.co.useful.board.controller;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.PageMaker;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class BoardNoticeController {

	@Inject
	private NoticeService service;

	@RequestMapping(value = "/createPage", method = RequestMethod.GET) // 입력 게시물
																		// 불러오기
	public void createPageGET() throws Exception {
	}

	@RequestMapping(value = "/createPage", method = RequestMethod.POST) // 게시물
																		// 입력후
																		// 리스트
																		// 이동
	public String createPagePOST(NoticeVO vo, RedirectAttributes attr) throws Exception {
		service.create(vo);
		attr.addFlashAttribute("message", "SUCCESS");
		return "redirect:/notice/listPage";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET) // 게시물 수정
																		// 불러옴
	public void modifyPageGET(int serial, Model model, SearchCriteria cri) throws Exception {
		model.addAttribute("cri", cri);
		model.addAttribute(service.read(serial));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST) // 게시물
																		// 수정후
																		// 입력
	public String modifyPagePOST(NoticeVO vo, SearchCriteria cri, RedirectAttributes attr) throws Exception {
		service.modify(vo);
		attr.addFlashAttribute("message", "SUCCESS");
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perPageNum", cri.getPerPageNum());
		attr.addFlashAttribute("keyword", cri.getKeyword());
		attr.addFlashAttribute("searchType", cri.getSearchType());
		return "redirect:/notice/listPage";
	}

	@RequestMapping("/readPage") // 게시물 읽기
	public void readPage(int serial, Model model, SearchCriteria cri) throws Exception {

		model.addAttribute(service.read(serial));
		model.addAttribute("cri", cri);
	}

	@RequestMapping("/deletePage") // 게시물 삭제
	public String deletePage(int serial, RedirectAttributes attr, SearchCriteria cri) throws Exception {
		service.remove(serial);
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perPageNum", cri.getPerPageNum());
		attr.addFlashAttribute("searchType", cri.getSearchType());
		attr.addFlashAttribute("keyword", cri.getKeyword());
		return "redirect:/notice/listPage";
	}

	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public void listPage(SearchCriteria cri, Model model) throws Exception {
	model.addAttribute("cri", cri);
	model.addAttribute("list", service.listSearch(cri));
	PageMaker pageMaker=new PageMaker();
	pageMaker.setCri(cri);
	pageMaker.setTotalCount(service.listCount());
	model.addAttribute("pageMaker", pageMaker);
	}
}

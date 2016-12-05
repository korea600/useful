package kr.co.useful.board.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.board.domain.BoardVO;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.PageMaker;
import kr.co.useful.board.domain.ReplyVO;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.service.NoticeService;
import kr.co.useful.board.service.ReplyNoticeService;
import kr.co.useful.board.service.ReplyService;
import kr.co.useful.manager.domain.EmpVO;

@Controller
@RequestMapping("/board/notice")
public class BoardNoticeController {
	@Inject
	private NoticeService service;
	@Inject 
	private ReplyNoticeService reservice;


	
	@RequestMapping("/listPage")
	public void listPage(SearchCriteria cri,Model model) throws Exception {
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.SearchCount(cri));
		pageMaker.calc();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", service.listSearch(cri));
	};
	@RequestMapping(value="/createPage",method=RequestMethod.GET)
	public void createPageGET() throws Exception {
	};
	
	@RequestMapping(value="/createPage",method=RequestMethod.POST)
	public String createPagePOST(NoticeVO vo,RedirectAttributes att,HttpSession httpSession)throws Exception{
	int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
	vo.setEmpno(empno);
	service.create(vo);
	att.addFlashAttribute("message", "SUCCESS");
	return "redirect:/board/notice/listPage";
	}

	@RequestMapping(value="/modifyPage",method=RequestMethod.GET) 
	public void modifyPage(int serial,Model model,@ModelAttribute("cri") SearchCriteria cri)throws Exception{
		NoticeVO board=service.read(serial);
		model.addAttribute("board", board);
		
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST) 
	public String modifyPage(NoticeVO vo,RedirectAttributes attr,SearchCriteria cri)throws Exception {
		service.modify(vo);
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perpageNum", cri.getPerPageNum());
		attr.addAttribute("searchType", cri.getSearchType() );
		attr.addAttribute("keyword", cri.getKeyword() );
		return "redirect:/board/listPage";
	}

	@RequestMapping("deletePage") 
	public String deletePage(NoticeVO vo,HttpSession httpSession)throws Exception{
		int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		vo.setEmpno(empno);
		service.remove(vo);
		return "redirect:/board/notice/listPage";
	}

	@RequestMapping("/readPage")
	public void readPage(int serial,Model model,SearchCriteria cri)throws Exception {
	NoticeVO board=service.read(serial);
	service.viewcnt(serial);
	List<ReplyVO> list=reservice.listAll(serial);
	PageMaker pageMaker=new PageMaker();

	pageMaker.setCri(cri);
	pageMaker.calc();
	model.addAttribute("maker", pageMaker);
	model.addAttribute("list", list);
	model.addAttribute("board", board);
	model.addAttribute("cri", cri);
	}

}

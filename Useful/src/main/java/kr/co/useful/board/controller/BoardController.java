package kr.co.useful.board.controller;

import java.util.*;

import javax.inject.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.*;

import kr.co.useful.board.domain.*;
import kr.co.useful.board.service.*;
import kr.co.useful.login.service.LoginService;
import kr.co.useful.manager.domain.EmpVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Inject
	private BoardService service;
	
	@Inject 
	private NoticeService noservice;
	
	@Inject
	private ReplyService reservice;
	
	@Inject
	private LoginService logservice;
	
	@RequestMapping("/Mainboard")
	public void createPageGET1(Model model)throws Exception{
	model.addAttribute("list", noservice.mainlist());
	}

	@RequestMapping(value="/createPage",method=RequestMethod.GET)
	public void createPageGET()throws Exception{
		
	}
	/*@RequestMapping(value="/createPage",method=RequestMethod.POST)
	public String createPagePOST(BoardVO vo,RedirectAttributes att,HttpSession httpSession)throws Exception{
	String writer=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
	int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
	vo.setEmpno(empno);
	vo.setWriter(writer);
	service.insert(vo);
	att.addFlashAttribute("message", "SUCCESS");
	return "redirect:/board/listPage";
	}*/
	@RequestMapping(value="/createPage",method=RequestMethod.POST)
	public String createPagePOST(BoardVO vo,RedirectAttributes att,HttpSession httpSession,MultipartFile file,HttpServletRequest servletRequest)throws Exception{
	String writer=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
	int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
	vo.setEmpno(empno);
	vo.setWriter(writer);
	service.insert(vo);
	att.addFlashAttribute("message", "SUCCESS");
	return "redirect:/board/listPage";
	}
	
	@RequestMapping("/listPage")
	public void listPage(SearchCriteria cri,Model model)throws Exception {
//	Map<String, Object> map=new HashMap<String,Object>();
	PageMaker pageMaker=new PageMaker();
	pageMaker.setCri(cri);
	pageMaker.setTotalCount(service.listFindCount(cri));
	pageMaker.calc();
	//BoardVO boardvo=new BoardVO();
	//boardvo.setReplycnt(service.reply_cut());
	model.addAttribute("pageMaker", pageMaker);
	model.addAttribute("list", service.listSearch(cri));
	
//	map.put("maker", maker);
//	map.put("list", service.listCriteria(cri));
//	model.addAttribute("map", map);
	}
	
	@RequestMapping("/readPage")
	public void readPage(int serial,Model model,SearchCriteria cri,HttpSession session)throws Exception {
	/*int empno=((EmpVO) session.getAttribute("LoginUser")).getEmpno();
	String ename=reservice.idcheck(empno);*/
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
	/*model.addAttribute("ename", ename);*/
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET) 
	public void modifyPage(int serial,Model model,@ModelAttribute("cri") SearchCriteria cri)throws Exception{
		BoardVO board=service.read(serial);
		model.addAttribute("board", board);
		
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST) 
	public String modifyPage(BoardVO vo,RedirectAttributes attr,SearchCriteria cri,HttpSession httpSession)throws Exception {
		int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		vo.setEmpno(empno);
		service.modify(vo);
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perpageNum", cri.getPerPageNum());
		 attr.addAttribute("searchType", cri.getSearchType() );
		   attr.addAttribute("keyword", cri.getKeyword() );
		return "redirect:/board/listPage";
	}
	@RequestMapping("/deletePage") 
	public String deletePage(int serial)throws Exception {
		service.delete(serial);
		return "redirect:/board/listPage";
	}
	

}

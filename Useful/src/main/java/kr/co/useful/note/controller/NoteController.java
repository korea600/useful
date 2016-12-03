package kr.co.useful.note.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.useful.board.domain.PageMaker;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.note.domain.NoteFindUserVO;
import kr.co.useful.note.domain.RecipientVO;
import kr.co.useful.note.domain.SendVO;
import kr.co.useful.note.service.RecipientService;
import kr.co.useful.note.service.SendService;

@Controller
@RequestMapping("/note")
public class NoteController {
	@Inject
	private SendService service;
	@Inject
	private RecipientService reservice;
	@RequestMapping(value="/notePage",method=RequestMethod.GET)
	public void list_note(HttpSession session,Model model,SearchCriteria cri)throws Exception{
		String mynote=((EmpVO) session.getAttribute("LoginUser")).getEname();
		/*PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.search_count_note(cri));
		pageMaker.calc();
		model.addAttribute("pageMaker", pageMaker);*/
		model.addAttribute("list", service.list_note(mynote));
		//model.addAttribute("list", service.search_not(cri));
	};
	
	@RequestMapping(value="/notePage",method=RequestMethod.POST)
	public void list_notePOST(HttpSession session,Model model,SearchCriteria cri)throws Exception{
		//String mynote=((EmpVO) session.getAttribute("LoginUser")).getEname();
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.search_count_note(cri));
		pageMaker.calc();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", service.search_not(cri));
		//model.addAttribute("list", service.list_note(mynote));
	};
	
	@RequestMapping(value="/noteCreatePage",method=RequestMethod.GET)
	public void create_note_get()throws Exception{};
	
	@RequestMapping(value="/noteCreatePage",method=RequestMethod.POST)
	public String create_note(HttpSession session,SendVO vo)throws Exception{
		RecipientVO recipientVO=new RecipientVO();
		String mynote=((EmpVO)session.getAttribute("LoginUser")).getEname();
		recipientVO.setReciid(mynote);
		recipientVO.setMynote(vo.getSendman());
		recipientVO.setRecontent(vo.getSendcontent());
		vo.setMynote(mynote);
		service.recipient_note(recipientVO);
		service.create_note(vo);
		return "redirect:/note/notePage";
	};
	
	
	@RequestMapping("/finduserPage")
	public void noteUserFindPage(Model model,SearchCriteria cri)throws Exception{
		if(cri.getKeyword()!=null){
			List<NoteFindUserVO> list=service.find_user_note(cri);
			model.addAttribute("list", list);
			model.addAttribute("cri", cri);
		}
	};
	@RequestMapping("/noteReadPage")
	public void noteReadPage(HttpSession httpSession,int serial,Model model)throws Exception{
		String mynote=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		SendVO vo=new SendVO();
		vo.setMynote(mynote);
		vo.setSerial(serial);
		model.addAttribute("list", service.select_note(vo));
	};
	@RequestMapping("/deletePage")
	public String noteDeletePage(int serial,HttpSession httpSession)throws Exception{
		String mynote=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		SendVO vo=new SendVO();
		vo.setMynote(mynote);
		vo.setSerial(serial);
		service.delete_note(vo);
		return "redirect:/note/notePage";
	};
	
	/*--------------여기서 부터 나의 받은 쪽지함내용--------------*/
	@RequestMapping(value="noteMyPage",method=RequestMethod.GET)
	public void recipient_note_list(HttpSession httpSession,Model model)throws Exception{
		String mynote=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		model.addAttribute("list", reservice.recipient_note_list(mynote));
	};
	@RequestMapping(value="noteMyPage",method=RequestMethod.POST)
	public void recipient_note_list_search(HttpSession httpSession,Model model,SearchCriteria cri)throws Exception{
		String mynote=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.search_count_note(cri));
		pageMaker.calc();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", reservice.recipient_note_list(mynote));
	};
	
	public void create_recipient_note(RecipientVO recipientVO)throws Exception{
		SendVO sendVO=new SendVO();
		sendVO.setSendman(recipientVO.getReciid());
		sendVO.setMynote(recipientVO.getMynote());
		sendVO.setSendcontent(recipientVO.getRecontent());
		reservice.create_send_note(sendVO);
		reservice.create_recipient_note(recipientVO);
	};
	public String select_recipient_note(RecipientVO recipientVO,HttpSession httpSession)throws Exception{
		String mynote=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		recipientVO.setMynote(mynote);
		reservice.select_recipient_note(recipientVO);
		return "redirect:/note/noteMyPage";
	};
	
}

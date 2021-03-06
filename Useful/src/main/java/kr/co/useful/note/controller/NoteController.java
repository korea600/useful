package kr.co.useful.note.controller;

import java.util.List;

import javax.inject.Inject;
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
		
	@RequestMapping("/notePage")
	public void list_notePOST(SearchCriteria cri, HttpSession session,Model model)throws Exception{
		int myempno=((EmpVO) session.getAttribute("LoginUser")).getEmpno();
		String mynote=((EmpVO) session.getAttribute("LoginUser")).getEname();
	
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.search_count_note(cri,myempno));
		pageMaker.calc();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", service.search_not(cri,myempno));

	}
	
	@RequestMapping(value="/noteCreatePage",method=RequestMethod.GET)
	public void create_note_get()throws Exception{}
	
	@RequestMapping(value="/noteCreatePage",method=RequestMethod.POST)
	public String create_note(HttpSession session,SendVO vo)throws Exception{
		RecipientVO recipientVO=new RecipientVO();
		String reciname=((EmpVO)session.getAttribute("LoginUser")).getEname();
		String mynote=((EmpVO)session.getAttribute("LoginUser")).getEname();
		int reciid=((EmpVO)session.getAttribute("LoginUser")).getEmpno();
		int mynoteid=((EmpVO)session.getAttribute("LoginUser")).getEmpno();
		String ename=vo.getSendman();
		recipientVO.setReciid(reciid);
		recipientVO.setReciname(reciname);
		recipientVO.setMynoteid(service.sendemp(ename));
		recipientVO.setMynotename(vo.getSendman());
		recipientVO.setRecontent(vo.getSendcontent());
		vo.setMynote(mynote);
		vo.setMyempno(reciid);
		service.recipient_note(recipientVO);
		service.create_note(vo);
		return "redirect:/note/notePage";
	}
	
	
	@RequestMapping("/finduserPage")
	public void noteUserFindPage(Model model,SearchCriteria cri)throws Exception{
		if(cri.getKeyword()!=null){
			List<NoteFindUserVO> list=service.find_user_note(cri);
			model.addAttribute("list", list);
			model.addAttribute("cri", cri);
		}
	}
	
	@RequestMapping("/noteReadPage")
	public void noteReadPage(HttpSession httpSession,int serial,Model model)throws Exception{
		String mynote=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		int myempno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		SendVO vo=new SendVO();
		vo.setMynote(mynote);
		vo.setMyempno(myempno);
		vo.setSerial(serial);
		model.addAttribute("list", service.select_note(vo));
	}
	
	@RequestMapping("/deletePage")
	public String noteDeletePage(int serial,HttpSession httpSession)throws Exception{
		String mynote=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		int myempno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		SendVO vo=new SendVO();
		vo.setMyempno(myempno);
		vo.setSerial(serial);
		service.delete_note(vo);
		return "redirect:/note/notePage";
	}
	
	@RequestMapping("/noteMyPage")
	public void recipient_note_list_search(HttpSession httpSession,Model model,SearchCriteria cri)throws Exception{
		String mynotename=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		int myempno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		int mynoteid=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.search_count_note(cri,myempno));
		pageMaker.calc();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", reservice.search_Recipient_note(cri, mynoteid));
	}
	
	@RequestMapping("/riciReadPage")
	public void select_recipient_note(RecipientVO recipientVO,HttpSession httpSession,int serial,Model mod)throws Exception{
		String mynote=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		int mynoteid=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		recipientVO.setSerial(serial);
		recipientVO.setMynoteid(mynoteid);
		mod.addAttribute("list",reservice.select_recipient_note(recipientVO));
	}
	
	@RequestMapping("/deletePage2")
	public String recipient_note_noteDeletePage(int serial,HttpSession httpSession)throws Exception{
		int mynoteid=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		RecipientVO recipientVO=new RecipientVO();
		recipientVO.setMynoteid(mynoteid);
		recipientVO.setSerial(serial);
		reservice.delete_recipient_note(recipientVO);
		return "redirect:/note/noteMyPage";
	}
	
	public void create_recipient_note(RecipientVO recipientVO,HttpSession httpSession)throws Exception{
		String mynotename=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
		int mynoteid=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		SendVO sendVO=new SendVO();
		recipientVO.setMynotename(mynotename);
		recipientVO.setMynoteid(mynoteid);
		sendVO.setSendman(recipientVO.getReciname());
		sendVO.setMyempno(recipientVO.getMynoteid());
		sendVO.setSendcontent(recipientVO.getRecontent());
		reservice.create_send_note(sendVO);
		reservice.create_recipient_note(recipientVO);
	}	
}

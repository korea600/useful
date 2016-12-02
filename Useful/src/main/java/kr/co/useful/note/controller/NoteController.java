package kr.co.useful.note.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.note.domain.NoteFindUserVO;
import kr.co.useful.note.domain.SendVO;
import kr.co.useful.note.service.SendService;

@Controller
@RequestMapping("/note")
public class NoteController {
	@Inject
	private SendService service;
	@RequestMapping("/notePage")
	public void list_note(HttpSession session,Model model)throws Exception{
		String mynote=((EmpVO) session.getAttribute("LoginUser")).getEname();
		model.addAttribute("list", service.list_note(mynote));
	};
	
	@RequestMapping(value="/noteCreatePage",method=RequestMethod.GET)
	public void create_note_get()throws Exception{};
	
	@RequestMapping(value="/noteCreatePage",method=RequestMethod.POST)
	public String create_note(HttpSession session,SendVO vo)throws Exception{
		String mynote=((EmpVO)session.getAttribute("LoginUser")).getEname();
		vo.setMynote(mynote);
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
}

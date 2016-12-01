package kr.co.useful.note.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.note.service.SendService;

@Controller
@RequestMapping("note")
public class NoteController {
	@Inject
	private SendService service;
	@RequestMapping("/notePage")
	public void list_note(HttpSession session,Model model)throws Exception{
		String mynote=((EmpVO) session.getAttribute("LoginUser")).getEname();
		model.addAttribute("list", service.list_note(mynote));
	};
}

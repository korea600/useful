package kr.co.useful.schedule.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.schedule.domain.PageMaker;
import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.domain.SearchCriteria;
import kr.co.useful.schedule.service.ScheduleService;
import kr.co.useful.sharetask.domain.Criteria;



@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Inject
	private ScheduleService service;
	
	@RequestMapping(value ="/co_Schedule", method=RequestMethod.GET)
	public void coScheduleList(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		model.addAttribute("list", service.listSearchCriteria(cri));
	
		//  System.out.println("list="+model);
/*		PageMaker maker = new PageMaker();
	 	maker.setCri(cri);
	 	maker.setTotalCount(service.listSearchCount(cri));
	 	model.addAttribute("pageMaker", maker);*/
	 	 
	}
	
	
	
	@RequestMapping(value ="/co_Schedule_Input", method=RequestMethod.GET)
	public void resisterGet() {
		System.out.println("스케쥴 입력");
	}
	
	//등록
	@RequestMapping(value ="/insert", method=RequestMethod.POST)
	public String resisterPost(ScheduleVO vo, RedirectAttributes attr) throws Exception {
		System.out.println("등록시작");
		service.regist(vo);
		System.out.println(vo);
		return  "redirect:/schedule/co_Schedule";
	}
	

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detailPage(int serial, Model model)throws Exception{
		model.addAttribute(service.read(serial));//현재값
		//System.out.println(model);
		
		return "/schedule/detail_Schedule";
	}

	//삭제
	@RequestMapping("/remove")
	public String deletePage(int serial, RedirectAttributes attr) throws Exception {
		System.out.println("삭제시작");
		service.remove(serial);
		return "redirect:/schedule/detail_Schedule";
	}

}

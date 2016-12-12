package kr.co.useful.schedule.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.schedule.domain.PageMaker;
import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.domain.SearchCriteria;
import kr.co.useful.schedule.service.ScheduleService;



@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Inject
	private ScheduleService service;
	
	@RequestMapping(value ="/co_Schedule", method=RequestMethod.GET)
	public void coScheduleList(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)throws Exception{
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker maker = new PageMaker();
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		
	 	maker.setCri(cri);
	 	maker.setTotalCount(service.listSearchCount(cri));
	 	model.addAttribute("evo", evo);
	 	
	 	model.addAttribute("pageMaker", maker);
	 	 
	}
	

	
	//�����
	@RequestMapping(value ="/co_Schedule_Input", method=RequestMethod.GET)
	public void resisterGet() {
		System.out.println("������ �Է�");
	}
	
	//���
	@RequestMapping(value ="/insert", method=RequestMethod.POST)
	public String resisterPost(ScheduleVO vo, RedirectAttributes attr) throws Exception {
		System.out.println("��Ͻ���: "+vo);
		service.regist(vo);
		System.out.println(vo);
		return  "redirect:/schedule/co_Schedule";
	}
	

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detailPage(int serial,@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		model.addAttribute(service.read(serial));//���簪
		model.addAttribute("cri", cri);
		//System.out.println(model);
		
		return "/schedule/detail_Schedule";
	}

	//����
	@RequestMapping("/remove")
	public String deletePage(int serial, SearchCriteria cri, RedirectAttributes attr) throws Exception {
		//System.out.println("��������");
		service.remove(serial);
		attr.addAttribute("page", cri.getPage());
		return "redirect:/schedule/co_Schedule";
	}
	
	
	//����
	@RequestMapping(value ="/change", method = RequestMethod.POST)
	public String modifyPagePost(ScheduleVO vo,SearchCriteria cri,RedirectAttributes attr) throws Exception {
		System.out.println("�������� = "+ vo);
		
		service.change(vo);
		
		   attr.addAttribute("page", cri.getPage() );
		   attr.addAttribute("perPageNum", cri.getPerPageNum() );
		   attr.addAttribute("searchType", cri.getSearchType() );
		   attr.addAttribute("keyword", cri.getKeyword() );
		   
		return "redirect:/schedule/co_Schedule";
	}


	//üũ ����
	@RequestMapping("/removeCheck")
	public String deleteCheck(@RequestParam(value="checkboxValues[]") List<String> checkList, SearchCriteria cri, RedirectAttributes attr )throws Exception{
		
		    System.out.println("�迭:"+checkList);
			
			for(int i=0; i<checkList.size(); i++){
				service.remove(Integer.parseInt(checkList.get(i)));							
			}
			attr.addAttribute("page", cri.getPage());
				
			return "redirect:/schedule/co_Schedule";
	}
}

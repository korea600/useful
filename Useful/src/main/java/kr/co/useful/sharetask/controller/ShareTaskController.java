package kr.co.useful.sharetask.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.sharetask.domain.Criteria;
import kr.co.useful.sharetask.domain.PageMaker;
import kr.co.useful.sharetask.domain.SearchCriteria;
import kr.co.useful.sharetask.domain.ShareTaskVO;
import kr.co.useful.sharetask.service.ShareTaskService;



@Controller
@RequestMapping("/sharetask")
public class ShareTaskController {
	private static final Logger logger = LoggerFactory.getLogger(ShareTaskController.class);
	
	@Inject
	private ShareTaskService service;
	
	
	//����Ʈ
	@RequestMapping(value = "share_Board", method = RequestMethod.GET)
	public void shareList(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req, HttpSession session)throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		
		
	   // System.out.print("�޾�����?"+evo.getEmpno());
		
		cri.setDeptno(evo.getDeptno());
	 	model.addAttribute("list", service.listSearchCriteria(cri));
	 	
	    System.out.println("����Ʈ!!!:"+cri );
	 	
	 	
		PageMaker maker = new PageMaker();
	 	maker.setCri(cri);
	 	maker.setTotalCount(service.listSearchCount(cri));
	 	model.addAttribute("pageMaker", maker);
	 	
	}
	
	//�Է�get
	@RequestMapping(value = "/share_Input", method = RequestMethod.GET) 
	public void registerGET(HttpServletRequest req,  Model model) {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		logger.info("�Է���");
		System.out.println("�Է��� ��û........");
	}
	
	//�Է�post
	@RequestMapping(value = "/insert", method = RequestMethod.POST) 
	public String registerPOST(ShareTaskVO vo, RedirectAttributes attr) throws Exception {
		//logger.info("DB�Է� ��û........");
		System.out.println(vo);
		service.regist(vo);
		
		return "redirect:/sharetask/share_Board";
	}

	

	//�� 
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String modifyPageGet(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri,
            Model model, HttpServletRequest req) throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		cri.setDeptno(evo.getDeptno());
		
		// ������ ����
		ShareTaskVO prevvo=service.prevRead(bno, evo.getDeptno());
		ShareTaskVO nextvo=service.nextRead(bno, evo.getDeptno());
		System.out.println("bno="+bno+",deptno"+evo.getDeptno()+",prevvo="+prevvo);
		
		
		if(prevvo!=null){
	    model.addAttribute("prevBno", prevvo.getBno());//���� �� ����		
		
		}
		
		if(nextvo!=null){
			model.addAttribute("nextBno", nextvo.getBno());
			
		}
		model.addAttribute(service.read(bno));//���簪
		model.addAttribute("cri", cri);
		return "/sharetask/share_Select";
	}
	
	
	

	//������
	@RequestMapping("/prev")
	public String prevRead(int deptno, int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		
		 cri.setDeptno(deptno);
		
		 ShareTaskVO pvo = service.prevRead(bno, deptno);//���� Ŭ�� �� --> 25-->24
	    int prev=pvo.getBno();//24�� ����
	    ShareTaskVO nextvo = service.nextRead(prev,deptno); //24--->25

		ShareTaskVO prevvo=service.prevRead(prev, deptno);//24�� �ѹ��� �־��� ��--->23�� vo
		
		if(prevvo!=null){
			model.addAttribute("prevBno", prevvo.getBno());
		}
		
		if(nextvo !=null){
			model.addAttribute("nextBno", nextvo.getBno());
		}
		model.addAttribute(pvo);
		model.addAttribute("cri",cri);
		
		
		return "/sharetask/share_Select";	
	}

	//������
	 @RequestMapping("/next")
	public String nextRead(int deptno, int bno, @ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)throws Exception{
		 
		 cri.setDeptno(deptno);
		 ShareTaskVO nvo = service.nextRead(bno, deptno);
		 int next=nvo.getBno();
		 ShareTaskVO nextvo=service.nextRead(next, deptno);
		 ShareTaskVO prevvo=service.prevRead(next, deptno);
		 
		 if(nextvo!=null){
			 model.addAttribute("nextBno", nextvo.getBno());
		 }
		 if(prevvo!=null){
			 model.addAttribute("prevBno", prevvo.getBno());
		 }
		 
		model.addAttribute(nvo);
		model.addAttribute("cri", cri);
	
		return "/sharetask/share_Select";	
	}
	  
	// �󼼿��� ����
	@RequestMapping(value ="/change", method = RequestMethod.POST)
	public String modifyPagePost(ShareTaskVO vo, SearchCriteria cri, RedirectAttributes attr) throws Exception {
		   
		System.out.println("�������� = "+ vo);
		   service.change(vo);//�����۾�
	
		   attr.addAttribute("page", cri.getPage() );
		   attr.addAttribute("perPageNum", cri.getPerPageNum() );
		   attr.addAttribute("searchType", cri.getSearchType() );
		   attr.addAttribute("keyword", cri.getKeyword() );
		   
		return "redirect:/sharetask/share_Board";
	}

	
	@RequestMapping("/remove")
	public String deletePage(int bno, RedirectAttributes attr, Criteria
			cri) throws Exception {
		
		service.remove(bno);
		attr.addAttribute("page", cri.getPage());
		return "redirect:/sharetask/share_Board";
	}
	

	
	
	
	
}

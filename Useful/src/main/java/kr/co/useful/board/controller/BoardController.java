package kr.co.useful.board.controller;

import java.io.File;
import java.util.*;

import javax.inject.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	public String createPagePOST(BoardVO vo,RedirectAttributes att,HttpSession httpSession,MultipartHttpServletRequest multipartHttpServletRequest,@RequestParam("file") MultipartFile file)throws Exception{
	String writer=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
	int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
	//vo.setOriginal_file_name(file.getOriginalFilename()); //멀티파일로 오리지널 파일이름받음
	//String fname=file.getOriginalFilename();
	//System.out.println("읽어드린 파일명 =="+fname);
	//File f=new File("../upload"+fname);
	//file.transferTo(f);
	String realfolder="../upload/"; //파일저장될위치
	File dir=new File(realfolder);
	if(!dir.isDirectory()){
		dir.mkdirs();
	}
	List<MultipartFile> mf=multipartHttpServletRequest.getFiles("file");
	if(mf.size()==1&&mf.get(0).getOriginalFilename().equals("")){
		
	}else{
		for(int i=0;i<mf.size();i++){
			String genId=UUID.randomUUID().toString(); //파일중복명 처리해준다고하는데 UUID가 먼 역활인지 아직모름;;
			String originalfileName=mf.get(i).getOriginalFilename(); //본래 오리지날 파일명가져옴
			String saveFileName=genId+"."+originalfileName; //저장되는 파일명
			String savePath=realfolder+saveFileName; //저장될 파일경로
			long fileSize=mf.get(i).getSize();//파일사이즈구함
			mf.get(i).transferTo(new File(savePath)); //파일저장
			System.out.println("genid 값="+genId);
			System.out.println("originalfilename 값="+originalfileName);
			System.out.println("saveFileName 값 = "+saveFileName);
			System.out.println(" savePath = "+savePath);
			service.fileupload(originalfileName, saveFileName, fileSize);
		}
	}
	
	
	vo.setEmpno(empno);
	vo.setWriter(writer);
	service.insert(vo);
	att.addFlashAttribute("message", "SUCCESS");
	return "redirect:/board/listPage";
	}
	/*백업본
	@RequestMapping(value="/createPage",method=RequestMethod.POST)
	public String createPagePOST(BoardVO vo,RedirectAttributes att,HttpSession httpSession,HttpServletRequest servletRequest,@RequestParam("file") MultipartFile file)throws Exception{
	String writer=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
	int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
	vo.setEmpno(empno);
	vo.setWriter(writer);
	service.insert(vo);
	att.addFlashAttribute("message", "SUCCESS");
	return "redirect:/board/listPage";
	}*/
	
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

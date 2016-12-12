package kr.co.useful.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.*;

import javax.inject.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.*;

import kr.co.useful.approval.domain.PathMaker;
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
	@RequestMapping(value="/createPage",method=RequestMethod.POST)
	public String createPagePOST(BoardVO vo,RedirectAttributes att,HttpSession httpSession,HttpServletRequest request,MultipartHttpServletRequest multipartHttpServletRequest,@RequestParam("file") MultipartFile file)throws Exception{
	String writer=((EmpVO)httpSession.getAttribute("LoginUser")).getEname();
	int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
	System.out.println("request��"+request);
	String realfolder=PathMaker.getUploadPath(request); 
	System.out.println("�������� ��ġ =="+realfolder);
	File dir=new File(realfolder);
	if(!dir.isDirectory()){
		dir.mkdirs();
	}
	List<MultipartFile> mf=multipartHttpServletRequest.getFiles("file");
	if(mf.size()==0&&mf.get(0).getOriginalFilename().equals("")){
		
	}else{
		for(int i=0;i<mf.size();i++){
			String genId=UUID.randomUUID().toString(); //�����ߺ��� ó�����شٰ��ϴµ� UUID�� �� ��Ȱ���� ������;;
			String originalfileName=mf.get(i).getOriginalFilename(); //���� �������� ���ϸ�����
			String saveFileName=genId+"."+originalfileName; //����Ǵ� ���ϸ�
			String savePath=realfolder+"/"+saveFileName; //����� ���ϰ��
			long fileSize=mf.get(i).getSize();//���ϻ������
			mf.get(i).transferTo(new File(savePath)); //��������
			System.out.println("genid ��="+genId);
			System.out.println("originalfilename ��="+originalfileName);
			System.out.println("saveFileName �� = "+saveFileName);
			System.out.println(" savePath = "+savePath);
			//service.fileupload(originalfileName, saveFileName, fileSize);
			vo.setOriginalfileName(originalfileName);
			vo.setSaveFileName(saveFileName);
			vo.setFileSize(fileSize);
			vo.setEmpno(empno);
			vo.setWriter(writer);
			service.insert(vo);
		}
	}
	
	
	//vo.setEmpno(empno);
	//vo.setWriter(writer);
	//service.insert(vo);
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
	public String modifyPage(BoardVO vo,RedirectAttributes attr,SearchCriteria cri,HttpSession httpSession,@RequestParam("file") MultipartFile file,HttpServletRequest request,MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		String uploadpath = PathMaker.getUploadPath(request);
		String uploadrealpath = PathMaker.getRealPath(request);
		String time = PathMaker.getTime();
		BoardVO v20=service.read(vo.getSerial());
		String savename=v20.getSaveFileName();
		File deluploadfile = new File(uploadpath+"/"+savename);
		File deluploadrealfile = new File(uploadrealpath+"/"+savename);
		if(deluploadfile!=null && deluploadfile.exists()) deluploadfile.delete();
		if(deluploadrealfile!=null && deluploadrealfile.exists()) deluploadrealfile.delete();
		
		File dir=new File(uploadpath);
		if(!dir.isDirectory()){
			dir.mkdirs();
		}
		List<MultipartFile> mf=multipartHttpServletRequest.getFiles("file");
		if(mf.size()==0&&mf.get(0).getOriginalFilename().equals("")){
			
		}else{
			for(int i=0;i<mf.size();i++){
				String genId=UUID.randomUUID().toString();
				String originalfileName=mf.get(i).getOriginalFilename();
				String saveFileName=genId+"."+originalfileName;
				String savePath=uploadpath+"/"+saveFileName;
				long fileSize=mf.get(i).getSize();
				mf.get(i).transferTo(new File(savePath));
				System.out.println("공지게시판 저장파일명 = "+originalfileName);
				System.out.println("공지게시판  저장되는 파일명 = "+saveFileName);
				System.out.println("공지게시판 저장되는 위치 = "+savePath);
				vo.setOriginalfileName(originalfileName);
				vo.setSaveFileName(saveFileName);
				vo.setFileSize(fileSize);
				vo.setEmpno(empno);
				service.modify(vo);
			}
		
		
		
		}
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perpageNum", cri.getPerPageNum());
		 attr.addAttribute("searchType", cri.getSearchType() );
		   attr.addAttribute("keyword", cri.getKeyword() );
		return "redirect:/board/listPage";
   }
		
 /*  @RequestMapping(value="/modifyPage",method=RequestMethod.POST) 
	public String modifyPage(BoardVO vo,RedirectAttributes attr,SearchCriteria cri,HttpSession httpSession) throws Exception {
		int empno=((EmpVO)httpSession.getAttribute("LoginUser")).getEmpno();
		vo.setEmpno(empno);
		service.modify(vo);
		attr.addFlashAttribute("page", cri.getPage());
		attr.addFlashAttribute("perpageNum", cri.getPerPageNum());
		 attr.addAttribute("searchType", cri.getSearchType() );
		   attr.addAttribute("keyword", cri.getKeyword() );
		return "redirect:/board/listPage";
	}*/
	
	@RequestMapping("/deletePage") 
	public String deletePage(int serial,String originalfileName,HttpServletRequest request)throws Exception {
		BoardVO vo=service.read(serial);
		String savafilename=vo.getSaveFileName();
		File savafile=new File(PathMaker.getUploadPath(request)+"/"+savafilename);
		File savafile2=new File(PathMaker.getRealPath(request)+"/"+savafilename);
		if(savafile!=null && savafile.exists()) savafile.delete();
		if(savafile2!=null && savafile2.exists()) savafile2.delete();
		service.delete(serial);
		return "redirect:/board/listPage";
	}
	
	/*@RequestMapping("/deletePage") 
	public String deletePage(int serial,String originalfileName,HttpServletRequest request)throws Exception {
		service.delete(serial);
		return "redirect:/board/listPage";
	}*/
	
	
	@RequestMapping("/download")
	public void file_download(@RequestParam("originalfileName") String originalfileName,@RequestParam("serial") int serial, HttpServletRequest request, HttpServletResponse res)throws Exception{
		String realfolder=PathMaker.getUploadPath(request);
		String fileName = null;
		String oname=service.sava_File_name(serial);
		System.out.println("저장된 파일명"+oname);
		System.out.println("다운로드 경로="+realfolder);
        File file = new File(realfolder+"/"+oname);
        res.setContentType("application/download;");
        int length = (int) file.length();
        res.setContentLength(length);
 
        // �ͽ��÷η� ���� Ȯ��
        String userAgent = request.getHeader("User-Agent");
        boolean ie = userAgent.indexOf("MSIE") > -1;
 
        if (ie) {
            fileName = URLEncoder.encode(file.getName(), "utf-8").replace("+",  "%20");
        } else {
            fileName = new String(file.getName().getBytes("utf-8"), "iso-8859-1").replace("+", "%20");
        }
        System.out.println("�ٿ�ε����� ���ϸ�="+fileName);
 
        res.setHeader("Content-Disposition", "attachment;" + " filename=\"" + fileName + "\";"); 
        OutputStream out = res.getOutputStream();
        FileInputStream fis = null;
 
        try {
            int temp;
            fis = new FileInputStream(file);
            while ((temp = fis.read()) != -1) {
                out.write(temp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
		
	};
	
	/*@ResponseBody
	@RequestMapping(value="/download")
	public ResponseEntity<byte[]> file_download(@RequestParam("originalfileName") String originalfileName,HttpServletRequest request)throws Exception{
		String realfolder=PathMaker.getUploadPath(request); //��ιޱ�
		ResponseEntity<byte[]> entity = null;
		InputStream fis = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			fis = new FileInputStream(realfolder+"/"+originalfileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment;originalfileName=\""
							+originalfileName+"\"");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(fis),headers,HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			fis.close();
		}
		
		return entity;
	};*/

}

package kr.co.useful.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.approval.domain.PathMaker;
import kr.co.useful.board.domain.AnonymityVO;
import kr.co.useful.board.domain.NoticeVO;
import kr.co.useful.board.domain.PageMaker;
import kr.co.useful.board.domain.ReplyVO;
import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.board.service.AnonymityService;
import kr.co.useful.board.service.ReplyAnonymityService;
import kr.co.useful.board.service.ReplyService;
import kr.co.useful.manager.domain.EmpVO;

@Controller
@RequestMapping("/board/anonymity")
public class BoardanonymityController {
	
		@Inject
		private AnonymityService service;
		@Inject
		private ReplyAnonymityService reservice; 
		
		@RequestMapping("/listPage")
		public void listPage(SearchCriteria cri,Model model) throws Exception {
			PageMaker pageMaker=new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.listFindCount(cri));
			pageMaker.calc();
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("list", service.listSearch(cri));
		};
		@RequestMapping(value="/createPage",method=RequestMethod.GET)
		public void createPageGET() throws Exception {
		};
		
		@RequestMapping(value="/createPage",method=RequestMethod.POST)
		public String createPagePOST(AnonymityVO vo,RedirectAttributes att,HttpSession httpSession,HttpServletRequest request,MultipartHttpServletRequest multipartHttpServletRequest,@RequestParam("file") MultipartFile file)throws Exception{
			String realfolder=PathMaker.getUploadPath(request); 
			System.out.println("업로드되는 폴더 경로 = "+realfolder);
			File dir=new File(realfolder);
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
					String savePath=realfolder+"/"+saveFileName;
					long fileSize=mf.get(i).getSize();
					mf.get(i).transferTo(new File(savePath));
					System.out.println("공지게시판 저장파일명 = "+originalfileName);
					System.out.println("공지게시판  저장되는 파일명 = "+saveFileName);
					System.out.println("공지게시판 저장되는 위치 = "+savePath);
					vo.setOriginalfileName(originalfileName);
					vo.setSaveFileName(saveFileName);
					vo.setSaveFileName(saveFileName);
					vo.setFileSize(fileSize);
					service.create(vo);
				}
		
		}
			att.addFlashAttribute("message", "SUCCESS");
			return "redirect:/board/anonymity/listPage";
		}

		@RequestMapping(value="/modifyPage",method=RequestMethod.GET) 
		public void modifyPage(int serial,Model model)throws Exception{
			AnonymityVO board=service.read(serial);
			model.addAttribute("board", board);
			
		}
		
		@RequestMapping(value="/modifyPage",method=RequestMethod.POST) 
		public String modifyPage(AnonymityVO vo,RedirectAttributes attr)throws Exception {
			service.update(vo);
			/*attr.addFlashAttribute("page", cri.getPage());
			attr.addFlashAttribute("perpageNum", cri.getPerPageNum());*/
			return "redirect:/board/anonymity/listPage";
		}

		@RequestMapping("/deletePage") 
		public String deletePage(int serial,String originalfileName,HttpServletRequest request)throws Exception{
			AnonymityVO board=service.read(serial);
			String savafilename=board.getSaveFileName();
			File savafile=new File(PathMaker.getUploadPath(request)+"/"+savafilename);
			File savafile2=new File(PathMaker.getRealPath(request)+"/"+savafilename);
			if(savafile!=null && savafile.exists()) savafile.delete();
			if(savafile2!=null && savafile2.exists()) savafile2.delete();
			service.delete(serial);
			return "redirect:/board/anonymity/listPage";
		}

		@RequestMapping("/readPage")
		public void readPage(int serial,Model model,SearchCriteria cri)throws Exception {
		AnonymityVO board=service.read(serial);
		List<ReplyVO> list=reservice.listAll(serial);
		service.viewcnt(serial);
		PageMaker pageMaker=new PageMaker();

		pageMaker.setCri(cri);
		pageMaker.calc();
		model.addAttribute("maker", pageMaker);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		model.addAttribute("cri", cri);
		}
		@RequestMapping(value="/passcheckPage",method=RequestMethod.GET)
		public void passcheckPage(int serial,Model model)throws Exception{
			model.addAttribute("serial", serial);
		}
		@RequestMapping(value="/passcheckPage",method=RequestMethod.POST)
		public @ResponseBody String passcheck(int serial, String pass,	Model model)throws Exception{
			
			String correctpass = service.pass_check(serial);
			if(correctpass.equals(pass)){
				return "SUCCESS";
			}
			else return "fail";
		}
		@RequestMapping(value="/bPassPage",method=RequestMethod.GET)
		public void bPassPage(int serial,Model model)throws Exception{
			model.addAttribute("serial", serial);
		}
		
		@RequestMapping(value="/bPassPage",method=RequestMethod.POST)
		public @ResponseBody String bPassPage2(int serial,Model model,String pass)throws Exception{
			String dpass=service.pass_check(serial);
			if(dpass.equals(pass)){
				service.delete(serial);
				return "SUCCESS";
			}
			return "fail";
			
		}
		
		@RequestMapping("/download")
		public void file_download(@RequestParam("originalfileName") String originalfileName,@RequestParam("serial") int serial, HttpServletRequest request, HttpServletResponse res)throws Exception{
			String realfolder=PathMaker.getUploadPath(request);
			String fileName = null;
			String oname=service.save_download(serial);
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
		
	}


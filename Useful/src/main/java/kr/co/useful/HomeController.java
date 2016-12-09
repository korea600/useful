package kr.co.useful;

import java.io.FileReader;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.useful.approval.domain.PathMaker;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goToLogin() {
		return "redirect:/login/Login";
	}
	@RequestMapping("/path")
	public void path(HttpServletRequest request)throws Exception{
		ServletContext application = request.getServletContext();
		String realpath=PathMaker.getRealPath(request).replace('\\', '/');
		System.out.println("realpath : "+realpath);
		String propertypath=realpath.substring(0, realpath.indexOf("org.eclipse"))+"org.eclipse.core.resources/.projects"+application.getContextPath()+"/org.eclipse.egit.core";
		String workspacepath=propertypath.substring(0, propertypath.indexOf(".metadata"));
		System.out.println("workspace : "+workspacepath);
		String filename="GitProjectData.properties";
		System.out.println("설정파일 위치 : "+propertypath+"/"+filename);
		Properties pro = new Properties();
		pro.load(new FileReader(propertypath+"/"+filename));
		String gitdir = pro.getProperty(".gitdir");
		gitdir = gitdir.substring(0, gitdir.indexOf(".git"))+"git";
		/*System.out.println("git : "+workspacepath+gitdir);*/
		/*String gitdir = workspacepath+.substring(beginIndex, endIndex);*/
		System.out.println(gitdir);
	}
}

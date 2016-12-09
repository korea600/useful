package kr.co.useful;

import java.io.BufferedReader;
import java.io.File;
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
		String propertypath=realpath.substring(0, realpath.indexOf("org.eclipse"))+"org.eclipse.core.resources/.projects"+application.getContextPath();//+"/org.eclipse.egit.core";
//		String filename="GitProjectData.properties";
		String filename=".location";
		System.out.println("설정파일 위치 : "+propertypath+"/"+filename);
		String workspacepath=propertypath.substring(0, propertypath.indexOf(".metadata"));
		System.out.println("workspace : "+workspacepath);
		BufferedReader br = new BufferedReader(new FileReader(propertypath+"/"+filename));
		String gitdir=br.readLine();
		gitdir=gitdir.substring(gitdir.indexOf("file:/")+6);
		System.out.println(gitdir);
	}
}

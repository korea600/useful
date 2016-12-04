package kr.co.useful.approval.domain;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class PathMaker {
	public static String getRealPath(HttpServletRequest request){
		return request.getServletContext().getRealPath("");
	}
	public static String getUploadPath(HttpServletRequest request){
		ServletContext application = request.getServletContext();
		String realpath=application.getRealPath("").replace('\\', '/');
		String uploadFolder = realpath.substring(0, realpath.indexOf("/workspace"))+"/git"
							+application.getContextPath()
							+"/"+application.getInitParameter("projectName")
							+"/src/main/webapp/upload";
		return uploadFolder;
	}
}

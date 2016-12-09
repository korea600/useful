package kr.co.useful.approval.domain;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class PathMaker {
	public static String getRealPath(HttpServletRequest request){	// Eclipse에 업로드되는 실제경로 리턴
		return request.getServletContext().getRealPath("");
	}
	public static String getUploadPath(HttpServletRequest request) throws Exception{	// GIT폴더 내부의 업로드 경로 리턴
		ServletContext application = request.getServletContext();
		String realpath=application.getRealPath("").replace('\\', '/');
		String propertypath=realpath.substring(0, realpath.indexOf("org.eclipse"))+"org.eclipse.core.resources/.projects"+application.getContextPath();
		String filename=".location";
		BufferedReader br = new BufferedReader(new FileReader(propertypath+"/"+filename));
		String gitdir=br.readLine();
		gitdir=gitdir.substring(gitdir.indexOf("file:/")+6,gitdir.indexOf("Useful")+6);
		String uploadFolder=gitdir+"/src/main/webapp/upload";
		return uploadFolder;
	}
	public static String getTime(){
		Calendar cal = Calendar.getInstance();
		String year = ""+cal.get(Calendar.YEAR);
		String month = ""+(cal.get(Calendar.MONTH)+1);
		if(month.length()==1) month="0"+month;
		String day = ""+cal.get(Calendar.DAY_OF_MONTH);
		if(day.length()==1) day="0"+day;
		String hrs = ""+cal.get(Calendar.HOUR_OF_DAY);
		if(hrs.length()==1) hrs="0"+hrs;
		String min = ""+cal.get(Calendar.MINUTE);
		if(min.length()==1) min="0"+min;
		String sec = ""+cal.get(Calendar.SECOND);
		if(sec.length()==1) sec="0"+sec;
		return year+month+day+hrs+min+sec;
	}
}

package kr.co.useful.downloadViewResolver;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadViewResolver extends AbstractView{

	public void download(){
		setContentType("application/download;UTF-8");
	}
	
	protected void renderMergedOutputModel(Map<String, Object> map,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		File file = (File) map.get("fileDownload");
		/*String type=map.get("type").toString();*/
		response.setContentType(getContentType());
		response.setContentLength((int) file.length());
		String userAgent=request.getHeader("User-Agent");
		boolean isIE = userAgent.indexOf("MSIE")>-1;
		String filename=null;
		if(isIE)
			filename=URLEncoder.encode(file.getName(),"UTF-8");
		else
			filename=new String(file.getName().getBytes("UTF-8"));
		response.setHeader("Content-Disposition","attachment;filename=\""+filename+"\";");
		/*response.setHeader("Content-Disposition","attachment;filename=\""+filename+type+"\";");*/
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis=null;
		try{
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			if(fis!=null){
				try{ fis.close(); }
				catch (Exception e) {}
			}
		}
		out.flush();
	}
	
}

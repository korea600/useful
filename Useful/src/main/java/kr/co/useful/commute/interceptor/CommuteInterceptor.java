package kr.co.useful.commute.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.useful.manager.domain.EmpVO;

public class CommuteInterceptor extends HandlerInterceptorAdapter{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		EmpVO vo = (EmpVO) request.getSession().getAttribute("LoginUser");
		if(vo!=null) return true;
		else{
			saveDest(request);
			request.getSession().removeAttribute("LoginUser");
			response.sendRedirect("/useful");
			return false;
		}
	}
	
	public void saveDest(HttpServletRequest req){
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		uri = uri.substring(uri.indexOf("/",2));
		
		if(query== null ) query="";
		else query = "?"+query;
		
		if(req.getMethod().equals("GET")){
			req.getSession().setAttribute("dest", uri+query);
		}
	}
}

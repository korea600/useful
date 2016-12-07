package kr.co.useful.approval.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.useful.manager.domain.EmpVO;

public class ApprovalInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*System.out.println("prehandle");
		HandlerMethod method=(HandlerMethod) handler;
		System.out.println("처리 메소드 bean : " + method.getBean());
		System.out.println("처리 메소드 method : " + method.getMethod());*/
		EmpVO vo = (EmpVO) request.getSession().getAttribute("LoginUser");
		if(vo!=null) return true;
		else{
			saveDest(request);
			request.getSession().removeAttribute("LoginUser");
			response.sendRedirect("/useful/session_lost");
			return false;
		}
	}
	
	private void saveDest(HttpServletRequest request){	// 로그인여부 확인 전에 요청한 uri와 query저장
		String uri = request.getRequestURI();
		String query = request.getQueryString();	// getQueryString : 요청uri뒤에 붙는 '?'를 return
		if(query==null)	query="";
		else query="?"+query;
		if(request.getMethod().equals("GET"))
			request.getSession().setAttribute("dest", uri+query);	
	}
}

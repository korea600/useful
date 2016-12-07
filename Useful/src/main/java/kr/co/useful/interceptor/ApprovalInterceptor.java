package kr.co.useful.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.useful.manager.domain.EmpVO;

public class ApprovalInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("prehandle");
		HandlerMethod method=(HandlerMethod) handler;
		System.out.println("贸府 皋家靛 bean : " + method.getBean());
		System.out.println("贸府 皋家靛 method : " + method.getMethod());
		EmpVO vo = (EmpVO) request.getSession().getAttribute("LoginUser");
		if(vo!=null) return true;
		else{
			request.getSession().invalidate();
			response.sendRedirect("/useful/session_lost");
			return false;
		}
	}
}

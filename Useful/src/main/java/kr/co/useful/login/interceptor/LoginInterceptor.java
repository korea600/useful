package kr.co.useful.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	/*@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle 이건가");
				//이전 로그인 정보 삭제
				HttpSession session = request.getSession();
				
				if(session.getAttribute("LoginUser") != null){
					session.removeAttribute("LoginUser");
					System.out.println(">>> 이전 로그인 정보 삭제!!");
				}
				
				return true;
	}*/
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("여기는 들어오나");
			Object vo = request.getSession().getAttribute("LoginUser");
			if(vo != null){
				System.out.println("로그인성공!!");
				
			String dest = (String) request.getSession().getAttribute("dest");
			if(dest != null){
				modelAndView.setViewName("redirect:"+dest);
			}
			
			}	
		
	}
}

package kr.co.useful.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.useful.manager.domain.EmpVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("여기는 들어오나");
		EmpVO vo = (EmpVO) request.getSession().getAttribute("LoginUser");
		if(vo != null){
			System.out.println("로그인성공!!");
			String dest = (String) request.getSession().getAttribute("dest");
			if(dest != null){
				request.getSession().removeAttribute("dest");
				modelAndView.setViewName("redirect:"+dest);
			}
		}
	}
}

package kr.co.useful.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.useful.manager.domain.EmpVO;

public class BoardInterceptor extends HandlerInterceptorAdapter{
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
	
	private void saveDest(HttpServletRequest request){	// �α��ο��� Ȯ�� ���� ��û�� uri�� query����
		String uri = request.getRequestURI();
		String query = request.getQueryString();	// getQueryString : ��ûuri�ڿ� �ٴ� '?'�� return
		uri = uri.substring(uri.indexOf("/",2));
		if(query==null)	query="";
		else query="?"+query;
		if(request.getMethod().equals("GET"))
			request.getSession().setAttribute("dest", uri+query);	
	}
}

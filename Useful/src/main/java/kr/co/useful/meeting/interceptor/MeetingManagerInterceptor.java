package kr.co.useful.meeting.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.useful.manager.domain.EmpVO;

public class MeetingManagerInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		EmpVO vo = (EmpVO) request.getSession().getAttribute("LoginUser");
		if(vo!=null){
			if(vo.getEmpno()==1001)
				return true;
			else{
				response.sendRedirect("/useful/access-control");
				return false;
			}
		}	
			
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
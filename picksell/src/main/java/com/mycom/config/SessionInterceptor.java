package com.mycom.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		//System.out.println("session인터셉터");
		//return true;
		Object userId = request.getSession().getAttribute("sessionId");
		
		
		//만약에 로그인이 안된상태에서 다른 페이지로 가려고하면
		if(userId == null) {
			response.sendRedirect("/picksell/loginForm");
			return false;
		}else
			return true;
		
		 
		
		
		/*//만약에 로그인이 된상태에서 로그인이나 회원가입 url 로 가려고 하면
				if(request.getRequestURI().equals("/SummerBoard/login.do") || request.getRequestURI().equals("/SummerBoard/member/join.do")) {
					if(userId != null) {
						response.sendRedirect("/SummerBoard/board/list.do");
						return true;
					}else
						return true;
				}
				
				//만약에 로그인이 안된상태에서 다른 페이지로 가려고하면
				if(userId == null && !request.getRequestURI().equals("/SummerBoard/member/checkID.do")) {
					response.sendRedirect("/SummerBoard/login.do");
					return true;
				}else
					return true;*/
		
	}
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handle, ModelAndView modelAndView) throws Exception{
		
		
	}
	
}

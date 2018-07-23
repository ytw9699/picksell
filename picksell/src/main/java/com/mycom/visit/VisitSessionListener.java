package com.mycom.visit;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;


public class VisitSessionListener implements HttpSessionListener {
	 
	@Resource
	private VisitCountService visitCountService;
	 
	Map<String,Object> totalCount = new HashMap<String,Object>();
	Map<String,Object> todayCount = new HashMap<String,Object>();
	
	
	@Override
	 public void sessionCreated(HttpSessionEvent sessionEve){
	     HttpSession session = sessionEve.getSession();
		 WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		 //등록되어 있는 빈을 사용할 수 있도록 설정
		 HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		//request를 파라미터에 넣지 않고도 사용할 수 있도록 설정
		 try {	
			  System.out.println(("세션 생성2"));
			   
			  visitCountService.visitInsert();
			  totalCount = visitCountService.totalvisit();
			  todayCount = visitCountService.visitToday();
			  session.setAttribute("totalCount",totalCount);
			  session.setAttribute("todayCount", todayCount);
		   }catch(Exception e) {
			   System.out.println("--방문자 카운터 오류--");
			   e.printStackTrace();
		   }
	} 
	 @Override
	 public void sessionDestroyed(HttpSessionEvent sessionEve){
	        //TODO Auto-generated method stub
	 
	 
	 }
}

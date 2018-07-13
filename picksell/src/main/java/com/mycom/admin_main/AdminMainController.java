package com.mycom.admin_main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	//관리자페이지 or 로고가 있다면 선택 redirect
	ModelAndView mv = new ModelAndView();
	
	@Resource
	public AdminMainService AdminMainService;
	
	ModelAndView mav = new ModelAndView();
	
	
	
	@RequestMapping(value="/main")
	public String main(Model model)throws Exception{

	    List<String> daylist = new ArrayList();
	    List<Integer> countlist = new ArrayList();
		Calendar c1 = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("MMdd");
	   	String day = sdf.format(c1.getTime());  //today
	    daylist.add(day);
	    java.math.BigDecimal tempValue = (java.math.BigDecimal)AdminMainService.memberJoinCount(day).get("COUNT");
	    countlist.add(Integer.valueOf(tempValue.toString()));
		for(int i= 1; i < 8; i++) {
		  c1.add(Calendar.DATE,-1);
		  day = sdf.format(c1.getTime());
		  daylist.add(day);
		  tempValue = (java.math.BigDecimal)AdminMainService.memberJoinCount(day).get("COUNT");
		  countlist.add(Integer.valueOf(tempValue.toString()));  
		  
		}
		model.addAttribute("daylist",daylist);
	    model.addAttribute("countlist",countlist);
		return "adminMain";
	}
	
}

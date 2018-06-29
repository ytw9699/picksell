package com.mycom.admin_main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/admin")
public class AdminMainController {
	//관리자페이지 or 로고가 있다면 선택 redirect
	ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="/main")
	public String main(){
		return "/admin_main/adminMain";
	}


	
}

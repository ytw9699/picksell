package com.mycom.admin_singo;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_singo.AdminSingoModel;
import com.mycom.admin_singo.AdminSingoService;

@Controller
@RequestMapping("/admin/singo")
public class AdminSingoController {

	@Resource
	private AdminSingoService adminSingoService;
	
	ModelAndView mav = new ModelAndView();
	
	AdminSingoController(){
		
	}
	
	@RequestMapping("/list")
	public ModelAndView adminSingoList() {
		
		return mav;
		
	}

	@RequestMapping("/detail")
	public ModelAndView adminSingoDetail() {
		
		return mav;
		
	}
	
}

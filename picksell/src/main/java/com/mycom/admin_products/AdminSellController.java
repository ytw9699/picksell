package com.mycom.admin_products;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_products.AdminSellModel;
import com.mycom.admin_products.AdminSellService;


@Controller
@RequestMapping("/admin/products")
public class AdminSellController {

	@Resource
	private AdminSellService adminSellService;
	
	ModelAndView mav = new ModelAndView();
	
	AdminSellController(){
		
	}
	
	@RequestMapping("/list")
	public ModelAndView adminProductList() {
		
		return mav;
		
	}
	
	@RequestMapping("/search")
	public ModelAndView adminProductSearch() {
		
		return mav;
		
	}
	
}

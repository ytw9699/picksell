package com.mycom.admin_order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_order.AdminPaymentModel;
import com.mycom.admin_order.AdminPaymentService;

@Controller
@RequestMapping("/admin/order")
public class AdminPaymentController {
	
	@Resource
	private AdminPaymentService adminPaymentService;
	
	ModelAndView mav = new ModelAndView();
	
	AdminPaymentController(){
		
	}
	@RequestMapping("/list")
	public ModelAndView adminOrderList() {
		
		return mav;
		
	}
	
	@RequestMapping("/search")
	public ModelAndView orderSearch() {
		
		return mav;
		
	}
	
	@RequestMapping("/confirmProc")
	public ModelAndView orderConfirm() {
		
		return mav;
		
	}
	
	@RequestMapping("/deliveryProc")
	public ModelAndView adminDeliveryConfirm() {
		
		return mav;
		
	}
	
	@RequestMapping("/orderTerminate")
	public ModelAndView adminOrderTerminate() {
		
		return mav;
		
	}
	
}

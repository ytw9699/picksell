package com.mycom.admin_order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_order.AdminPaymentModel;
import com.mycom.admin_order.AdminPaymentListModel;
import com.mycom.admin_order.AdminPaymentService;

@Controller
@RequestMapping("/admin_order")
public class AdminPaymentController {
	
	@Resource
	private AdminPaymentService adminPaymentService;
	
	ModelAndView mav = new ModelAndView();
	
	AdminPaymentModel adminPaymentModel = new AdminPaymentModel();
	AdminPaymentListModel adminPaymentListModel = new AdminPaymentListModel();
	
	private List<AdminPaymentModel> orderList = new ArrayList<AdminPaymentModel>();
	private List<AdminPaymentListModel> orderList2 = new ArrayList<AdminPaymentListModel>();
	
	AdminPaymentController(){
		
	}
	@RequestMapping("/list")
	public ModelAndView adminOrderList(HttpServletRequest request) {
		
		//String order_num = request.getParameter("order_num");
		
		orderList = adminPaymentService.orderList();
		
		mav.addObject("orderList",orderList);
		mav.setViewName("admin_order/orderList");
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

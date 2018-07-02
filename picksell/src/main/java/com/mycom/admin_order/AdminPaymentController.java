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
	private int searchNum;
	private String isSearch;
	
	AdminPaymentModel adminPaymentModel = new AdminPaymentModel();
	AdminPaymentListModel adminPaymentListModel = new AdminPaymentListModel();
	
//	private List<AdminPaymentModel> orderList = new ArrayList<AdminPaymentModel>();
	private List<AdminPaymentListModel> orderList2 = new ArrayList<AdminPaymentListModel>();
	
	AdminPaymentController(){
		
	}
	@RequestMapping("/list")
	public ModelAndView adminOrderList(HttpServletRequest request) {
		
		//String order_num = request.getParameter("order_num");
		
		List<AdminPaymentModel> orderList = adminPaymentService.orderList();
		
		isSearch = request.getParameter("isSearch");
		if(isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum==0) //구매자 
				orderList = adminPaymentService.orderSearch0(isSearch);
			else if(searchNum == 1) // 상태 
				orderList = adminPaymentService.orderSearch1(isSearch);
			else if(searchNum == 2) // 택배사 
				orderList = adminPaymentService.orderSearch2(isSearch);
			
		}
		
		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum",searchNum);
		mav.setViewName("admin_order/orderList");
		return mav;
		
	}
	
	@RequestMapping("/adminMain")
	public ModelAndView adminMain() {
		
		mav.setViewName("admin_order/adminMain");
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

package com.mycom.client_order;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@RequestMapping(value="/purchase/order", method=RequestMethod.POST)
	public String orderProc(
			OrderModel orderModel,
			HttpServletRequest request,
			Model model) {
	
		List<OrderListModel> parameterList = orderModel.getO_list();
		orderModel.setBuyer_id(request.getSession().getAttribute("sessionId").toString());
		
		
		orderService.insertBatchOrder(orderModel, parameterList);
		
		model.addAttribute("total_price", orderModel.getTotal_price());
		
		return "orderSuccess";
	}

}

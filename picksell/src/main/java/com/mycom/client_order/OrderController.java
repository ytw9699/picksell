package com.mycom.client_order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	
	@RequestMapping(value="/purchase/order", method=RequestMethod.POST)
	public String orderProc(OrderModel orderModel) {
		
		
		System.out.println(orderModel.getO_list().size());
		
		
		return "orderSuccess";
	}

}

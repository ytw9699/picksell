package com.mycom.client_order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.client_purchase.PurchaseService;

@Controller
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@RequestMapping(value="/purchase/order", method=RequestMethod.POST)
	public String orderProc(
			OrderModel orderModel,
			HttpServletRequest request,
			Model model,
			@RequestParam(value="o_list[0].product_num", required=false, defaultValue="0") String product_num, //by 태원
			@RequestParam(value="buyer_id", required=false, defaultValue="0") String buyer_id //by 태원
			) {
		List<OrderListModel> parameterList = orderModel.getO_list();
		orderModel.setBuyer_id(request.getSession().getAttribute("sessionId").toString());
		
		orderService.insertBatchOrder(orderModel, parameterList);
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();//by 태원
		
		parameterMap.put("PRODUCT_NUM",product_num);//by 태원
		parameterMap.put("BUYER_ID", buyer_id);//by 태원
		
		if(!product_num.equals("0")) {
		orderService.deletePURCHASE_LIST(parameterMap);//일반구매 완료시 오더리스트 한줄 삭제 by 태원
		}
		model.addAttribute("total_price", orderModel.getTotal_price());
		
		return "orderSuccess";
	}

}

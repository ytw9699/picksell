package com.mycom.client_purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.core.Ordered;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycom.client_basket.BasketModel;
import com.mycom.client_basket.BasketProductModel;
import com.mycom.client_order.OrderService;

@Controller
public class PurchaseController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	//단일결제준비폼
	@RequestMapping(value="/purchase/order/single", method=RequestMethod.POST)
	public String baketOrder(BasketModel basketModel, Model model) {
		
		//
		List<BasketProductModel> resultList = new ArrayList<BasketProductModel>();
		
		BasketProductModel tmp = new BasketProductModel();
		tmp.setOrderSum(basketModel.getP_list().get(0).getOrderSum());
		tmp.setProduct_currentPrice(basketModel.getTotalSum());
		tmp.setProduct_img(basketModel.getP_list().get(0).getProduct_img());
		tmp.setProduct_num(basketModel.getP_list().get(0).getProduct_num());
		tmp.setProduct_price(basketModel.getP_list().get(0).getProduct_price());
		tmp.setProduct_subject(basketModel.getP_list().get(0).getProduct_subject());
		tmp.setSeller_id(basketModel.getP_list().get(0).getSeller_id());
		tmp.setProduct_howtosell(basketModel.getP_list().get(0).getProduct_howtosell());
		
		resultList.add(tmp);
	
		/*System.out.println("결제총액:::"+basketModel.getTotalSum());
		
		//여기서 넣어줘야함 뷰에서 넣지말자
		System.out.println("상품현재가격(총액):::"+basketModel.getP_list().get(0).getProduct_currentPrice());
		System.out.println("상품이미지:::"+basketModel.getP_list().get(0).getProduct_img());
		System.out.println("상품번호:::"+basketModel.getP_list().get(0).getProduct_num());
		System.out.println("상품원금:::"+basketModel.getP_list().get(0).getProduct_price());
		System.out.println("상품제목:::"+basketModel.getP_list().get(0).getProduct_subject());
		System.out.println("상품판매자:::"+basketModel.getP_list().get(0).getSeller_id());
		System.out.println("상품주문수량:::"+basketModel.getP_list().get(0).getOrderSum());
		*/
		
		model.addAttribute("totalSum", basketModel.getTotalSum());
		model.addAttribute("resultList", resultList);
		
		return "orderReady";
	}
	
	
	//결제 성공페이지
	
	

}

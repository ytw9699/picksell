package com.mycom.client_basket;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BasketController {

	@Resource(name="basketService")
	private BasketService basketService;
	
	//장바구니리스트 보기
	@RequestMapping("/cart")
	public String gotoBasket(
			HttpServletRequest request) {
		
		String currentID = request.getSession().getAttribute("sessionId").toString();
		
		
		
		return "basketList";
	}
	
	@RequestMapping("/fetchTest")
	public String fetchTest() {
		
		System.out.println("패치실행");
		return "fetchTest";
	}
	
	//장바구니담기
	@RequestMapping("/cart/into/{pn}/{currentID}")
	public String putBasket(
			@PathVariable("pn") int product_num,
			@PathVariable("currentID") String currentID,
			Model model) {
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("basket_id", currentID);
		parameterMap.put("product_num", product_num);
		//parameterMap.put("product_quantity", 1);

		basketService.insertBasket(parameterMap);
	
		model.addAttribute("redirect", 3);
		model.addAttribute("product_num", product_num);
		return "client_product/redirecting";
	}
	
}

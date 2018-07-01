package com.mycom.client_basket;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BasketController {

	@Resource(name="basketService")
	private BasketService basketService;
	
	//장바구니리스트 보기
	@RequestMapping("/cart")
	public String gotoBasket(
			HttpServletRequest request) {
		
		
		
		return "basketList";
	}
	
	//장바구니담기
	@RequestMapping("/cart/into/{ca}/{pn}/{cp}")
	public String putBasket(
			HttpServletRequest request,
			@PathVariable("ca") int category_num,
			@PathVariable("pn") int product_num,
			@PathVariable("cp") int currentPage,
			Model model) {
		
		model.addAttribute("redirect", 3);
		model.addAttribute("category_num", category_num);
		model.addAttribute("product_num", product_num);
		model.addAttribute("currentPage", currentPage);
		return "client_product/redirecting";
	}
	
}

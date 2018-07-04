package com.mycom.client_basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BasketController {

	@Resource(name="basketService")
	private BasketService basketService;
	
	@RequestMapping("/cart/countingMyBasket")
	@ResponseBody
	public Map<String, Object> countingMyBasketSum(HttpServletRequest request){
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String sessionId = (String) request.getSession().getAttribute("sessionId");
		
		if(sessionId != null) {
			int resultSum = basketService.countingMyBasket(sessionId);
			resultMap.put("currentCounting", resultSum);
		}else if(sessionId == null) {
			resultMap.put("currentCounting", 0);
		}
		return resultMap;
	}
	
	//장바구니리스트 보기
	@RequestMapping("/cart")
	public String gotoBasket(
			HttpServletRequest request,
			Model model) {
		
		String currentID = request.getSession().getAttribute("sessionId").toString();
		
		List<Map<String, Object>> resultList = basketService.selectBasketList(currentID);
	
		model.addAttribute("listSize", resultList.size());
		model.addAttribute("resultList", resultList);
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
	
	//장바구니수량올리기
	@RequestMapping("/cart/addQuantity/{targetNum}")
	public String addQuantity(
			@PathVariable("targetNum") int basket_num,
			Model model) {
		
		basketService.addQuantity(basket_num);
		
		return "client_basket/basketFetchView";
	}
	
	//장바구니수량줄이기
	@RequestMapping("/cart/subQuantity/{targetNum}")
	public String subQuantity(
			@PathVariable("targetNum") int basket_num,
			Model model) {

		basketService.subQuantity(basket_num);
		
		return "client_basket/basketFetchView";
	}
	//장바구니삭제하기
	@RequestMapping("/cart/delete/{basket_num}")
	public String deleteBasket(
			@PathVariable("basket_num") int basket_num) {
		
		basketService.deleteBasket(basket_num);
		
		return "redirect:/cart";
	}
	
	//장바구니전체삭제하기
	@RequestMapping("/cart/deleteAll")
	public String deleteAllBasket(
			HttpServletRequest request) {
		
		String sessionId = (String) request.getSession().getAttribute("sessionId");
		
		basketService.deleteAllBasket(sessionId);
		
		return "redirect:/cart";
	}
	//일괄구매하기
	@RequestMapping(value="/purchase/batchOrder", method=RequestMethod.POST)
	public String basketBatchOrder(BasketModel basketModel, Model model) {
		
		System.out.println("총결제금액 : " + basketModel.getTotalSum());
		
		List<BasketProductModel> resultList = new ArrayList<BasketProductModel>();
		
		
		for(int i = 0 ; i < basketModel.getP_list().size() ; i++) {
			if(basketModel.getP_list().get(i).getProduct_subject() == null) {
				//System.out.println(i+"번째는 비어있어요");
				continue;
			}
			BasketProductModel tmp = new BasketProductModel();
			tmp.setOrderSum(basketModel.getP_list().get(i).getOrderSum());
			tmp.setProduct_currentPrice(basketModel.getP_list().get(i).getProduct_currentPrice());
			tmp.setProduct_img(basketModel.getP_list().get(i).getProduct_img());
			tmp.setProduct_num(basketModel.getP_list().get(i).getProduct_num());
			tmp.setProduct_price(basketModel.getP_list().get(i).getProduct_price());
			tmp.setProduct_subject(basketModel.getP_list().get(i).getProduct_subject());
			tmp.setSeller_id(basketModel.getP_list().get(i).getSeller_id());
			
			resultList.add(tmp);
		}
		
		
		/*if(basketModel.getP_list() != null) {
			for(int i = 0 ; i < basketModel.getP_list().size() ; i++) {
				System.out.println(i +"번째 프로덕트넘"+ basketModel.getP_list().get(i).getProduct_num());
				System.out.println(i +"번째 프로덕트제목"+ basketModel.getP_list().get(i).getProduct_subject());
				System.out.println(i +"번째 프로덕트이미지"+ basketModel.getP_list().get(i).getProduct_img());
				System.out.println(i +"번째 프로덕트가격"+ basketModel.getP_list().get(i).getProduct_price());
				System.out.println(i +"번째 프로덕트현재가격"+ basketModel.getP_list().get(i).getProduct_currentPrice());
				System.out.println(i +"번째 프로덕트주문수량"+ basketModel.getP_list().get(i).getOrderSum());
				System.out.println(i +"번째 프로덕트판매자"+ basketModel.getP_list().get(i).getSeller_id());
			}
		}*/
		
		model.addAttribute("totalSum", basketModel.getTotalSum());
		model.addAttribute("resultList", resultList);
		
		return "orderReady";
	}
}

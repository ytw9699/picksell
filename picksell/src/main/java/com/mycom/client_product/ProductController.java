package com.mycom.client_product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	/*픽셀플러스 인기상품 전체보기
	새로등록된 플러스상품 전체보기
	새로등록된 일반상품 전체보기

	상품등록폼(메인에서)

	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	픽셀플러스(헤더에서) -> 카테고리 분류있음
	일반상품(헤더에서) -> 카테고리 분류있음
	새로등록된상품(헤더에서) -> 카테고리 분류없음
	
	카테고리별 
	DD
	*/
	//등록폼: 판매방식확인 -> 등록폼 -> 확인 
	
	@RequestMapping("/sell/howto")
	public String howtosell() {
		return "howtosell";
	}
	
	/*@RequestMapping("/sell")
	public String sellForm() {
		return "";
	}
	
	@RequestMapping("/sellPlus")
	public String sellPlusForm() {
		return "";
	}
	
	@RequestMapping(value="/sellProc", method=RequestMethod.POST)
	public String sellProc() {
		return "";
	}
	*/
	

	
}

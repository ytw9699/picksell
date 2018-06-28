package com.mycom.client_product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.mycom.config.CommandMap;

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
	
	@RequestMapping("/sell/{level}")
	public String sellForm(
			@PathVariable("level") String howtosell,
			Model model) {
		
		//System.out.println(howtosell);
		model.addAttribute("howtosell",howtosell);
		
		return "sellForm";
	}
	
	@RequestMapping(value="/sell/sellProc", method=RequestMethod.POST)
	public String sellFormProc(
			CommandMap map,
			@RequestParam("first_img") MultipartFile file) {
		
		System.out.println(map.getMap());
		System.out.println(file.getOriginalFilename());
		
		return "resultJsp";
	}
	
	@RequestMapping("/sellPlus")
	public String sellPlusForm(
			Model model) {
		
		model.addAttribute("howtosell", 2);
		
		return "sellPlusForm";
	}
	
	
	

	
}

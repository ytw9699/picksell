package com.mycom.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mycom.client_product.ProductPaging;
import com.mycom.client_product.ProductService;

@Controller
public class mainController {
	    //페이징
		private int totalCount; 		 
		private int blockCount = 10;	 
		private int blockPage = 5; 	 
		private String pagingHtml;  
		private ProductPaging page;
		private mainSearchListPaging page2;
		
	Map<String, Object> resultMap = new HashMap<String, Object>();//공통사용
	
	@Resource(name="mainService")
	private mainService mainService;
	
	@Resource(name="productService")
	private ProductService productService;
	
	@RequestMapping("/main")
	public String main(Model model) {	
		
		List<Map<String, Object>> nomalProductList = mainService.nomalProduct();
		List<Map<String, Object>> plusProductList = mainService.pulsProduct();
		List<Map<String, Object>> hotProductList = mainService.hotProduct();
		List<Map<String, Object>> hotCategoryList = mainService.hotCategory();
		
		model.addAttribute("nomalProductList", nomalProductList);
		model.addAttribute("plusProductList", plusProductList);
		model.addAttribute("hotProductList", hotProductList);
		model.addAttribute("hotCategoryList", hotCategoryList);
		
		return "main";
	}
	@RequestMapping("/hotPlusProduct/main")
	public String hotPlusProductMain(Model model) {	
		
		List<Map<String, Object>> hotProductList = mainService.hotProduct();
		
		model.addAttribute("hotProductList", hotProductList);
		return "hotPlusProduct";
		
	}
		@RequestMapping("/hotPlusProduct")
		public String hotPlusProduct(
				@RequestParam(value="ca", required=false, defaultValue="0") int category_num,
				@RequestParam(value="od", required=false, defaultValue="0") int orderMethod,
				@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber,
				Model model) {
			
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			
			parameterMap.put("category", category_num);
			parameterMap.put("orderMethod", orderMethod);
			
			List<Map<String, Object>> resultList = mainService.hotPlusProduct(parameterMap);
			List<Map<String, Object>> categoryList = productService.getCategoryList();
			
		    totalCount = resultList.size();
		    
			page = new ProductPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/hotPlusProduct", category_num, orderMethod);
			
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			resultList = resultList.subList(page.getStartCount(), lastCount);
			
			model.addAttribute("pagingHtml", pagingHtml);
			model.addAttribute("currentCategory", category_num);
			model.addAttribute("resultProductList", resultList);
			model.addAttribute("currentPage", currentPageNumber);
			model.addAttribute("categoryList", categoryList);
			//인기상품 정렬조회 css 를 위해서 추가합니다 by 현우
			model.addAttribute("orderMethod", orderMethod);
			model.addAttribute("forwardingListKind", "1");
			
			return "hotPlusProduct";
		}
	
	@RequestMapping("/mainSearchList")
	public String mainSearchList(
			@RequestParam(value="HowToSell", required=false, defaultValue="3") String HowToSell,
			@RequestParam(value="order", required=false, defaultValue="0") String order,
			@RequestParam(value="searchKeyword", required=false, defaultValue="") String searchKeyword,
			@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber,
			Model model) {
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("HowToSell", HowToSell);
		parameterMap.put("order", order);
		parameterMap.put("searchKeyword", searchKeyword);
		
		List<Map<String, Object>> mainSearchList = mainService.mainSearchList(parameterMap);
		
		totalCount = mainSearchList.size();//페이징
		
		page2 = new mainSearchListPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/mainSearchList", HowToSell,
				order,searchKeyword);
		
		pagingHtml = page2.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page2.getEndCount() < totalCount)
			
			lastCount = page2.getEndCount() + 1;
		
		mainSearchList = mainSearchList.subList(page2.getStartCount(), lastCount);
		
		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("currentPage", currentPageNumber);
		model.addAttribute("HowToSell", HowToSell);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("mainSearchList", mainSearchList);
			
		return "mainSearchList";
	}
}

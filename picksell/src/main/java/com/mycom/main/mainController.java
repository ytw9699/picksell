package com.mycom.main;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.client_product.ProductPaging;
import com.mycom.config.CommandMap;
import com.mycom.utils.FileUpload;

@Controller
public class mainController {
	//페이징
		//private int currentPage = 1; //안쓰는변수 어노테이션으로 해결함
		private int totalCount; 		 
		private int blockCount = 10;	 
		private int blockPage = 5; 	 
		private String pagingHtml;  
		private ProductPaging page;
		
	Map<String, Object> resultMap = new HashMap<String, Object>();//공통사용
	
	
	@Resource(name="mainService")
	private mainService mainService;
	
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
			
			//정렬은 0 > 최신순, 1 > 낮은가격순, 2 > 높은가격순
			
			//카테고리0 일때 전체상품카테고리 / 카테고리0 아닐때 해당 카테고리리스트
			//카테고리가0이 아니면 해당카테고리에 대한 모든 상품
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("category", category_num);
			parameterMap.put("orderMethod", orderMethod);
			List<Map<String, Object>> resultList = mainService.hotPlusProduct(parameterMap);
			
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
			
			return "hotPlusProduct";
		}
	
	@RequestMapping(value="/mainSearchList", method=RequestMethod.GET)
	public String mainSearchList(Model model, HttpServletRequest request) {	
		
		String searchKeyword = request.getParameter("searchKeyword");
		
		List<Map<String, Object>> mainSearchList = mainService.mainSearchList(searchKeyword);
		
			model.addAttribute("mainSearchList", mainSearchList);//아이디가 없다면
			
		return "mainSearchList";
	}
}
	/*@RequestMapping("/game/AjaxHome")
	public ModelAndView AjaxHome(HttpServletRequest request) throws Exception {
	    ModelAndView mv = new ModelAndView("/main/test");
	    // model.addAttribute("product", new Product());
	    return mv;
	}
	 
	@RequestMapping("/game/ajax")
	@ResponseBody
	public Map<String,Object> ajax(HttpServletRequest request) throws Exception {
	    String firstArg = request.getParameter("test1");
	    String secondArg = request.getParameter("test2");
	     
	    System.out.println(firstArg + " / "+ secondArg);
	    Map<String,Object>  map = new HashMap<String,Object>();
	    map.put("test1", firstArg);
	    map.put("test2", secondArg);
	    return map;
	}*/

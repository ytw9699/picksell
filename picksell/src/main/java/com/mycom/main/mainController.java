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

import com.mycom.config.CommandMap;
import com.mycom.utils.FileUpload;

@Controller
public class mainController {
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
	@RequestMapping("/hotPlusProduct")
	public String hotPlusProduct(Model model) {	
		
		List<Map<String, Object>> hotProductList = mainService.hotProduct();
		
		model.addAttribute("hotProductList", hotProductList);
		return "hotPlusProduct";
		
	}
	
	@RequestMapping("/hotPlusProduct/latest")
	public String hotPlusProductlatest(Model model) {	
		
		List<Map<String, Object>> hotProductListLatest = mainService.hotProductListLatest();
		
		model.addAttribute("hotProductList", hotProductListLatest);
		return "hotPlusProduct";
		
	}
	
	@RequestMapping("/hotPlusProduct/HighPrice")
	public String hotProductHP(Model model) {//높은가격순 HighPrice = HP	
		
		List<Map<String, Object>> hotProductHP = mainService.hotProductHP();
		
		model.addAttribute("hotProductList", hotProductHP);
		return "hotPlusProduct";
		
	}
	@RequestMapping("/hotPlusProduct/LowPrice")
	public String hotProductLP(Model model) {//높은가격순 HighPrice = HP	
		
		List<Map<String, Object>> hotProductLP = mainService.hotProductLP();
		
		model.addAttribute("hotProductList", hotProductLP);
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

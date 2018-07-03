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
		
		model.addAttribute("nomalProductList",nomalProductList);
		
		//System.out.println(nomalProductList.size());
		
		return "main";
		
	}
	
	@RequestMapping(value="/mainSearch", method=RequestMethod.GET)
	public String mainSearch(Model model) {	
		return "mainSearch";//이렇게 해줘야 타일즈랑 연결됨
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
}
package com.mycom.admin_singo;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_products.AdminSellModel;
import com.mycom.admin_singo.AdminSingoModel;
import com.mycom.admin_singo.AdminSingoService;

import com.mycom.common.Paging;

@Controller
@RequestMapping("/admin_singo")
public class AdminSingoController {

	@Resource
	private AdminSingoService adminSingoService;
	
	ModelAndView mav = new ModelAndView();
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	AdminSingoModel adminSingoModel = new AdminSingoModel();
	
	AdminSingoController(){
		
	}
	
	@RequestMapping("/list")
	public ModelAndView adminSingoList(HttpServletRequest request) {
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<AdminSingoModel> singoList = adminSingoService.singoList();
		List<Map<String,Object>> singoList2 = adminSingoService.singoList2();
		
		isSearch = request.getParameter("isSearch");
		if(isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum==0) //피신고자 
				singoList = adminSingoService.singoSearch0(isSearch);
			else if(searchNum == 1) // 신고자  
				singoList = adminSingoService.singoSearch1(isSearch);
			else if(searchNum == 2) // 신고내용 
				singoList = adminSingoService.singoSearch2(isSearch);
			
			totalCount = singoList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "list", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString(); 
			int lastCount = totalCount;
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			singoList =singoList.subList(page.getStartCount(), lastCount);
			
			
			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum",searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("singoList", singoList);
			mav.addObject("singoList2", singoList2);
			mav.setViewName("admin_singo/list");
			return mav;
			
		}
		
		totalCount = singoList.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list");
		pagingHtml = page.getPagingHtml().toString(); 
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		singoList = singoList.subList(page.getStartCount(), lastCount);
		
		
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		
		mav.addObject("singoList",singoList);
		mav.addObject("singoList2", singoList2);
		
		mav.setViewName("admin_singo/list");
		
		return mav;
		
	}

	@RequestMapping("/detail")
	public ModelAndView adminSingoDetail() {
		
		return mav;
		
	}
	
	@RequestMapping("/doBlind")
	public String adminSingoDoBlind(HttpServletRequest request) {
		String product_num = request.getParameter("product_num");
		adminSingoService.doBlind(Integer.parseInt(product_num));
		
		return "redirect:/admin_singo/list";
	}
	
}

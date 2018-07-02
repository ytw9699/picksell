package com.mycom.admin_products;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.mycom.admin_products.AdminSellModel;
import com.mycom.admin_products.AdminSellService;

import com.mycom.common.Paging;

@Controller
@RequestMapping("/admin_products")
public class AdminSellController {

	@Resource
	private AdminSellService adminSellService;
	
	ModelAndView mav = new ModelAndView();
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	
	AdminSellModel adminSellModel = new AdminSellModel();
	
	AdminSellController(){
		
	}
	
	@RequestMapping("/list")
	public ModelAndView adminProductList(HttpServletRequest request) {
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		
		List<AdminSellModel> productsList = adminSellService.productsList();
		
		
		isSearch = request.getParameter("isSearch");
		if(isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum==0) //구매자 
				productsList = adminSellService.productsSearch0(isSearch);
			else if(searchNum == 1) // 상태 
				productsList = adminSellService.productsSearch1(isSearch);
			else if(searchNum == 2) // 택배사 
				productsList = adminSellService.productsSearch2(isSearch);
			
			totalCount = productsList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "list", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString(); 
			int lastCount = totalCount;
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			productsList =productsList.subList(page.getStartCount(), lastCount);
			
			
			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum",searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("productsList", productsList);
			mav.setViewName("admin_products/list");
			return mav;
			
		}
		
		totalCount = productsList.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list");
		pagingHtml = page.getPagingHtml().toString(); 
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		productsList = productsList.subList(page.getStartCount(), lastCount);
		
		
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		
		mav.addObject("productsList",productsList);
		mav.setViewName("admin_products/list");
		
		
		return mav;
		
	}
	
	@RequestMapping("/search")
	public ModelAndView adminProductSearch() {
		
		return mav;
		
	}

	public AdminSellService getAdminSellService() {
		return adminSellService;
	}

	public void setAdminSellService(AdminSellService adminSellService) {
		this.adminSellService = adminSellService;
	}

	public ModelAndView getMav() {
		return mav;
	}

	public void setMav(ModelAndView mav) {
		this.mav = mav;
	}

	public int getSearchNum() {
		return searchNum;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}

	public String getIsSearch() {
		return isSearch;
	}

	public void setIsSearch(String isSearch) {
		this.isSearch = isSearch;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public Paging getPage() {
		return page;
	}

	public void setPage(Paging page) {
		this.page = page;
	}



	public AdminSellModel getAdminSellModel() {
		return adminSellModel;
	}

	public void setAdminSellModel(AdminSellModel adminSellModel) {
		this.adminSellModel = adminSellModel;
	}
	
}

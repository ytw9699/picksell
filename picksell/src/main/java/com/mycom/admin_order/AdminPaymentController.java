package com.mycom.admin_order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_order.AdminPaymentModel;
import com.mycom.admin_order.AdminPaymentListModel;
import com.mycom.admin_order.AdminPaymentService;

import com.mycom.common.pagingAction;

@Controller
@RequestMapping("/admin_order")
public class AdminPaymentController {
	
	@Resource
	private AdminPaymentService adminPaymentService;
	
	ModelAndView mav = new ModelAndView();
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private int num = 0;
	
	AdminPaymentModel adminPaymentModel = new AdminPaymentModel();
	AdminPaymentListModel adminPaymentListModel = new AdminPaymentListModel();
	
//	private List<AdminPaymentModel> orderList = new ArrayList<AdminPaymentModel>();
	private List<AdminPaymentListModel> orderList2 = new ArrayList<AdminPaymentListModel>();
	
	AdminPaymentController(){
		
	}
	@RequestMapping("/list")
	public ModelAndView adminOrderList(HttpServletRequest request) {
		
		//String order_num = request.getParameter("order_num");
		
		List<AdminPaymentModel> orderList = adminPaymentService.orderList();
		
		isSearch = request.getParameter("isSearch");
		if(isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum==0) //구매자 
				orderList = adminPaymentService.orderSearch0(isSearch);
			else if(searchNum == 1) // 상태 
				orderList = adminPaymentService.orderSearch1(isSearch);
			else if(searchNum == 2) // 택배사 
				orderList = adminPaymentService.orderSearch2(isSearch);
			
			totalCount = orderList.size();
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
			pagingHtml = page.getPagingHtml().toString(); 
			int lastCount = totalCount;
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			orderList = orderList.subList(page.getStartCount(), lastCount);
			
			
			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum",searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("orderList",orderList);
			mav.setViewName("admin_order/orderList");
			return mav;
			
		}
		
		totalCount = orderList.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString(); 
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		orderList = orderList.subList(page.getStartCount(), lastCount);
		
		
		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum",searchNum);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("orderList",orderList);
		mav.setViewName("admin_order/orderList");
		
		return mav;
		
	}
	
	@RequestMapping("/adminMain")
	public ModelAndView adminMain() {
		
		mav.setViewName("admin_order/adminMain");
		return mav;
		
	}
	
	@RequestMapping("/search")
	public ModelAndView orderSearch() {
		
		return mav;
		
	}
	
	@RequestMapping("/confirmProc")
	public ModelAndView orderConfirm() {
		
		
		return mav;
		
	}
	
	@RequestMapping("/deliveryProc")
	public ModelAndView adminDeliveryConfirm() {
		
		
		return mav;
		
	}
	
	@RequestMapping("/orderTerminate")
	public ModelAndView adminOrderTerminate() {
		
		
		return mav;
		
	}
	public AdminPaymentService getAdminPaymentService() {
		return adminPaymentService;
	}
	public void setAdminPaymentService(AdminPaymentService adminPaymentService) {
		this.adminPaymentService = adminPaymentService;
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
	public pagingAction getPage() {
		return page;
	}
	public void setPage(pagingAction page) {
		this.page = page;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public AdminPaymentModel getAdminPaymentModel() {
		return adminPaymentModel;
	}
	public void setAdminPaymentModel(AdminPaymentModel adminPaymentModel) {
		this.adminPaymentModel = adminPaymentModel;
	}
	public AdminPaymentListModel getAdminPaymentListModel() {
		return adminPaymentListModel;
	}
	public void setAdminPaymentListModel(AdminPaymentListModel adminPaymentListModel) {
		this.adminPaymentListModel = adminPaymentListModel;
	}
	public List<AdminPaymentListModel> getOrderList2() {
		return orderList2;
	}
	public void setOrderList2(List<AdminPaymentListModel> orderList2) {
		this.orderList2 = orderList2;
	}
	
}

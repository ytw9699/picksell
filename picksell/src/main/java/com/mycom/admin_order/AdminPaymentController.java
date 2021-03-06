package com.mycom.admin_order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
///this is a test.
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_order.AdminPaymentModel;
import com.mycom.admin_order.AdminPaymentListModel;
import com.mycom.admin_order.AdminPaymentService;
import com.mycom.admin_products.AdminSellService;
import com.mycom.common.Paging;

@Controller
@RequestMapping("/admin_order")
public class AdminPaymentController {
	
	@Resource
	private AdminPaymentService adminPaymentService;
	
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
	
	
	AdminPaymentModel adminPaymentModel = new AdminPaymentModel();
	AdminPaymentListModel adminPaymentListModel = new AdminPaymentListModel();
	
//	private List<AdminPaymentModel> orderList = new ArrayList<AdminPaymentModel>();
	private List<AdminPaymentListModel> orderList2 = new ArrayList<AdminPaymentListModel>();
	
	AdminPaymentController(){
		
	}
	@RequestMapping("/list")
	public ModelAndView adminOrderList(HttpServletRequest request) {
		
		//String order_num = request.getParameter("order_num");
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
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
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "orderList", searchNum, isSearch);
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
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list");
		pagingHtml = page.getPagingHtml().toString(); 
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		orderList = orderList.subList(page.getStartCount(), lastCount);
		
		//orderList 로부터 order_num 얻기 
		
		
//		System.out.println(totalCount);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		
		mav.addObject("orderList",orderList);
		mav.setViewName("admin_order/orderList");
		
		return mav;
		
	}
	
	@RequestMapping("/orderDetail/{order_num}")
	public ModelAndView orderDetail(@PathVariable("order_num") int order_num) {
		
//		Map<String, Object> mp = new HashMap<String, Object>();
		
		List<Map<String, Object>> mp = adminPaymentService.orderDetail2(order_num);
//		System.out.println(mp);
		mav.addObject("orderDetail",mp);
		mav.setViewName("admin_order/orderDetail");
		return mav;
		
	}
	
//	@RequestMapping("/orderDetail/{order_num}")
//	public ModelAndView orderDetail(@PathVariable("order_num") int order_num) {
//		
//		Map<String, Object> mp = new HashMap<String, Object>();
//		mp = adminPaymentService.orderDetail(order_num);
//		System.out.println(mp.keySet());
//		mav.addObject("orderDetail",mp);
//		mav.setViewName("admin_order/orderDetail");
//		return mav;
//		
//	}
	
	@RequestMapping("/search")
	public ModelAndView orderSearch() {
		
		return mav;
		
	}
	
	@RequestMapping("/confirmProc") //입금완료 및 배송대기 
	public ModelAndView orderConfirm(HttpServletRequest request) {
		
		adminPaymentModel = adminPaymentService.orderGetOne(request.getParameter("order_num"));
		List<Map<String, Object>> ming = adminPaymentService.orderDetail2(Integer.parseInt(request.getParameter("order_num")));
		
		//입금완료의 순간마다 재고 줄이기. 
		for(int i=0 ; i<ming.size() ; i++) {
			adminSellService.updateStock(ming.get(i));
		}
		
		
		
		
		adminPaymentService.updateStatus1(adminPaymentModel);
		mav.setViewName("redirect:/admin_order/list");
		
		return mav;
		
	}
	
	@RequestMapping(value="/deliveryProc" , method=RequestMethod.POST ) // 배송 및 인수확인대기 
	public ModelAndView adminDeliveryConfirm(HttpServletRequest request) {
		
		adminPaymentModel = adminPaymentService.orderGetOne(request.getParameter("order_num"));
		adminPaymentModel.setDelivery_company(request.getParameter("delivery_company"));
		adminPaymentModel.setInvoice_num(request.getParameter("invoice_num"));
		System.out.println(adminPaymentModel.getDelivery_company());
		adminPaymentService.updateStatus2(adminPaymentModel);
		mav.setViewName("redirect:/admin_order/list");
		System.out.println(request.getParameter("order_num"));
		return mav;
		
	}
	
	@RequestMapping("/orderTerminate") //인수확인 및 거래완료
	public ModelAndView adminOrderTerminate(HttpServletRequest request) {
		
		adminPaymentModel = adminPaymentService.orderGetOne(request.getParameter("order_num"));
		adminPaymentService.updateStatus3(adminPaymentModel);
		mav.setViewName("redirect:/admin_order/list");
		
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
	public Paging getPage() {
		return page;
	}
	public void setPage(Paging page) {
		this.page = page;
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

package com.mycom.admin_order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycom.admin_order.AdminPaymentModel;
import com.mycom.admin_order.AdminPaymentListModel;

public interface AdminPaymentDAO {
	
	// 오더 리스트 (ps_order)
	//public List<AdminPaymentModel> orderList();
	// 오더 상세보기 
	public AdminPaymentModel orderView(int order_num);
	// 특정 오더 검색 
	public List<AdminPaymentModel> orderSearch0(String search);
	public List<AdminPaymentModel> orderSearch1(String search);
	public List<AdminPaymentModel> orderSearch2(String search);
	// 입금완료, 배송확인, 인수확인 등 STATUS변
	public Object updateStatus1(AdminPaymentModel adminPaymentModel);
	public Object updateStatus2(AdminPaymentModel adminPaymentModel);
	public Object updateStatus3(AdminPaymentModel adminPaymentModel);
	// to pick up some colums from ps_orderlist
	public AdminPaymentModel orderGetOne(String order_num);
	
	
	
	//오더 리스트(ps_orderlist)
	public List<AdminPaymentListModel> orderList2();
	
	public Map<String,Object> orderDetail = new HashMap<String,Object>();
	public Map<String,Object> orderDetail2 = new HashMap<String,Object>();
	
}

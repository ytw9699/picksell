package com.mycom.admin_order;

import java.util.List;
import com.mycom.admin_order.AdminPaymentModel;
import com.mycom.admin_order.AdminPaymentListModel;

public interface AdminPaymentDAO {
	
	// 오더 리스트 (ps_order)
	public List<AdminPaymentModel> orderList();
	// 오더 상세보기 
	public AdminPaymentModel orderView(int order_num);
	// 특정 오더 검색 
	public List<AdminPaymentModel> orderSearchList(String search);
	// 입금완료, 배송확인, 인수확인 등 STATUS변
	public Object updateStatus(AdminPaymentModel adminPaymentModel);
	
	//오더 리스트(ps_orderlist)
	public List<AdminPaymentListModel> orderList2();
	// to pick up some colums from ps_orderlist
	public AdminPaymentListModel getOne(int order_num);
	
}

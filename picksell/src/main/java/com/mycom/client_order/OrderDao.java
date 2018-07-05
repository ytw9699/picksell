package com.mycom.client_order;

import java.util.List;

public interface OrderDao {
	
	//주문하기(일괄주문)
	public void insertBatchOrder(OrderModel orderModel, List<OrderListModel> orderList);

}

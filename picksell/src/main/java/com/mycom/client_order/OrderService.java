package com.mycom.client_order;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class OrderService implements OrderDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	//주문하기(일괄주문)
	public void insertBatchOrder(OrderModel orderModel, List<OrderListModel> orderList) {
		sqlMapper.insert("client_order.insertOrderBatch", orderModel);
		System.out.println("인서트후 "+orderModel.getOrder_num());
		
		for(int i = 0 ; i < orderList.size() ; i++) {
			orderList.get(i).setOrder_num(orderModel.getOrder_num());
			sqlMapper.insert("client_order.insertOrderList", orderList.get(i));
		}
		
	}
	
}

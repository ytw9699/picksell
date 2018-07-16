package com.mycom.client_order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class OrderService implements OrderDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	//주문하기(일괄주문 단일주문 통일)
	public void insertBatchOrder(OrderModel orderModel, List<OrderListModel> orderList) {
		sqlMapper.insert("client_order.insertOrderBatch", orderModel);
		System.out.println("인서트후 "+orderModel.getOrder_num());
		
		for(int i = 0 ; i < orderList.size() ; i++) {
			orderList.get(i).setOrder_num(orderModel.getOrder_num());
			sqlMapper.insert("client_order.insertOrderList", orderList.get(i));
		}
		
		//System.out.println("하우투셀? "+orderList.get(0).getProduct_howtosell());
		//여기서 거래중 로직 시작
		int currentHowToSell = orderList.get(0).getProduct_howtosell();
		if(currentHowToSell == 0 || currentHowToSell == 1)
			sqlMapper.update("client_order.updateProductStatus", orderList.get(0).getProduct_num());
		
		
	}
	public void deletePURCHASE_LIST(Map<String, Object> parameterMap) {//일반구매 완료시 오더리스트 한줄 삭제 by 태원
		sqlMapper.update("client_order.deletePURCHASE_LIST", parameterMap);
	}
	
	public void alarmInsert(Map<String, Object> parameterMap) {//by태원 알람입력추가
		sqlMapper.insert("mypage.alarmInsert",parameterMap);
	}
	
}

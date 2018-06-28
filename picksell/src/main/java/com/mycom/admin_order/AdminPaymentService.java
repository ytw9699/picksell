package com.mycom.admin_order;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class AdminPaymentService implements AdminPaymentDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 오더 리스트 
	@Override
	public List<AdminPaymentModel> orderList(){
		return null;
	}
	// 오더 상세보기 
	@Override
	public AdminPaymentModel orderView(int order_num) {
		return null;
	}
	// 특정 오더 검색 
	@Override
	public List<AdminPaymentModel> orderSearchList(String search){
		return null;
	}
	// 입금완료, 배송확인, 인수확인 등 STATUS변수 업데이트 
	@Override
	public Object updateStatus(AdminPaymentModel adminPaymentModel) {
		return null;
	}
	
}

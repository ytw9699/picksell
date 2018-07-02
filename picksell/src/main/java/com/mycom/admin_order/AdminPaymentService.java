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
		return sqlSessionTemplate.selectList("adminOrder.orderList-all");
	}
	// 오더 상세보기 
	@Override
	public AdminPaymentModel orderView(int order_num) {
		return null;
	}
	// 특정 오더 검색 
	@Override
	public List<AdminPaymentModel> orderSearch0(String search){
		return sqlSessionTemplate.selectList("adminOrder.orderSearch0", "%"+search+"%");
	}
	public List<AdminPaymentModel> orderSearch1(String search){
		return sqlSessionTemplate.selectList("adminOrder.orderSearch1", "%"+search+"%");
	}
	public List<AdminPaymentModel> orderSearch2(String search){
		return sqlSessionTemplate.selectList("adminOrder.orderSearch2", "%"+search+"%");
	}
	// 입금완료, 배송확인, 인수확인 등 STATUS변수 업데이트 
	@Override
	public Object updateStatus(AdminPaymentModel adminPaymentModel) {
		return null;
	}
	
	//오더 리스트(ps_orderlist)
	@Override
	public List<AdminPaymentListModel> orderList2(){
		return null;
	}
	// to pick up some colums from ps_orderlist
	@Override
	public AdminPaymentListModel getOne(int order_num) {
		return null;
	}
	
}

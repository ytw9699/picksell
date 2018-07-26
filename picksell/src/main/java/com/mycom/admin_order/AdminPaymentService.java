package com.mycom.admin_order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class AdminPaymentService implements AdminPaymentDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 오더 리스트 
	/*@Override
	public List<AdminPaymentModel> orderList(){
		return sqlSessionTemplate.selectList("adminOrder.orderList-all");
	}*/
	
	public List<Map<String, Object>> orderList() {
		return sqlSessionTemplate.selectList("adminOrder.orderList-all");
	}
	
	// 오더 상세보기 
	public Map<String,Object> orderDetail(int order_num){
		return sqlSessionTemplate.selectOne("adminOrder.orderDetail",order_num);
	}
	
	// 오더 상세보기 
		public List<Map<String,Object>> orderDetail2(int order_num){
			return sqlSessionTemplate.selectList("adminOrder.orderDetail2",order_num);
		}
		
		public List<Map<String,Object>> ming(int order_num){
			return sqlSessionTemplate.selectList("adminOrder.orderDetail2",order_num);
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
	@Override
	public List<AdminPaymentModel> orderSearch1(String search){
		return sqlSessionTemplate.selectList("adminOrder.orderSearch1", "%"+search+"%");
	}
	@Override
	public List<AdminPaymentModel> orderSearch2(String search){
		return sqlSessionTemplate.selectList("adminOrder.orderSearch2", "%"+search+"%");
	}
	// 입금완료, 배송확인, 인수확인 등 STATUS변수 업데이트 
	@Override
	public Object updateStatus1(AdminPaymentModel adminPaymentModel) {
		return sqlSessionTemplate.update("adminOrder.updateStatus1", adminPaymentModel);
	}
	@Override
	public Object updateStatus2(AdminPaymentModel adminPaymentModel) {
		return sqlSessionTemplate.update("adminOrder.updateStatus2", adminPaymentModel);
	}
	@Override
	public Object updateStatus3(AdminPaymentModel adminPaymentModel) {
		return sqlSessionTemplate.update("adminOrder.updateStatus3", adminPaymentModel);
	}
	
	
	//오더 리스트(ps_orderlist)
	@Override
	public List<AdminPaymentListModel> orderList2(){
		return null;
	}
	
	
	// to pick up some colums from ps_orderlist
	public AdminPaymentModel orderGetOne(String order_num) {
		return sqlSessionTemplate.selectOne("adminOrder.orderGetOne", order_num);
	}
	public List<Map<String, Object>> orderList3(Map<String, Object> parameterMap) {//by태원
		return sqlSessionTemplate.selectList("adminOrder.orderList3", parameterMap);
	}
	
	public List<Map<String, Object>> orderSubList2(String string) {
		return sqlSessionTemplate.selectList("mypage.orderSubList2", string);
	}
	
}

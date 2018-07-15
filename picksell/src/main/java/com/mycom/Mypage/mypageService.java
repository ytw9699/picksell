package com.mycom.Mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class mypageService implements mypageDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;

	public Map<String, Object> userInfo(String sessionId) {
		return sqlMapper.selectOne("mypage.userInfo", sessionId);
	}

	public void updateBusiness(Map<String, Object> map) {
		sqlMapper.update("mypage.updateBusiness", map);
		}
	public void updatePersonal(Map<String, Object> map) {
		sqlMapper.update("mypage.updatePersonal", map);
		}
	public List<Map<String, Object>> sellList(Map<String, Object> map){
		return sqlMapper.selectList("mypage.sellList", map);
	}
	public List<Map<String, Object>> purchaseList0(String sessionId) {
		return sqlMapper.selectList("mypage.purchaseList", sessionId);
	}

	public List<Map<String, Object>> orderList(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.orderList", parameterMap);
	}
	
	public List<Map<String, Object>> saleList(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.saleList", parameterMap);
	}
	public List<Map<String, Object>> saleSubList(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.saleSubList", parameterMap);
	}
	public List<Map<String, Object>> orderSubList(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.orderSubList", parameterMap);
	}
	public Map<String, Object> orderDetail(int ORDER_NUM) {
		return sqlMapper.selectOne("mypage.orderDetail", ORDER_NUM);
	}

	public List<Map<String, Object>> orderSubDetail(int ORDER_NUM) {
		return sqlMapper.selectList("mypage.orderSubDetail", ORDER_NUM);
	}

	public String userCheck(String string) {
		return sqlMapper.selectOne("mypage.userCheck", string);
	}
	public Map<String, Object> saleDetail(int PRODUCT_NUM) {
		return sqlMapper.selectOne("mypage.saleDetail", PRODUCT_NUM);
	}
	public List<Map<String, Object>> saleSubDetail(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.saleSubDetail", parameterMap);
	}

	public void pulsStock(String PRODUCT_NUM) {
			sqlMapper.update("mypage.pulsStock", PRODUCT_NUM);
	}

	public void minusStock(String PRODUCT_NUM) {
		sqlMapper.update("mypage.minusStock", PRODUCT_NUM);
	}

	public void alarmInsert(Map<String, Object> parameterMap) {
		sqlMapper.insert("mypage.alarmInsert",parameterMap);
	}
	
	public List<Map<String, Object>> alarmSelect(String sessionId) {
		return sqlMapper.selectList("mypage.alarmSelect", sessionId);
	}

	public int alarmDelete(Map<String, Object> parameterMap) {
		return sqlMapper.delete("mypage.alarmDelete",parameterMap);
	}

	public int deletePurchaseList(Map<String, Object> parameterMap) {

		return sqlMapper.delete("mypage.deletePurchaseList",parameterMap);
	}

	public void canclePs_order(Map<String, Object> parameterMap) {
		sqlMapper.update("mypage.canclePs_order", parameterMap);
	}

	public void cancleDate(Map<String, Object> parameterMap) {
		sqlMapper.update("mypage.cancleDate", parameterMap);
	}

	public void updateDeal_status(Map<String, Object> parameterMap) {
		sqlMapper.update("mypage.updateDeal_status", parameterMap);
	}

	public void alarmRead(int ALARM_NUM) {//알람읽기
		sqlMapper.update("client_product.alarmRead", ALARM_NUM);
	}

	public void completing(Map<String, Object> parameterMap) {
		sqlMapper.update("mypage.completing", parameterMap);
	}

	public void step4_date(Map<String, Object> parameterMap) {
		sqlMapper.update("mypage.step4_date", parameterMap);
	}
}

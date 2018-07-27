package com.mycom.Mypage;

import java.util.HashMap;
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
	public List<Map<String, Object>> purchaseList(String sessionId) {
		return sqlMapper.selectList("mypage.purchaseList", sessionId);
	}
	public List<Map<String, Object>> secondSellList(String sessionId) {
		return sqlMapper.selectList("mypage.secondSellList", sessionId);
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
	public List<Map<String, Object>> orderSubList2(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.orderSubList2", parameterMap);
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
	
	public List<Map<String, Object>> alarmSelect(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.alarmSelect", parameterMap);
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

	public List<Map<String, Object>> recentlist(String sessionId) {
		return sqlMapper.selectList("mypage.recentlist", sessionId);
	}

	public int alarmCount(String sessionId) {
		return sqlMapper.selectOne("mypage.alarmCount", sessionId);
	}
	
	//헤더의 알람목록 가져오기(읽지않은알람)
	public List<Map<String, Object>> getMyAlarmHeaderList(String currentID){
		return sqlMapper.selectList("mypage.getMyAlarmList", currentID);
	}

	public void deliveryInsert(Map<String, Object> parameterMap) {
		sqlMapper.update("mypage.deliveryInsert",parameterMap);
	}

	public void profile(Map<String, Object> map) {
		sqlMapper.update("mypage.profile",map);
		}

	public void defaultProfile(String sessionId) {
		sqlMapper.update("mypage.defaultProfile",sessionId);
	}
	
	public Map<String, Object> orderCount(String sessionId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("five",sqlMapper.selectOne("mypage.orderCount5", sessionId));
		map.put("zero",sqlMapper.selectOne("mypage.orderCount0", sessionId));
		map.put("one",sqlMapper.selectOne("mypage.orderCount1", sessionId));
		map.put("two",sqlMapper.selectOne("mypage.orderCount2", sessionId));
		map.put("three",sqlMapper.selectOne("mypage.orderCount3", sessionId));
		map.put("fourfour",sqlMapper.selectOne("mypage.orderCount44", sessionId));
		 return map;
	}
	public Map<String, Object> alarmCountKind(String sessionId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("one",sqlMapper.selectOne("mypage.alarmCountKind1", sessionId));
		map.put("two",sqlMapper.selectOne("mypage.alarmCountKind2", sessionId));
		map.put("three",sqlMapper.selectOne("mypage.alarmCountKind3", sessionId));
		 return map;
	}

	public Map<String, Object> saleCount(String sessionId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("five",sqlMapper.selectOne("mypage.saleCount5", sessionId));
		map.put("zero",sqlMapper.selectOne("mypage.saleCount0", sessionId));
		map.put("one",sqlMapper.selectOne("mypage.saleCount1", sessionId));
		map.put("two",sqlMapper.selectOne("mypage.saleCount2", sessionId));
		map.put("three",sqlMapper.selectOne("mypage.saleCount3", sessionId));
		map.put("fourfour",sqlMapper.selectOne("mypage.saleCount44", sessionId));
		 return map;
	}

	public int deleteRecenPd(String sessionId) {
		return sqlMapper.delete("mypage.deleteRecenPd",sessionId);
	}
	public int EachdeleteRecenPd(int RECENT_NUM) {
		return sqlMapper.delete("mypage.EachdeleteRecenPd",RECENT_NUM);
		
	}
	public int AllAlarmDelete(String sessionId) {
		return sqlMapper.delete("mypage.AllAlarmDelete",sessionId);
	}

	public List<Map<String, Object>> adminOrderList() {
		return sqlMapper.selectList("mypage.adminOrderList");
	}
	public List<Map<String, Object>> orderSearch0(String isSearch) {
		return sqlMapper.selectList("mypage.orderSearch0", "%"+isSearch+"%");
	}
	public List<Map<String, Object>> orderSearch1(String isSearch) {
		return sqlMapper.selectList("mypage.orderSearch1", "%"+isSearch+"%");
	}
	public List<Map<String, Object>> orderSearch2(String isSearch) {
		return sqlMapper.selectList("mypage.orderSearch2", "%"+isSearch+"%");
	}
	}

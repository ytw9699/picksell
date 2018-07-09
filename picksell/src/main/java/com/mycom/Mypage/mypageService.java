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
	public List<Map<String, Object>> sellList0(String sessionId) {
		return sqlMapper.selectList("mypage.sellList0", sessionId);
	}
	public List<Map<String, Object>> sellList1(String sessionId) {
		return sqlMapper.selectList("mypage.sellList1", sessionId);
	}
	public List<Map<String, Object>> sellList2(String sessionId) {
		return sqlMapper.selectList("mypage.sellList2", sessionId);
	}

	public List<Map<String, Object>> purchaseList0(String sessionId) {
		return sqlMapper.selectList("mypage.purchaseList", sessionId);
	}

	public List<Map<String, Object>> orderList(String sessionId) {
		return sqlMapper.selectList("mypage.orderList", sessionId);
	}
	public List<Map<String, Object>> orderSubList(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.orderSubList", parameterMap);
	}
	public Map<String, Object> orderDetail(int PRODUCT_NUM) {
		return sqlMapper.selectOne("mypage.orderDetail", PRODUCT_NUM);
	}
	
	
}

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

	public List<Map<String, Object>> orderList(String sessionId) {
		return sqlMapper.selectList("mypage.orderList", sessionId);
	}
	public List<Map<String, Object>> orderSubList(Map<String, Object> parameterMap) {
		return sqlMapper.selectList("mypage.orderSubList", parameterMap);
	}
	public Map<String, Object> orderDetail(int PRODUCT_NUM) {
		return sqlMapper.selectOne("mypage.orderDetail", PRODUCT_NUM);
	}

	public List<Map<String, Object>> orderSubDetail(int PRODUCT_NUM) {
		return sqlMapper.selectList("mypage.orderSubDetail", PRODUCT_NUM);
	}

	public String userCheck(String string) {
		return sqlMapper.selectOne("mypage.userCheck", string);
	}
	public void deletePurchaseList(int purchase_num) {
		sqlMapper.delete("mypage.deletePurchaseList", purchase_num);
	}
	
}

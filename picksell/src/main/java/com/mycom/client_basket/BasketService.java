package com.mycom.client_basket;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class BasketService implements BasketDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	//제품상세보기 > 이미 장바구니에 담았는지 확인
	public int countingIsBasket(Map<String, Object> map) {
		return sqlMapper.selectOne("client_basket.selectIsBasket", map);
	}
	//장바구니에 담기
	public void insertBasket(Map<String, Object> map) {
		sqlMapper.insert("client_basket.insertBasket", map);
	}
	

}

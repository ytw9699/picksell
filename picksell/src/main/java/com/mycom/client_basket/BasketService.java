package com.mycom.client_basket;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class BasketService implements BasketDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	//고객레이아웃 > 헤더의 현재 장바구니 개수 표시
	public int countingMyBasket(String sessionId) {
		return sqlMapper.selectOne("client_basket.countingMyBasket", sessionId);
	}
		
	//제품상세보기 > 이미 장바구니에 담았는지 확인
	public int countingIsBasket(Map<String, Object> map) {
		return sqlMapper.selectOne("client_basket.selectIsBasket", map);
	}
	//장바구니에 담기
	public void insertBasket(Map<String, Object> map) {
		sqlMapper.insert("client_basket.insertBasket", map);
	}
	//장바구니 리스트
	public List<Map<String, Object>> selectBasketList(String sessionId){
		return sqlMapper.selectList("client_basket.selectBasketList", sessionId);
	}
	//장바구니 수량증가
	public void addQuantity(int basket_num) {
		sqlMapper.update("client_basket.addQuantity", basket_num);
	}
	//장바구니 수량감소
	public void subQuantity(int basket_num) {
		sqlMapper.update("client_basket.subQuantity", basket_num);
	}
	//장바구니 단일삭제
	public void deleteBasket(int basket_num) {
		sqlMapper.delete("client_basket.deleteBasket", basket_num);
	}
	//장바구니 전체삭제(장바구니비우기)
	public void deleteAllBasket(String sessionId) {
		sqlMapper.delete("client_basket.deleteAllBasket", sessionId);
	}

}

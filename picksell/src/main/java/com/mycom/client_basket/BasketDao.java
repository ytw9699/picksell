package com.mycom.client_basket;

import java.util.Map;

public interface BasketDao {
	
	//제품상세보기 > 이미 장바구니에 담았는지 확인
	public int countingIsBasket(Map<String, Object> map);

	//장바구니에 담기
	public void insertBasket(Map<String, Object> map);
}

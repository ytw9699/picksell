package com.mycom.client_basket;

import java.util.List;
import java.util.Map;

public interface BasketDao {
	
	//고객레이아웃 > 헤더의 현재 장바구니 개수 표시
	public int countingMyBasket(String sessionId);
	
	//제품상세보기 > 이미 장바구니에 담았는지 확인
	public int countingIsBasket(Map<String, Object> map);

	//장바구니에 담기
	public void insertBasket(Map<String, Object> map);
	
	//장바구니 리스트
	public List<Map<String, Object>> selectBasketList(String sessionId); 
	
	//장바구니 수량증가
	public void addQuantity(int basket_num);
	
	//장바구니 수량감소
	public void subQuantity(int basket_num);
	
	//장바구니 단일삭제
	public void deleteBasket(int basket_num);
	
	//장바구니 전체삭제(장바구니비우기)
	public void deleteAllBasket(String sessionId);
	
}

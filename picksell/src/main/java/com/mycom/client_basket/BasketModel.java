package com.mycom.client_basket;

import java.util.List;

public class BasketModel {
	
	//총 결제금액
	private int totalSum;
	
	//장바구니에 담긴 개당상품정보
	private List<BasketProductModel> p_list;
	public int getTotalSum() {
		return totalSum;
	}
	public void setTotalSum(int totalSum) {
		this.totalSum = totalSum;
	}
	public List<BasketProductModel> getP_list() {
		return p_list;
	}
	public void setP_list(List<BasketProductModel> p_list) {
		this.p_list = p_list;
	}
	
	

}

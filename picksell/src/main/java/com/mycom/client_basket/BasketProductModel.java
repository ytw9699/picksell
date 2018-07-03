package com.mycom.client_basket;

public class BasketProductModel {
	/*> 상품글번호	
	> 상품제목
	> 상품이미지
	> 상품개당가격
	> 상품현재가격
	> 주문수량
	> 판매자아이디*/
	private int product_num; //d
	private String product_subject; //d
	private String product_img;
	private int product_price;
	private int product_currentPrice;
	private int orderSum;
	private String seller_id;
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getProduct_subject() {
		return product_subject;
	}
	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_currentPrice() {
		return product_currentPrice;
	}
	public void setProduct_currentPrice(int product_currentPrice) {
		this.product_currentPrice = product_currentPrice;
	}
	public int getOrderSum() {
		return orderSum;
	}
	public void setOrderSum(int orderSum) {
		this.orderSum = orderSum;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	
	
	
}

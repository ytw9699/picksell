package com.mycom.client_order;

public class OrderListModel {

	private int product_num;
	private int order_quantity;
	private String seller_id;
	private int order_num;
	
	private int product_howtosell;
	
	
	
	
	public int getProduct_howtosell() {
		return product_howtosell;
	}
	public void setProduct_howtosell(int product_howtosell) {
		this.product_howtosell = product_howtosell;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	
	

}

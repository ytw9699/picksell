package com.mycom.client_order;

import java.util.List;

public class OrderModel {
	
	private int total_price; //총 결제금액
	private String destination; // 배송지
	private String account;  // 계좌번호
	private String account_name; //예금주
	private String bank; //은행명
	private String buyer_id;
	private String buyer_phone;
	private String buyer_email;
	private String precautions;
	
	private int order_num;
	//구매신청번호(7월5일기준 아직 추가x)
	
	private List<OrderListModel> o_list;
	
	
	
	public String getBuyer_phone() {
		return buyer_phone;
	}
	public void setBuyer_phone(String buyer_phone) {
		this.buyer_phone = buyer_phone;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getPrecautions() {
		return precautions;
	}
	public void setPrecautions(String precautions) {
		this.precautions = precautions;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public List<OrderListModel> getO_list() {
		return o_list;
	}
	public void setO_list(List<OrderListModel> o_list) {
		this.o_list = o_list;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}

}

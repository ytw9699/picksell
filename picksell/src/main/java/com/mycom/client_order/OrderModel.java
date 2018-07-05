package com.mycom.client_order;

import java.util.List;

public class OrderModel {
	
	private int total_price; //총 결제금액
	private String destination; // 배송지
	private String account;  // 계좌번호
	private String account_name; //예금주
	private String bank; //은행명
	//구매신청번호(7월5일기준 아직 추가x)
	
	private List<OrderListModel> o_list;
	
	
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

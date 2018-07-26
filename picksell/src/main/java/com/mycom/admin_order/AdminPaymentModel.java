package com.mycom.admin_order;

import java.util.Date;

public class AdminPaymentModel {
	
	private int order_num;
	private String buyer_id;
	private String status = "0";
	private int total_price;
	private String destination;
	private String account;
	private String account_name;
	private String bank;
	private int purchase_num;
	private String delivery_company = "0";
	private String invoice_num = "0";
	private Date step1_date;
	private Date step2_date;
	private Date step3_date;
	private Date step4_date;
	private Date cancel_date;
	private String seller_id;
	
	
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public int getPurchase_num() {
		return purchase_num;
	}
	public void setPurchase_num(int purchase_num) {
		this.purchase_num = purchase_num;
	}
	public String getDelivery_company() {
		return delivery_company;
	}
	public void setDelivery_company(String delivery_company) {
		this.delivery_company = delivery_company;
	}
	public String getInvoice_num() {
		return invoice_num;
	}
	public void setInvoice_num(String invoice_num) {
		this.invoice_num = invoice_num;
	}
	public Date getStep1_date() {
		return step1_date;
	}
	public void setStep1_date(Date step1_date) {
		this.step1_date = step1_date;
	}
	public Date getStep2_date() {
		return step2_date;
	}
	public void setStep2_date(Date step2_date) {
		this.step2_date = step2_date;
	}
	public Date getStep3_date() {
		return step3_date;
	}
	public void setStep3_date(Date step3_date) {
		this.step3_date = step3_date;
	}
	public Date getStep4_date() {
		return step4_date;
	}
	public void setStep4_date(Date step4_date) {
		this.step4_date = step4_date;
	}
	public Date getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}
}
	
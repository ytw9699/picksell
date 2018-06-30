package com.mycom.admin_products;

import java.util.Date;

public class AdminSellModel {
	private int product_num;
	private int category_num;
	private String seller_id;
	private String howtosell;
	private int hitcount = 0;
	private int stock = 0;
	private Date product_regdate;
	private String deal_status = "0";
	private String board_status = "0";
	private String content;
	private String first_img = "0";
	private String subject;
	private String product_status;
	private int price;
	
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getHowtosell() {
		return howtosell;
	}
	public void setHowtosell(String howtosell) {
		this.howtosell = howtosell;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Date getProduct_regdate() {
		return product_regdate;
	}
	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}
	public String getDeal_status() {
		return deal_status;
	}
	public void setDeal_status(String deal_status) {
		this.deal_status = deal_status;
	}
	public String getBoard_status() {
		return board_status;
	}
	public void setBoard_status(String board_status) {
		this.board_status = board_status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFirst_img() {
		return first_img;
	}
	public void setFirst_img(String first_img) {
		this.first_img = first_img;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}

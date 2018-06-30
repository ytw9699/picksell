package com.mycom.admin_singo;

import java.util.Date;

public class AdminSingoModel {
	
	private int singo_num;
	private int product_num;
	private String singoee;
	private String singo_writer;
	private Date singo_regdate;
	private String singo_content;
	
	public int getSingo_num() {
		return singo_num;
	}
	public void setSingo_num(int singo_num) {
		this.singo_num = singo_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getSingoee() {
		return singoee;
	}
	public void setSingoee(String singoee) {
		this.singoee = singoee;
	}
	public String getSingo_writer() {
		return singo_writer;
	}
	public void setSingo_writer(String singo_writer) {
		this.singo_writer = singo_writer;
	}
	public Date getSingo_regdate() {
		return singo_regdate;
	}
	public void setSingo_regdate(Date singo_regdate) {
		this.singo_regdate = singo_regdate;
	}
	public String getSingo_content() {
		return singo_content;
	}
	public void setSingo_content(String singo_content) {
		this.singo_content = singo_content;
	}
	
}

package com.mycom.admin_singo;

import java.util.List;
import java.util.Map;

import com.mycom.admin_products.AdminSellModel;
import com.mycom.admin_singo.AdminSingoModel;

public interface AdminSingoDAO {
	
	//신고리스트 
	public List<AdminSingoModel> singoList();
	// 특정 오더 검색 
	public List<AdminSingoModel> singoSearch0(String search);
	public List<AdminSingoModel> singoSearch1(String search);
	public List<AdminSingoModel> singoSearch2(String search);
	//신고 상세보기 
	public AdminSingoModel singoView(int singo_num);
	//신고 검색 
	public List<AdminSingoModel> singoSearchList(String search);
	
	public List<Map<String,Object>> singoList2();
	
	
}

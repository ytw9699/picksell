package com.mycom.admin_products;

import java.util.List;


import com.mycom.admin_products.AdminSellModel;

public interface AdminSellDAO {
	
	//판매글 리스트 
	public List<AdminSellModel> productsList();
	// 특정 오더 검색 
	public List<AdminSellModel> productsSearch0(String search);
	public List<AdminSellModel> productsSearch1(String search);
	public List<AdminSellModel> productsSearch2(String search);
	//판매글 상세보기 
	public AdminSellModel productsView(int product_num);
//	//판매글 검색 
//	public List<AdminSellModel> productsSearchList(String search);
	//블라인드 상태 업데이트 
	public Object updateBoardStatus(AdminSellModel adminSellModel);
	
}

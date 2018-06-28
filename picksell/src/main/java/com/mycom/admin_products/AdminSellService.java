package com.mycom.admin_products;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class AdminSellService implements AdminSellDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//판매글 리스트 
	@Override
	public List<AdminSellModel> productsList(){
		return null;
	}
	//판매글 상세보기 
	@Override
	public AdminSellModel productsView(int product_num) {
		return null;
	}
	//판매글 검색 
	@Override
	public List<AdminSellModel> productsSearchList(String search){
		return null;
	}
	//블라인드 상태 업데이트
	@Override
	public Object updateBoardStatus(AdminSellModel adminSellModel) {
		return null;
	}
		
}

package com.mycom.admin_products;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mycom.admin_order.AdminPaymentModel;

@Service
public class AdminSellService implements AdminSellDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//판매글 리스트 
	@Override
	public List<AdminSellModel> productsList(){
		return sqlSessionTemplate.selectList("adminProducts.productsList-all");
	}
	
	// 특정 오더 검색 
	@Override
	public List<AdminSellModel> productsSearch0(String search){
		return sqlSessionTemplate.selectList("adminProducts.productsSearch0", "%"+search+"%");
	}
	@Override
	public List<AdminSellModel> productsSearch1(String search){
		return sqlSessionTemplate.selectList("adminProducts.productsSearch1", "%"+search+"%");
	}
	@Override
	public List<AdminSellModel> productsSearch2(String search){
		return sqlSessionTemplate.selectList("adminProducts.productsSearch2", "%"+search+"%");
	}
	
	public void updateStock(Map<String, Object> map) {
		 sqlSessionTemplate.update("adminOrder.updateStock",map);
	}
	
	//판매글 상세보기 
	@Override
	public AdminSellModel productsView(int product_num) {
		return null;
	}
	
	
	
	
//	//판매글 검색 
//	@Override
//	public List<AdminSellModel> productsSearchList(String search){
//		return null;
//	}
	//블라인드 상태 업데이트
	@Override
	public Object updateBoardStatus(AdminSellModel adminSellModel) {
		return null;
	}
		
}

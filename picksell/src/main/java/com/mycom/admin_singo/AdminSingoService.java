package com.mycom.admin_singo;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycom.admin_products.AdminSellModel;

@Service
public class AdminSingoService implements AdminSingoDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//신고리스트 
	@Override
	public List<AdminSingoModel> singoList(){
		return sqlSessionTemplate.selectList("adminSingo.singoList-all");
	}
	//board_status 포함해서 신고리스트 출력하기 위한 것 
	public List<Map<String,Object>> singoList2(){
		return sqlSessionTemplate.selectList("adminSingo.singoList-all2");
	}
	
	// 특정 오더 검색 
	@Override
	public List<AdminSingoModel> singoSearch0(String search){
		return sqlSessionTemplate.selectList("adminSingo.singoSearch0", "%"+search+"%");
	}
	@Override
	public List<AdminSingoModel> singoSearch1(String search){
		return sqlSessionTemplate.selectList("adminSingo.singoSearch1", "%"+search+"%");
	}
	@Override
	public List<AdminSingoModel> singoSearch2(String search){
		return sqlSessionTemplate.selectList("adminSingo.singoSearch2", "%"+search+"%");
	}
		
	public void doBlind(int product_num) {
		sqlSessionTemplate.update("adminSingo.doBlind", product_num);
	}
	
	//신고 상세보기 
	@Override
	public AdminSingoModel singoView(int singo_num) {
		return null;
	}
	//신고 검색 
	@Override
	public List<AdminSingoModel> singoSearchList(String search){
		return null;
	}
	
}

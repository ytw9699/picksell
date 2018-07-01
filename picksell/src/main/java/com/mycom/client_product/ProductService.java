package com.mycom.client_product;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class ProductService implements ProductDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	//판매글 등록(일반판매)
	public void insertProduct(Map<String, Object> map) {
		sqlMapper.insert("client_product.insertProduct", map);
	}
	//판매글 리스트(일반판매)
	public List<Map<String, Object>> getNomalProductList(Map<String, Object> map){
		return sqlMapper.selectList("client_product.selectNomalProductList", map);
	}
	//판매글 리스트(플러스판매)
	public List<Map<String, Object>> getPlusProductList(Map<String, Object> map){
		return sqlMapper.selectList("client_product.selectPlusProductList", map);
	}
	//판매글 상세보기(일반판매+플러스판매)
	public Map<String, Object> getProductDetail(Map<String, Object> map){
		return sqlMapper.selectOne("client_product.selectProductOne", map);
	}
	//판매글 조회수증가(상세보기랑 같이)
	public void updateProductHitcount(Map<String, Object> map) {
		sqlMapper.update("client_product.updateProductHitcount", map);
	}
	//판매글 문의작성
	public void insertProductComment(Map<String, Object> map) {
		sqlMapper.insert("client_product.insertProductComment", map);
	}
	//판매글 문의리스트
	public List<Map<String, Object>> getProductCommentList(int product_num){
		return sqlMapper.selectList("client_product.selectProductComment", product_num);
	}
	//판매글 구매신청리스트
	public List<Map<String, Object>> getProductPurchaseList(int product_num){
		return sqlMapper.selectList("client_product.selectPurchaseList", product_num);
	}
}

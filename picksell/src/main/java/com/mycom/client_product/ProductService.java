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
	//판매글 리스트(메인카테고리)
	public List<Map<String, Object>> getProductListOnMain(Map<String, Object> map) {
		return sqlMapper.selectList("client_product.selectProductListMain", map);
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
	//판매글 해당구매리스트(조건부)
	public List<Map<String, Object>> getProductSellerPurchaseList(int product_num){
		return sqlMapper.selectList("client_product.selectSellerPurchaseList", product_num);
	}
	//판매글 수락여부(조건부)
	public int getAlreadyPurchaseApproving(int product_num) {
		return sqlMapper.selectOne("client_product.selectAlradyPurchaseApproving", product_num);
	}
	//판매글 수락하기(조건부)
	public void letPurchaseApprove(int purchase_num) {
		sqlMapper.update("client_product.letPurchaseApprove", purchase_num);
	}
	//판매글 수락취소하기(조건부)
	public void letPurchaseApproveCancel(int purchase_num) {
		sqlMapper.update("client_product.letPurchaseApproveCancel", purchase_num);
	}
	//구매요청 수락여부(구매자)
	public int selectMyPurchase(Map<String, Object> map) {
		return sqlMapper.selectOne("client_product.selectMyPurchase2", map);
	}
	//판매글 조회수증가(상세보기랑 같이)
	public void updateProductHitcount(Map<String, Object> map) {
		sqlMapper.update("client_product.updateProductHitcount", map);
	}
	//판매글 문의작성
	public void insertProductComment(Map<String, Object> map) {
		sqlMapper.insert("client_product.insertProductComment", map);
	}
	//판매글 문의리플작성
	public void insertProductReComment(Map<String, Object> map) {
		int currentStepNumber = sqlMapper.selectOne("client_product.getCurrentStepNumber", map);
		map.put("step_num", currentStepNumber+1);
		sqlMapper.insert("client_product.insertProductReComment", map);
	}
	//판매글 문의리스트(판매자용)
	public List<Map<String, Object>> getProductCommentListOfSeller(int product_num){
		return sqlMapper.selectList("client_product.selectProductCommentOfSeller", product_num);
	}
	//판매글 문의리스트(구매자용)
	public List<Map<String, Object>> getProductCommentListOfBuyer(Map<String, Object> map){
		return sqlMapper.selectList("client_product.selectProductCommentOfBuyer", map);
	}
	//판매글 문의삭제
	public void deleteProductComment(int parameterNumber, String howToDelete) {
		if(howToDelete.equals("comment")) {
			sqlMapper.delete("client_product.deleteProductComment", parameterNumber);
		}else if(howToDelete.equals("reple")) {
			sqlMapper.delete("client_product.deleteProductReple", parameterNumber);
		}
	}
	
	//판매글 구매신청
	public void insertProductPurchaseList(Map<String, Object> map) {
		sqlMapper.insert("client_product.insertPurchaseList", map);
	}
	//판매글 구매신청취소
	public void deleteProductPurchaseList(Map<String, Object> map) {
		sqlMapper.delete("client_product.deletePurchaseList", map);
	}
	//판매글 구매신청리스트
	public List<Map<String, Object>> getProductPurchaseList(int product_num){
		return sqlMapper.selectList("client_product.selectPurchaseList", product_num);
	}
	//카테고리 긁어오기
	public List<Map<String, Object>> getCategoryList(){
		return sqlMapper.selectList("client_product.getCategoryList");
	}
	public void alarmRead(int ALARM_NUM) {//알람읽기
		sqlMapper.update("client_product.alarmRead", ALARM_NUM);
	}
	// 최근본상품 로직 by태원 
	public void insertRecentProduct(Map<String, Object> parameterMap) {
		sqlMapper.insert("client_product.insertRecentProduct", parameterMap);
	}// 최근본상품 로직 by태원 
	
	//신고유효성
	public int isAbledSingo(Map<String, Object> map) {
		return sqlMapper.selectOne("client_product.countingForSingo", map);
	}
	
	//신고처리
	public void singoProcess(Map<String, Object> map) {
		sqlMapper.insert("client_product.insertSingoProcess", map);
	}
}

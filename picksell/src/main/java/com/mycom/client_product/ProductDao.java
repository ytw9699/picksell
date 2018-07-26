package com.mycom.client_product;

import java.util.List;
import java.util.Map;

public interface ProductDao {
	
	//판매글 등록(일반판매)
	public void insertProduct(Map<String, Object> map);
	
	//판매글 리스트(메인카테고리)
	public List<Map<String, Object>> getProductListOnMain(Map<String, Object> map);
	
	//판매글 리스트(일반판매)
	public List<Map<String, Object>> getNomalProductList(Map<String, Object> map);

	//판매글 리스트(플러스판매)
	public List<Map<String, Object>> getPlusProductList(Map<String, Object> map);
	
	//판매글 상세보기(일반판매+플러스판매)
	public Map<String, Object> getProductDetail(Map<String, Object> map);
	
	//판매글 해당구매리스트(판매자 조건부)
	public List<Map<String, Object>> getProductSellerPurchaseList(int product_num);
	
	//판매글 수락여부(판매자 조건부)
	public int getAlreadyPurchaseApproving(int product_num);
	
	//판매글 수락하기(판매자 조건부)
	public void letPurchaseApprove(int purchase_num);
	
	//판매글 수락취소하기(판매자 조건부)
	public void letPurchaseApproveCancel(int purchase_num);
	
	//구매요청 수락여부(구매자)
	public int selectMyPurchase(Map<String, Object> map);
	
	//판매글 조회수증가(상세보기랑 같이)
	public void updateProductHitcount(Map<String, Object> map);
	
	//판매글 문의작성
	public void insertProductComment(Map<String, Object> map);
	
	//판매글 문의리플작성
	public void insertProductReComment(Map<String, Object> map);
	
	//판매글 문의리스트(판매자용)
	public List<Map<String, Object>> getProductCommentListOfSeller(int product_num);
	
	//판매글 문의리스트(구매자용)
	public List<Map<String, Object>> getProductCommentListOfBuyer(Map<String, Object> map);
	
	//판매글 문의삭제
	public void deleteProductComment(int parameterNumber, String howToDelete);
	
	//판매글 구매신청
	public void insertProductPurchaseList(Map<String, Object> map);
	
	//판매글 구매신청취소
	public void deleteProductPurchaseList(Map<String, Object> map);
	
	//판매글 구매신청리스트
	public List<Map<String, Object>> getProductPurchaseList(int product_num);
	
	//카테고리 긁어오기
	public List<Map<String, Object>> getCategoryList();
	
	//신고유효성
	public int isAbledSingo(Map<String, Object> map);
	
	//신고처리
	public void singoProcess(Map<String, Object> map);
}

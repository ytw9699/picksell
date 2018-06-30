package com.mycom.client_product;

import java.util.List;
import java.util.Map;

public interface ProductDao {
	
	//판매글 등록(일반판매)
	public void insertProduct(Map<String, Object> map);
	
	//판매글 리스트
	public List<Map<String, Object>> getNomalProductList(Map<String, Object> map);

}

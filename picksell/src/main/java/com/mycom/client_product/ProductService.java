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
	
	//판매글 리스트
	public List<Map<String, Object>> getNomalProductList(Map<String, Object> map){
		return sqlMapper.selectList("client_product.selectNomalProductList", map);
	}

}

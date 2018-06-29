package com.mycom.client_product;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class ProductService implements ProductDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	public void insertProduct(Map<String, Object> map) {
		sqlMapper.insert("client_product.insertProduct", map);
	}

}

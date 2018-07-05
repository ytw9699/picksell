package com.mycom.client_order;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class OrderService implements OrderDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
}

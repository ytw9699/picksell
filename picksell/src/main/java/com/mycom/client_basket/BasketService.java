package com.mycom.client_basket;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class BasketService implements BasketDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;

}

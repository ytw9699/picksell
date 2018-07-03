package com.mycom.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class mainService implements mainDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	public List<Map<String, Object>> nomalProduct(){
		return sqlMapper.selectList("main.nomalProduct");
	}

	public List<Map<String, Object>> pulsProduct() {
		return sqlMapper.selectList("main.pulsProduct");
	}

	public List<Map<String, Object>> hotProduct() {
		return sqlMapper.selectList("main.hotProduct");
	}
	
}

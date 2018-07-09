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
	public List<Map<String, Object>> hotProductHP() {
		return sqlMapper.selectList("main.hotProductHP");
	}
	public List<Map<String, Object>> hotProductLP() {
		return sqlMapper.selectList("main.hotProductLP");
	}
	public List<Map<String, Object>> hotPlusProduct(Map<String, Object> map){
			return sqlMapper.selectList("main.hotPlusProduct", map);
	}
	public List<Map<String, Object>> hotProductListLatest() {//최신순
		return sqlMapper.selectList("main.hotProductLatest");
	}
	public List<Map<String, Object>> hotCategory() {
		return sqlMapper.selectList("main.hotCategory");
	}
	public List<Map<String, Object>> mainSearchList(Map<String, Object> map) {
		return sqlMapper.selectList("main.mainSearchList",map);
	}

}

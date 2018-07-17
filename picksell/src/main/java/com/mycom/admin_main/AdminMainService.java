package com.mycom.admin_main;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
@Service
public class AdminMainService {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public Map<String,Object> memberJoinCount(String day){
	      return sqlSessionTemplate.selectOne("admin_Main.today",day);
	}
	
 
}

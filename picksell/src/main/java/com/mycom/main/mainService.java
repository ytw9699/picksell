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
	
}

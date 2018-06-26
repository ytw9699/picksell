package com.mycom.picksell;

import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	public Map<String, Object> selectTest(){
		return sqlMapper.selectOne("test.selectTest");
	}
	
}

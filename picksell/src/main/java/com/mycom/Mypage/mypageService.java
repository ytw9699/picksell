package com.mycom.Mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class mypageService implements mypageDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;

	public Map<String, Object> userInfo(String sessionId) {
		return sqlMapper.selectOne("mypage.userInfo", sessionId);
	}

	public void updateBusiness(Map<String, Object> map) {
		sqlMapper.update("mypage.updateBusiness", map);
		}
	public void updatePersonal(Map<String, Object> map) {
		sqlMapper.update("mypage.updatePersonal", map);
		}
}

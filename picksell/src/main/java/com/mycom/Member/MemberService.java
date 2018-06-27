package com.mycom.Member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements MemberDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	

	public void insertMember(Map<String, Object> map) {
		sqlMapper.insert("board.insertMember", map);
	}
	
	
}

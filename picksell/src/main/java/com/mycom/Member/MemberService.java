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
	
	
	public void insertMember(Map<String, Object> map) {//일반회원가입
		sqlMapper.insert("member.insertMember", map);
	}
	
	public void insertBsMember(Map<String, Object> map) {//사업자회원가입
		sqlMapper.insert("member.insertBsMember", map);
	}
	
	public Map<String, Object> userCheck(Map<String, Object> map) {
		return sqlMapper.selectOne("member.userCheck", map);
	}
	
}

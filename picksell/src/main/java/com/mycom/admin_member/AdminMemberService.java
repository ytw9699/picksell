package com.mycom.admin_member;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminMemberService implements AdminMemberDAO {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<AdminMemberModel> AdminMemberList(){
		return sqlSessionTemplate.selectList("");
	}
	
	
}

package com.mycom.admin_member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberService implements AdminMemberDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//전체회원 목록 조회
	@Override
	public List<AdminMemberModel> AdminMemberList(){
		return sqlSessionTemplate.selectList("admin_Member.membersList");
	}
	
	@Override
	public List<AdminMemberModel> searchName(String memberSearch){
		return sqlSessionTemplate.selectList("admin_Member.searchName", memberSearch);
	}
	
	@Override
	public List<AdminMemberModel> searchId(String memberSearch){
		return sqlSessionTemplate.selectList("admin_Member.searchId",memberSearch);
	}
	
	@Override
	public Map<String,Object> selectOneMember(String id) {
		return sqlSessionTemplate.selectOne("admin_Member.selectOneMember",id);
	}

	
	
}

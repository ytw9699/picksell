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
	
	@Override
	public List<Map<String,Object>> adminOrderList(String id){
		return sqlSessionTemplate.selectList("admin_Member.selectOrderList",id);
	}
	
	@Override
	public List<Map<String, Object>> adminOrderSubList(Map<String,Object> map){
		return sqlSessionTemplate.selectList("admin_Member.selectOrderSubList",map);
	}
	
	@Override
	public List<Map<String,Object>> adminSellHistory(String id){
	  return sqlSessionTemplate.selectList("admin_Member.adminSellHistory",id);
	}
	
	@Override
	public List<Map<String,Object>> adminPurchaseHistory(String id){
		return sqlSessionTemplate.selectList("admin_Member.adminPurchaseHistory",id);
	}
	
	@Override
	public List<Map<String,Object>> adminProducts(String id){
		return sqlSessionTemplate.selectList("admin_Member.adminSelling",id);
	}
	
	@Override
	public void changeBlindStatus(Map<String,Object> map) {
		sqlSessionTemplate.update("admin_Member.blindStatus",map);
	}

	@Override
	public void changeMemberStatus(Map<String,Object> map) {
		 sqlSessionTemplate.update("admin_Member.adminMemberStatus", map);
	
	}
	
	
	@Override
	public List<Map<String,Object>> adminSubList(Map<String,Object> map){
		return sqlSessionTemplate.selectList("admin_Member.adminSubList", map);
	}
	
}

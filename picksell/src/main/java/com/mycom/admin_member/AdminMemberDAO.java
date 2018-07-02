package com.mycom.admin_member;

import java.util.List;
import java.util.Map;

import com.mycom.admin_member.AdminMemberModel;

public interface AdminMemberDAO {
	 
	
	//회원목록
	public List<AdminMemberModel> AdminMemberList();
	
	//회원검색할때 
	public List<AdminMemberModel> searchName(String search);
	
	public List<AdminMemberModel> searchId(String search);
 
	//회원 상세보기
	public Map<String,Object> selectOneMember(String id);
	
	//회원 주문내역리스트
	public List<Map<String,Object>> adminOrderList(String id);
	
	
}

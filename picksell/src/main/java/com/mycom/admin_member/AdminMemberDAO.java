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
	
	//회원 판매내역리스트
	public List<Map<String,Object>> adminSellHistory(String id);
	
	//회원 구매내역리스트
	public List<Map<String,Object>> adminPurchaseHistory(String id);
	
	//회원 판매리스트
	
	
	//회원 블라인드처리
	
	//회원 계정상태 처리
}

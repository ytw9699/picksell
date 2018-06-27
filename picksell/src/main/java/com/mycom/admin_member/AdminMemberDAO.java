package com.mycom.admin_member;

import java.util.List;
import com.mycom.admin_member.AdminMemberModel;

public interface AdminMemberDAO {
	 
	
	//회원목록
	public List<AdminMemberModel> AdminMemberList();
	
	//회원검색할때 
	//public List<MemberModel> searchOneMember(String search);
}

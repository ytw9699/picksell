package com.mycom.admin_singo;

import java.util.List;
import com.mycom.admin_singo.AdminSingoModel;

public interface AdminSingoDAO {
	
	//신고리스트 
	public List<AdminSingoModel> singoList();
	//신고 상세보기 
	public AdminSingoModel singoView(int singo_num);
	//신고 검색 
	public List<AdminSingoModel> singoSearchList(String search);
	
}

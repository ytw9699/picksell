package com.mycom.admin_singo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class AdminSingoService implements AdminSingoDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//신고리스트 
	@Override
	public List<AdminSingoModel> singoList(){
		return null;
	}
	//신고 상세보기 
	@Override
	public AdminSingoModel singoView(int singo_num) {
		return null;
	}
	//신고 검색 
	@Override
	public List<AdminSingoModel> singoSearchList(String search){
		return null;
	}
	
}

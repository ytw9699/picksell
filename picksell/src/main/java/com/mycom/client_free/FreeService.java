package com.mycom.client_free;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class FreeService implements FreeDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//무료나눔 게시판 리스트 
	public List<Map<String, Object>> freeList(){
		return null;
	}
		
	//게시글 상세보기 
	public Map<String, Object> freeDetail(int fb_num){
		return null;
	}
		
	//게시글 생성
	public void freeCreate(Map map) {
		
	}
		
	//게시글 수정
	public void freeUpdate(Map map) {
		
	}
		
	//게시글 삭제
	public void freeDelete(Map map) {
		
	}
	
}

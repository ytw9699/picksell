package com.mycom.client_free;

import java.util.List;
import java.util.Map;

public interface FreeDAO {
	
	//무료나눔 게시판 리스트 
	public List<Map<String, Object>> freeList();
	
	//게시글 상세보기 
	public Map<String, Object> freeDetail(int fb_num);
	
	//게시글 생성
	public void freeCreate(Map map);
	
	//게시글 수정
	public void freeUpdate(Map map);
	
	//게시글 삭제
	public void freeDelete(Map map);
}

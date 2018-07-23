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
		return sqlSessionTemplate.selectList("freeBoard.freeItem-all");
	}

	//무료나눔 게시글 내 댓글 리스트 
	public List<Map<String,Object>> commentList(int fb_num){
		return sqlSessionTemplate.selectList("freeBoard.freeItem-comment",fb_num);
	}
	
	//댓글 쓰기 
	public void commentCreate(Map<String, Object> map) {
		 sqlSessionTemplate.insert("freeBoard.freeItem-commentInsert", map);
	}
	
	//댓글 삭제 
	public void commentDelete(int fc_num) {
		sqlSessionTemplate.delete("freeBoard.deleteComment", fc_num);
	}
	
	//게시글 상세보기 
	public Map<String, Object> freeDetail(int fb_num){
		return sqlSessionTemplate.selectOne("freeBoard.freeItem-detail", fb_num);
	}
		
	//게시글 생성
	public void freeCreate(Map<String, Object> map) {
		sqlSessionTemplate.insert("freeBoard.freeItem-insert",map);
	}
	
	//조회수 업데이트 
	public void freeHitUpdate(int fb_num) {
		sqlSessionTemplate.update("freeBoard.freeItem-hitUpdate",fb_num);
	}
		
	//게시글 수정
	public void freeUpdate(Map<String, Object> map) {
		sqlSessionTemplate.update("freeBoard.freeItem-modify",map);
	}
		
	//게시글 삭제
	public void freeDelete(int fb_num) {
		sqlSessionTemplate.delete("freeBoard.deleteBoard",fb_num);
		
	}
	
	public void freeDeleteComment(int fb_num) {
		sqlSessionTemplate.delete("freeBoard.deleteBoardComment",fb_num);
	}
	
	//특정오더 검색 (글제목)
	public List<Map<String,Object>> freeSearch1(String search){
		return sqlSessionTemplate.selectList("freeBoard.freeSearch1", search);
	}
	//제목 + 내용
	public List<Map<String,Object>> freeSearch2(String search){
		return sqlSessionTemplate.selectList("freeBoard.freeSearch2", search);
	}
	//작성자
	public List<Map<String,Object>> freeSearch3(String search){
		return sqlSessionTemplate.selectList("freeBoard.freeSearch3", search);
	}
	
}

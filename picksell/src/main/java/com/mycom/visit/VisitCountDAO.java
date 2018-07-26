package com.mycom.visit;


import java.util.List;
import java.util.Map;

public interface VisitCountDAO {
	//세션 총 방문자 수 
	public Map<String,Object> totalvisit();
			
	//오늘 하루 방문자 수
	public Map<String,Object> visitToday();
			
	//visitInsert
	public void visitInsert();
	
}

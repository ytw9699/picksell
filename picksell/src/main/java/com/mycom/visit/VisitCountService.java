package com.mycom.visit;


import java.util.Map;
import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class VisitCountService implements VisitCountDAO{
    	
		@Resource(name="sqlSessionTemplate")
		private SqlSessionTemplate sqlSessionTemplate;
	
	
		@Override
    	//세션 총 방문자 수 
  		public Map<String,Object> totalvisit(){
			return sqlSessionTemplate.selectOne("visitCount.totalvisit");
		}
  		//오늘 하루 방문자 수
		@Override
  		public Map<String,Object> visitToday(){
  		  return sqlSessionTemplate.selectOne("visitCount.visitToday");
  		}
  		
  		//visitInsert
		@Override
  		public void visitInsert() {
  		  sqlSessionTemplate.insert("visitCounter.visitInsert");	
		}
	
	
}

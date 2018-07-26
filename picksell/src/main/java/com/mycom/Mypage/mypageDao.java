package com.mycom.Mypage;

import java.util.List;
import java.util.Map;

public interface mypageDao {
	
	//public void insertMember(Map<String, Object> map);
	
	//헤더의 알람목록 가져오기(읽지않은알람)
	public List<Map<String, Object>> getMyAlarmHeaderList(String currentID);

}
//
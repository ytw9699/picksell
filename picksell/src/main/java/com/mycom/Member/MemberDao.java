package com.mycom.Member;

import java.util.Map;

public interface MemberDao {
	
	public void insertMember(Map<String, Object> map);
	
	//알람ONOFF 설정(update)
	public void changeMyAlarm(Map<String, Object> map);

}

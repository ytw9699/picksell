package com.mycom.Member;

import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements MemberDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	
	public void insertMember(Map<String, Object> map) {//일반회원가입
		sqlMapper.insert("member.insertMember", map);
	}
	
	public void insertBsMember(Map<String, Object> map) {//사업자회원가입
		sqlMapper.insert("member.insertBsMember", map);
	}
	
	public Map<String, Object> userCheck(Map<String, Object> map) {
		return sqlMapper.selectOne("member.userCheck", map);
	}
	
	//알람ONOFF 설정(update)
	public void changeMyAlarm(Map<String, Object> map) {
		sqlMapper.update("member.userAlarmChange", map);
	}

	public void insertDate(Map<String, Object> map) {
		sqlMapper.insert("member.insertDate", map);
	}

	public void changeDate(Map<String, Object> resultMap) {
		sqlMapper.update("member.changeDate",resultMap);
	}

	public int checkJoinId(String id) {
		return sqlMapper.selectOne("member.checkJoinId",id);
	}

	public String findId(Map<String, Object> paramMap) {
		return sqlMapper.selectOne("member.findId", paramMap);
	}

	public String findPassword(Map<String, Object> paramMap) {
		return sqlMapper.selectOne("member.findPassword", paramMap);
	}

	public String selectRePs(Map<String, Object> map) {
		return sqlMapper.selectOne("member.selectRePs", map);
	}

	public void resetPassword(Map<String, Object> map) {//새로운비밀번호 설정
		 sqlMapper.update("member.resetPassword", map);
	}

	public String checkLogin(String name) {
		return sqlMapper.selectOne("member.checkLogin",name);
	}
	
}

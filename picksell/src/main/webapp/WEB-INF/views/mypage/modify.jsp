<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>내정보</title>
</head>
<body>
<c:if test="${resultMap.KIND == '0'}">
<div>
<form method="post">
	<input type="hidden" name="kind" value="0"/>
	<input type="hidden" name="id" value="${resultMap.ID}"/>
	<input type="hidden" name="name" value="${resultMap.NAME}"/>
	<input type="hidden" name="profile_img" value="${resultMap.PROFILE_IMG}"/>
	<input type="hidden" name="alarm_consent" value="${resultMap.ALARM_CONSENT}"/>
	<!-- 일반회원  -->
	아이디 ${resultMap.ID}
	 <br/>
	이름 ${resultMap.NAME}
	<br/>
        신규 비밀번호<input type="password" name="password" id="password" onkeyup="passwordsCheck()" value="${resultMap.PASSWORD}"/>
    <br/>
	비밀번호 다시 입력<input type="password" name="passwordCheck" id="passwordCheck" onkeyup="passwordsCheck()" value="${resultMap.PASSWORD}"/>&nbsp;<span id="passwordCheckText"></span>
	<br/>
	이메일<input type="text" value="${resultMap.EMAIL}" name="email" id="email" />
	<br/>
	주소<input type="text" value="${resultMap.ADDRESS}" name="address" />
	<br/>
	은행명<input type="text" value="${resultMap.BANK}" name="bank" />
	<br/>
	계좌번호<input type="text" value="${resultMap.ACCOUNT}" name="account" placeholder=" -를 빼고 입력해주세요"/>
	<br/>
	예금주<input type="text" value="${resultMap.ACCOUNT_NAME}" name="account_name" />
	<br/>
	<input type="submit" value="저장"/>
</form>
</div>
</c:if>

<c:if test="${resultMap.KIND == '1'}">
<div>
<form method="post">
	<input type="hidden" name="kind" value="1"/>
	<input type="hidden" name="id" value="${resultMap.ID}"/>
	<input type="hidden" name="name" value="${resultMap.NAME}"/>
	<input type="hidden" name="profile_img" value="${resultMap.PROFILE_IMG}"/>
	<input type="hidden" name="alarm_consent" value="${resultMap.ALARM_CONSENT}"/>
	<!-- 사업자회원  -->
	아이디 ${resultMap.ID}
	 <br/>
	이름 ${resultMap.NAME}
	<br/>
        새로운 비밀번호<input type="password" name="password" id="password" onkeyup="passwordsCheck()" />
    <br/>
	비밀번호 재확인<input type="password" name="passwordCheck" id="passwordCheck" onkeyup="passwordsCheck()" />&nbsp;<span id="passwordCheckText"></span>
	<br/>
	이메일<input type="text" value="${resultMap.EMAIL}" name="email" id="email" />
	<br/>
	주소<input type="text" value="${resultMap.ADDRESS}" name="address" />
	<br/>
	은행명<input type="text" value="${resultMap.BANK}" name="bank" />
	<br/>
	계좌번호<input type="text" value="${resultMap.ACCOUNT}" name="account" placeholder=" -를 빼고 입력해주세요"/>
	<br/>
	예금주<input type="text" value="${resultMap.ACCOUNT_NAME}" name="account_name" />
	<br/>
	사업자등록번호<input type="text" value="${resultMap.BUSINESS_NUMBER}" name="business_number" />
	<br/>
	상호명<input type="text" value="${resultMap.BUSINESS_NAME}" name="business_name" />
	<br/>
	<input type="submit" value="저장"/>
</form>
</div>
</c:if>

</body>
</html>

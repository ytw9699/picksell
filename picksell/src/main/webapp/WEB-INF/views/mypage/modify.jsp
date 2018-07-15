<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>내정보</title>
<h2>회원정보수정</h2>
</head>
<body>
<script>

function passwordsCheck(){
var NewPassword = $('#password').val();
var rePassword = $('#passwordCheck').val();

if(NewPassword === rePassword){
	 $('#Innerpassword').html('<b><font color = green size =2pt>비밀번호가 일치합니다. </font><b>');
}
else if(NewPassword !== rePassword){//
	 $('#Innerpassword').html('<b><font color = red size =2pt> 비밀번호가 일치하지 않습니다. </font><b>');
	 return false;
}
}

</script>
<div>
<form action="/picksell/mypage/modify" method="post" onsubmit = "return passwordsCheck()">
	<input type="hidden" name="id" value="${resultMap.ID}"/>
	<input type="hidden" name="profile_img" value="${resultMap.PROFILE_IMG}"/>
	<input type="hidden" name="alarm_consent" value="${resultMap.ALARM_CONSENT}"/>

	아이디 ${resultMap.ID}
	 <br/>
	이름 ${resultMap.NAME}
	<br/>
        신규 비밀번호<input type="password" name="password" id="password" onkeyup="passwordsCheck()" value="${resultMap.PASSWORD}"/>
    <br/>
	비밀번호 다시 입력<input type="password" name="passwordCheck" id="passwordCheck" onkeyup="passwordsCheck()" value="${resultMap.PASSWORD}"/>&nbsp;<span id="Innerpassword"></span>
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
	<!-- 사업자회원일 경우 보여주기-->
	<c:if test="${resultMap.KIND == '1'}">
	사업자등록번호<input type="text" value="${resultMap.BUSINESS_NUMBER}" name="business_number" />
	<br/>
	상호명<input type="text" value="${resultMap.BUSINESS_NAME}" name="business_name" />
	<br/>
	</c:if>
	가입일: <fmt:formatDate value="${resultMap.REGDATE}" pattern="yy.MM.dd 일 hh:mm" />
	<br/>
	알람상태: ${resultMap.ALARM_CONSENT}
	<br/>
	최근 로그인: <fmt:formatDate value="${resultMap.LATESTLOGIN2}" pattern="yy.MM.dd 일 hh:mm" />
	<br/>
	계정상태: 
	<c:if test="${resultMap.STATUS == '0'}">
	정상
	</c:if>
	<c:if test="${resultMap.STATUS == '1'}">
	게시글 작성 금지
	</c:if>
	<c:if test="${resultMap.STATUS == '2' }">
	로그인 제한
	</c:if>
	<br/>
	<input type="submit" value="정보 수정하기"/>
	<br/>
</form>
 <input type="button" value="탈퇴하기"/>
</div>
<c:if test="${Updated == 'Updated'}">
<script>
alert("수정이 완료되었습니다");
</script>
</c:if>
</body>
</html>

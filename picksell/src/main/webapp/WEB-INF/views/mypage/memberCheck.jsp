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
<title>개인정보 확인 및 수정</title>
</head>
<body>
<script>
function mberValiCheck(){
   var ID = $('#ID').val();
   var PASSWORD = $('#PASSWORD').val();
   var loginForm = document.getElementById("memberCheckForm");
	   
   if(PASSWORD == ""){
	   $('#passwordCheckText').html('<b><font color=red size=2pt> 비밀번호를 입력해주세요. </font></b>');
   		loginForm.PASSWORD.focus();
   	  return false;
   	}
}
function passwordCheck(){
	  $('#passwordCheckText').html('<b><font color=red size=2pt> 입력하신 아이디와 비밀번호가 일치하지 않습니다. </font></b>');
		 loginForm.PASSWORD.focus();
}
</script>
<center>
	<h2>회원정보 확인/수정</h2>
	<h3>정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다</h3>
	<form action="/picksell/mypage/memberCheck" name="memberCheckForm" id="memberCheckForm" method="post" onsubmit="return mberValiCheck()">
		<p>아이디 : ${sessionId}
		<p>비밀번호 <input type="password" name="PASSWORD" id="PASSWORD" value="${cookiePW}"/>&nbsp;<span id="passwordCheckText"></span>
		<P><input type="submit" value="확인" />
		<input type="button" value="취소" onclick="history.back()"/></P>
	</form>
</center>

<c:if test="${resultPW == 'WRONG'}">
	<script>
	 passwordCheck();
   </script>
</c:if>

</body>
</html>

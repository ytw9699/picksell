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
<style>
.next {
    width: 50%;
    margin: 0 auto;
    margin-left: 0%;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 4%;
    font-size: 14px;
}
.bigdiv {
    width: 100%;
    height: 200px;
    
}
.signup-top-instr{
	width: 100%
}

.information {
    font-size: 19px;
    padding: 1px;
    margin: 1px;
    width: 50%;
    margin: 0%;
    text-align: right;
    height: 29px;
    padding-right: 0px;
}
.information2 {
    font-size: 20px;
    padding: 1px;
    margin: 1px;
    width: 50%;
    margin: 0%;
    height: 20px;
    padding-left: 10px;
}
.information3 {
    font-size: 20px;
    padding: 1px;
    margin: 1px;
    width: 275px;
    margin: 11%;
    height: 60px;
}
.information4 {
    line-height: 65px;
    font-size: 20px;
    padding: 1px;
    margin: 1px;
    width: 101px;
    margin: 0%;
    height: 26px;
}
.tableClass {
    margin: 0 auto;
    margin-top: 110px;
    width: 50%;
}

</style>
</head>
<body>
<script>
function mberValiCheck(){
   var ID = $('#ID').val();
   var PASSWORD = $('#PASSWORD').val();
   var loginForm = document.getElementById("memberCheckForm");
	   
   if(PASSWORD == ""){
	   $('#passwordCheckText').html('비밀번호를 입력해주세요.');
   		loginForm.PASSWORD.focus();
   	  return false;
   	}
}
function passwordCheck(){
	  $('#passwordCheckText').html('입력하신 아이디와 비밀번호가 일치하지 않습니다.');
		 loginForm.PASSWORD.focus();
}
</script>
	
	<form action="/picksell/mypage/memberCheck" name="memberCheckForm" id="memberCheckForm" method="post" onsubmit="return mberValiCheck()">
	<div class="bigdiv">
	<table class="tableClass" style="width: 50%;" cellspacing="0" cellpadding="0">
	<tr>
	<td class="signup-top-instr" colspan="3">*정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</td>
	</tr>
	<tr>
	<td class="information">아이디</td>
	<td class="information2" colspan="2" >${sessionId}</td>
	</tr>
	<tr>
	<td class="information">비밀번호</td>
	<td class="information2"><input type="password" class="information4" name="PASSWORD" id="PASSWORD" value="${cookiePW}"/>&nbsp;</td>
	<td class="information3" id="passwordCheckText"></td>
	</tr>
	<tr>
	<td class="information"><input type="submit" value="확인" class="next"/></td>
	<td class="information2" colspan="2" ><input type="button" value="취소" class="next" onclick="history.back()"/></td>
	</tr>
	</table>
	</div>
	</form>
<c:if test="${resultPW == 'WRONG'}">
	<script>
	 passwordCheck();
   </script>
</c:if>

</body>
</html>

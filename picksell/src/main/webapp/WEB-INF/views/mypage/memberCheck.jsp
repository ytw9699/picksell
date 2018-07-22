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
    width: 123px;
    margin: 0 auto;
    margin-left: 0%;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 8%;
    font-size: 14px;
}
.bigdiv {
    width: 50%;
    height: 200px;
}
.signup-top-instr{
   margin: 1%;
}

.information {
    font-size: 19px;
    padding: 1px;
    margin: 1px;
    width: 125px;
    margin: 0%;
    text-align: center;
    height: 29px;
}
.information2 {
    font-size: 20px;
    padding: 1px;
    margin: 1px;
    width: 124px;
    margin: 0%;
    height: 29px;
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

</style>
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
<div class="signup-top-instr">*선택정보는 입력하지 않아도 아래 완료 버튼을 통해 가입하실 수 있습니다</div>	
	<form action="/picksell/mypage/memberCheck" name="memberCheckForm" id="memberCheckForm" method="post" onsubmit="return mberValiCheck()">
	<div class="bigdiv">
	<table>
	<tr>
	<td class="information">아이디:</td>
	<td class="information2">${sessionId}</td>
	</tr>
	<tr>
	<td class="information">비밀번호</td>
	<td class="information2"><input type="password" class="information4" name="PASSWORD" id="PASSWORD" value="${cookiePW}"/>&nbsp;</td>
	<td class="information3"><div id="passwordCheckText"></div></td>
	</tr>
	<tr>
	<td class="information"><input type="submit" value="확인" class="next"/></td>
	<td class="information2"><input type="button" value="취소" class="next" onclick="history.back()"/></td>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인1</title>
</head>
<body>
<script>
function mberValiCheck(resultID){//2.밸리데이터를 했을때 아이디와 비밀번호가 밀리지않게끔 못할까?
   var ID = document.getElementById("ID").value;
   var PASSWORD = document.getElementById("PASSWORD").value;
   
   var loginForm = document.getElementById("loginForm");
	
   if(ID != ""){
		 document.getElementById("userIdCheckText").innerHTML = ""
	   }
   
   if(PASSWORD != ""){
		 document.getElementById("passwordCheckText").innerHTML = ""
	   }
	   
   if(ID == ""){
      document.getElementById("userIdCheckText").innerHTML = 
    	  "<b><font color=red size=2pt> 아이디를 입력해주세요. </font></b>"
    	   // loginForm.ID.focus();
    	  
   if(PASSWORD == ""){
   	  document.getElementById("passwordCheckText").innerHTML = 
   		  "<b><font color = red size=2pt> 비밀번호를 입력해주세요. </font></b>"
   	  return false;
   	 }
      return false;
   }
   
   if( PASSWORD == ""){//이부분 중복을 어떻게 제거할수있을까?
	   document.getElementById("passwordCheckText").innerHTML = 
		   "<b><font color = red size=2pt> 비밀번호를 입력해주세요. </font></b>"
 	return false;
   }
}

function IdCheck(){
	 document.getElementById("userIdCheckText").innerHTML = 
   	  "<b><font color=red size=2pt> 입력하신 아이디가 존재하지 않습니다. </font></b>"
		   loginForm.ID.focus();
}
function passwordCheck(){
	 document.getElementById("passwordCheckText").innerHTML = 
  	  "<b><font color=red size=2pt> 입력하신 아이디와 비밀번호가 일치하지 않습니다. </font></b>"
		 loginForm.PASSWORD.focus();
}
function idSaveCheck(){
	 var idSave = document.getElementById('idSave');
	 idSave.checked="checked";
}	
</script>
<!-- function mberValiCheck(){//1. 왜 이로직은 안될까? 
	userIdCheck();
	passwordCheck();
}
function passwordCheck(){
	 var password = document.getElementById("password").value;
	
	 if( password == ""){
		   document.getElementById("passwordCheckText").innerHTML = "<b><font color = red size=2pt> 비밀번호를 입력해주세요. </font></b>"
	 	return false;
	   }
	 
}
function userIdCheck(){
	   var userId = document.getElementById("userId").value;

	   if(userId == ""){
	      document.getElementById("userIdCheckText").innerHTML = "<b><font color=red size=2pt> 아이디를 입력해주세요. </font></b>"
	      return false;
	   }
	   
	} -->
<center>
	로그인 하기
	<form action="login" name="loginForm" method="post" onsubmit="return mberValiCheck('${resultID}')">
		<p>아이디 <input type="text" name="ID" id="ID" value="${cookieID}"/>&nbsp;<span id="userIdCheckText"></span>
		<p>비밀번호 <input type="password" name="PASSWORD" id="PASSWORD"/>&nbsp;<span id="passwordCheckText"></span>
		<p><input type="checkbox" name="idSave" value= "save" id="idSave"/>아이디 저장
		<input type="submit" value="로그인" />
		<P>계정을 잊어버리셨나요?</P>
	</form>
</center>
<c:if test="${resultID != null}">
	<script>
	 IdCheck();
   </script>
</c:if>
<c:if test="${resultID2 != null}">
	<script>
	 passwordCheck();
   </script>
</c:if>
<c:if test="${cookieID != null}">
	<script>
	idSaveCheck();
   </script>
</c:if>
</body>
</html>

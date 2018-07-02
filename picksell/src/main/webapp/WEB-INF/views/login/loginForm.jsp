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
<title>로그인1</title>
</head>
<body>
<script>
function mberValiCheck(resultID){//2.밸리데이터를 했을때 아이디와 비밀번호가 밀리지않게끔 못할까?
   var ID = $('#ID').val();
   var PASSWORD = $('#PASSWORD').val();
   var loginForm = document.getElementById("loginForm");//$('#loginForm');이거는 왜안되는지..
	
   if(ID != ""){
	   $('#userIdCheckText').html('');
   }
	   
   if(PASSWORD != ""){
	   $('#passwordCheckText').html('');
	   }
	   
   if(ID == ""){
  	   $('#userIdCheckText').html('<b><font color=red size=2pt> 아이디를 입력해주세요. </font></b>');
  	  loginForm.ID.focus();
  	  
    	  
   if(PASSWORD == ""){
	   $('#passwordCheckText').html('<b><font color=red size=2pt> 비밀번호를 입력해주세요. </font></b>');
   		if(ID == ""){
   		 loginForm.ID.focus();
   		}else{
   		loginForm.PASSWORD.focus();
   		}
   	  return false;
   	 }
      return false;
   }
   if( PASSWORD == ""){//이부분 중복을 어떻게 제거할수있을까?
	   $('#passwordCheckText').html('<b><font color=red size=2pt> 비밀번호를 입력해주세요. </font></b>');
		   loginForm.PASSWORD.focus();
 	return false;
   }
}

function IdCheck(){
	$('#userIdCheckText').html('<b><font color=red size=2pt> 입력하신 아이디가 존재하지 않습니다. </font></b>');
		   loginForm.ID.focus();
}
function passwordCheck(){
	  $('#passwordCheckText').html('<b><font color=red size=2pt> 입력하신 아이디와 비밀번호가 일치하지 않습니다. </font></b>');
		 loginForm.PASSWORD.focus();
}
function idSaveCheck(){
	 var idSave = document.getElementById('idSave');
	 idSave.checked="checked";
}	
function formIdSave(){
	 var formID = document.getElementById('formID');
	 var ID = document.getElementById('ID');
	 ID.value = formID.value;//아이디나 비밀번호를 잘못입력했어도 아이디는! 폼값에 저장되게끔
}	
</script>
<center>
	로그인 하기
	<form action="login" name="loginForm" id="loginForm" method="post" onsubmit="return mberValiCheck('${resultID}')">
	     <input type="hidden" name=formID id="formID" value="${formID}"/>
		<p>아이디 <input type="text" name="ID" id="ID" value="${cookieID}"/>&nbsp;<span id="userIdCheckText"></span>
		<p>비밀번호 <input type="password" name="PASSWORD" id="PASSWORD" value="${cookiePW}"/>&nbsp;<span id="passwordCheckText"></span>
		<p><input type="checkbox" name="idSave" id="idSave" value="save" />아이디/비밀번호 유지
		<P><input type="submit" value="로그인" /></P>
		<p><a href="#">아이디/비밀번호 찾기</a></p>
	</form>
</center>
<c:if test="${formID != null}">
	<script>
	formIdSave();
	//formIdSave(${formID});//이렇게 넣어주는 방법 없나..?
   </script>
</c:if>
<c:if test="${resultID == 'NULL'}">
	<script>
	 IdCheck();
   </script>
</c:if>
<c:if test="${resultPW == 'WRONG'}">
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

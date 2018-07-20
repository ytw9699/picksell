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
</head>
<Script>
function passwordsCheck(){
	var NewPassword = $('#passwordOne').val();
	var rePassword = $('#passwordTwo').val();

	if(NewPassword === rePassword){
		 $('#Innerpassword').html('<b><font color = green size =2pt>비밀번호가 일치합니다. </font><b>');
		 return true;
	}
	else if(NewPassword !== rePassword){//
		 $('#Innerpassword').html('<b><font color = red size =2pt> 비밀번호가 일치하지 않습니다. </font><b>');
		 return false;
	}
	}
	
function passwordsvali(){
	
if(document.insertRePs.password1.value == ''){
	alert('비밀번호를 입력하세요');
	document.insertRePs.password1.focus();
	 return false;
	 passwordsCheck();
}
if(document.insertRePs.password2.value == ''){
	alert('비밀번호를 재입력하세요');
	document.insertRePs.password1.focus();
	 return false;
	 passwordsCheck();
}
var NewPassword = $('#passwordOne').val();
var rePassword = $('#passwordTwo').val();

if(NewPassword === rePassword){
	 $('#Innerpassword').html('<b><font color = green size =2pt>비밀번호가 일치합니다. </font><b>');
	 return true;
}
else if(NewPassword !== rePassword){//
	 $('#Innerpassword').html('<b><font color = red size =2pt> 비밀번호가 일치하지 않습니다. </font><b>');
	 return false;
}
}

</Script>
<body>
<form action="/picksell/insertRePs" name="insertRePs" method="post" onsubmit ="return passwordsvali()">
	아이디:${paramMap.id}
	<br>
	<input type="hidden" name="id" value="${paramMap.id}"/>
	<input type="hidden" name="email" value="${paramMap.email}"/>
	<input type="hidden" name="name" value="${paramMap.name}"/>
        신규 비밀번호:<input type="password" name="password1" id="passwordOne" onkeyup="passwordsCheck()" />
    <br/>
	비밀번호 다시 입력:<input type="password" name="password2" id="passwordTwo" onkeyup="passwordsCheck()"/>&nbsp;<span id="Innerpassword"></span>
	<br/>
	<input type="submit" value="비밀번호 새로 변경"/>
</form>

</body>
</html>

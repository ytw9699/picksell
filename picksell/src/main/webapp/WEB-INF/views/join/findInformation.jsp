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
<title></title>
</head>
<body>
<script>
/* 다시 리팩토링
 function findCommon(paramObject){
	if(document.paramObject.findId.name.value == ''){
		alert('이름을 입력하세요');
		document.paramObject.id.focus();
		return false;
	}
	else if(document.paramObject.email.value == ''){
		alert('이메일을 입력하세요');
		document.paramObject.password.focus();
		return false;
	}
} */
function findIdvali(){
	if(document.findId.email.value == ''){
		alert('이메일을 입력하세요');
		document.findId.email.focus();
		return false;
	}
	else  if(document.findId.name.value == ''){
		alert('이름을 입력하세요');
		document.findId.name.focus();
		return false;
	}
	return true;
}
function findPsvali(){
	if(document.findPassword.id.value == ''){
		alert('아이디를 입력하세요');
		document.findPassword.id.focus();
		return false;
	}
	else if(document.findPassword.name.value == ''){
		alert('이름을 입력하세요');
		document.findPassword.name.focus();
		return false;
	}
	else if(document.findPassword.email.value == ''){
		alert('이메일을 입력하세요');
		document.findPassword.email.focus();
		return false;
	}
	alert("입력하신 이메일로 비밀번호 재설정 URL을 전송하였습니다");
	return true;
}
</script>
<div><h3>아이디찾기</h3></div>
<div><h3>입력한 이메일과 이름으로 아이디를 찾습니다</h3></div>
<form action="join/findId" name="findId"  method="post" onsubmit="return findIdvali()">
<p><input type="text" name="email" placeholder="이메일을 입력해주세요" />
<p><input type="text" name="name" placeholder="이름을 입력해주세요" />
<input type="submit" value="찾기" />
</form>

<div><h3>비밀번호찾기</h3></div>
<div><h3>입력한 이메일로 비밀번호 재설정 URL이 전송됩니다</h3></div>
<form action="join/findPassword" name="findPassword" method="post" onsubmit="return findPsvali()">
<p><input type="text" name="id" placeholder="아이디를 입력해주세요" />
<p><input type="text" name="email" placeholder="이메일을 입력해주세요" />
<p><input type="text" name="name" placeholder="이름을 입력해주세요" />
<input type="submit" value="이메일로 URL 전송" />
</form> 
</body>
</html>
















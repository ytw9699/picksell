<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<script>
function findIdvali(){
	if(document.findingId.email.value == ''){
		alert('이메일을 입력하세요');
		document.findingId.email.focus();
		return false;
	}
	else if(document.findingId.name.value == ''){
		alert('이름을 입력하세요');
		document.findingId.name.focus();
		return false;
	}
	return true;
}
function findPsvali(){
	if(document.findingPs.id.value == ''){
		alert('아이디를 입력하세요');
		document.findingPs.id.focus();
	}
	else if(document.findingPs.name.value == ''){
		alert('이름을 입력하세요');
		document.findingPs.name.focus();
	}
	else if(document.findingPs.email.value == ''){
		alert('이메일을 입력하세요');
		document.findingPs.email.focus();
	}
}

function findPss(){
	findPsvali();
	
	var email = document.findingPs.email.value
	var name = document.findingPs.name.value
	var id = document.findingPs.id.value
	
	if(email != "" && name != "" && id != ""){
	var allData ="email="+email+"&name="+name+"&id="+id;
	$.ajax({
		type : "GET",
		url : "/picksell/join/findPassword",
		dataType : 'json',
		data : allData,
		success : function(data){
			alert("입력하신 이메일로 비밀번호 재설정 URL을 전송하였습니다");
		}
	});
	}
} 
</script>

<div><h3>아이디찾기</h3></div>
<div><h3>입력한 이메일과 이름으로 아이디를 찾습니다</h3></div>
<form action="join/findId" name="findingId" method="GET" onsubmit="return findIdvali()">
	<p>이메일: <input type="text" name="email" placeholder="이메일을 입력해주세요" />
	<p>이름: <input type="text" name="name" placeholder="이름을 입력해주세요" />
	<input type="submit" value="찾기" />
</form>

<div><h3>비밀번호찾기</h3></div>
<div><h3>입력한 이메일로 비밀번호 재설정 URL이 전송됩니다. 잠시 기다려주세요</h3></div>
<form name="findingPs" method="GET">
	<p>아이디: <input type="text" name="id" placeholder="아이디를 입력해주세요" />
	<p>이름:  <input type="text" name="name" placeholder="이름을 입력해주세요" />
	<p>이메일: <input type="text" name="email" placeholder="이메일을 입력해주세요" />
	<input type="button" value="url전송" onclick="findPss();" />
</form>

</body>
</html>

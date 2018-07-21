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
function emailAuth(){
	//alert(document.commonForm.email.value);
	var url="emailAuth?email="+document.commonForm.email.value;
	var reg=document.commonForm;
	
	if(reg.email.value==""){
		alert("이메일을 입력해주세요");
		reg.email.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}

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

function check(){
	if(document.commonForm.id.value == ''){
		alert('아이디를 입력하세요');
		document.commonForm.id.focus();
		return false;
	}
	else if(document.commonForm.name.value == ''){
		alert('이름을 입력하세요');
		document.commonForm.name.focus();
		return false;
	}
	else if(document.commonForm.email.value == ''){
		alert('이메일을 입력하세요');
		document.commonForm.email.focus();
		return false;
	}
	else if(document.commonForm.password1.value == ''){
		alert('새로운 비밀번호를 입력하세요');
		document.commonForm.password1.focus();
		return false;
	}
	else if(document.commonForm.password2.value == ''){
		alert('비밀번호를 다시 입력하세요');
		document.commonForm.password2.focus();
		return false;
	}
	else if(document.commonForm.mailCheck.value != '인증완료'){
		alert('이메일 인증을 해주세요') 
		document.commonForm.email.focus();
		return false;
	}
	else if(document.commonForm.email.value != document.commonForm.email2.value){
		alert('인증한 이메일을 입력하세요')
		document.commonForm.email.focus();
		return false;
	
	}else if(document.commonForm.password1.value != document.commonForm.password2.value){
		alert('비밀번호가 일치하지 않습니다')
		document.commonForm.password2.focus();
		return false;
	}else
	 	//alert('비밀번호를 변경하였습니다');
		return true;
}
/* function findPss(){
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
}  */

</script>

<div><h3>비밀번호 재설정</h3></div>
<div><h3>이메일 인증후  비밀번호를 재설정 해주세요.</h3></div>
<form action="/picksell/resetPassword" name="commonForm" method="POST" onsubmit="return check()">
	<p>아이디: <input type="text" name="id" />
	<p>이름:  <input type="text" name="name"  />
	<p>이메일: <input type="text" name="email"  />
	<input type="hidden" name="email2" id="email2"/>
	<input type="button" onclick="emailAuth()" value="본인 인증"/>
	<input type="text" name="mailCheck" placeholder="인증을 해주세요" readonly/>
	<p>새로운 비밀번호:<input type="password" name="password1" id="passwordOne" onkeyup="passwordsCheck()" />
	<p>비밀번호 다시 입력:<input type="password" name="password2" id="passwordTwo" onkeyup="passwordsCheck()"/>&nbsp;<span id="Innerpassword"></span>
	<p><input type="submit" value="재설정" />
</form>

<c:if test="${resetFail != null}">
	<script>
	alert("해당하는 정보가 없어 비밀번호 변경에 실패하였습니다.입력정보를 다시 확인해주세요.");
   </script> 
</c:if>
</body>
</html>

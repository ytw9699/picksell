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
<style>
.good {
    width: 126px;
    height: 30px;
    margin-bottom: 5px;
    color: #fff;
    background-color: #7151FC;
    border-color: #7151FC;
    border-radius: 7px;
}
}
.button22{
    width: 32%;
    height: 30px;
    margin: 0px;
    border: none;
    color: white;
    background-color: #7151FC;
    padding: 2px;
    font-size: 15px;
    border-radius: 10px;
    /* display: inline-block; */
    /* float: left; */
}

.bigdiv {
    width: 100%;
    height: 200px;
    
}
.button2{
	    height: 35px;
}
}
.mp-container {
    display: inline-block;
    /* margin: 0 0 0px 0px; */
    width: 880px;
}
.row {
    margin-left: -10px;
    margin-right: -10px;
}
.col-sm-offset-3 {
    margin-left: 15%;
}
.confirm-auth-box {
    /*  border: 1px solid #d8d8d8; */
    border-radius: 5px; 
    margin-top: 63px;
    margin-right: 243px;
}
.confirm-auth-box h3 {
    color: #7151FC;
    border-bottom: 2px solid #ececec;
    padding: 15px 0 15px 20px;
    font-size: 26px;
    margin: 0;
}
.confirm-auth-box-content {
    padding: 20px; 
    width: 48%;
}
.confirm-auth-desc {
    font-size: 17px;
    color: #191919;
    padding-bottom: 35px;
    width: 119%;
}
/* * {
    box-sizing: border-box;
} */
.alert {
    padding: 10px;
    margin-top: 23px;
    color: #7151fc;
}
.confirm-auth-input {
    height: 46px;
    border: 1px solid gray;
    display: block;
    width: 109%;
    height: 55px;
    font-size: 15px;
    padding-left: 11px;
    box-sizing: border-box;
    border-radius: 9px;
}
.form-group {
    margin-bottom: 3px;
    width: 80%;
    height: 61px;
}
.form-group2 {
    margin-bottom: 3px;
    width: 80%;
    height: 61px;
}
.confirm-auth-btn {
    margin-top: 10px;
}
.btn-primary {
    color: #fff;
    background-color: #7151FC;
    border-color: #7151FC;
    width: 83%;
    /* margin-top: 10px; */
    height: 56px;
    padding: 16px 60px;
    font-size: 16px;
    line-height: 1.33;
    border-radius: 9px;
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    user-select: none;
    }
.mailcheck {
   border: 0px solid white;
   }
</style>
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
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600,height=400");
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
</script>

<div class="mp-container">
	<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
	<div class="confirm-auth-box">
	<h3>비밀번호 재설정</h3>
	<div class="confirm-auth-box-content">
		 <div class="confirm-auth-desc">
		  이메일 인증후  비밀번호를 재설정 해주세요.
		 </div>
	<div></div>
	  <form action="/picksell/resetPassword" name="commonForm" method="POST" onsubmit="return check()">
	  <input type="hidden" name="email2" id="email2"/>
	   <div class="form-group">
	  	  <input type="text" name="name" class="confirm-auth-input" placeholder="이름을 입력해주세요" />
	  </div>
	  <div class="form-group">
	  	 <input type="text" name="id" class="confirm-auth-input" placeholder="아이디를 입력해주세요" />
	  </div>
	  <div class="form-group">
	  	 <input type="text" name="email" class="confirm-auth-input" placeholder="이메일을 입력해주세요" />
	  </div>
	  <div class="button2">
	  <input type="button" onclick="emailAuth()" class="good" value="본인 인증"/>
	  <input type="text" class="mailcheck" name="mailCheck" placeholder="인증을 해주세요" readonly/>
	  </div>
	  <div class="form-group">
		  <input type="password" name="password1" id="passwordOne" onkeyup="passwordsCheck()" class="confirm-auth-input" placeholder="새로운 비밀번호를 입력해주세요"/>
	  </div>
	  <div class="form-group">
	  	<input type="password" name="password2" id="passwordTwo" class="confirm-auth-input" onkeyup="passwordsCheck()" placeholder="비밀번호를 다시 입력해주세요"/>&nbsp;
	  	<span id="Innerpassword"></span>
	  </div>
	  <div class="form-group2">
	 <input type="submit"  class="btn-primary" value="재설정" />
	  </div>
	   </form>
	 	   <div id="passwordCheckText" class="alert alert-danger">
		  </div>
	  </div></div></div></div></div>
<div><h3></h3></div>

<c:if test="${resetFail != null}">
	<script>
	alert("해당하는 정보가 없어 비밀번호 변경에 실패하였습니다.입력정보를 다시 확인해주세요.");
   </script> 
</c:if>

</body>
</html>

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
.bigdiv {
    width: 100%;
    height: 200px;
    
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
    width: 104%;
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
    width: 83%;
    height: 55px;
    border-radius: 9px;
    outline: none;
    padding-left: 10px;
    box-sizing: border-box;
}
.form-group {
    margin-bottom: 3px;
    width: 80%;
    height: 50px;
}
.confirm-auth-btn {
    margin-top: 10px;
}
.btn-primary {
    color: #fff;
    background-color: #7151FC;
    border-color: #7151FC;
    width: 83%;
    margin-top: 10px;
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
	<div class="mp-container">
	<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
	<div class="confirm-auth-box">
	<h3>회원정보 확인</h3>
	<div class="confirm-auth-box-content">
		 <div class="confirm-auth-desc">${sessionId} 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.
		 </div>
	<div></div>
	  <form action="/picksell/mypage/memberCheck" name="memberCheckForm" id="memberCheckForm" method="post" onsubmit="return mberValiCheck()">
	  <div class="form-group">
		<input class="confirm-auth-input" placeholder=" 비밀번호를 입력해주세요" name="PASSWORD" id="PASSWORD" type="password">
	  </div>
	  <div class="form-group">
	  <input type="submit" class="btn-primary" value="확인" />
	  </div>
	   </form>
	 	   <div id="passwordCheckText" class="alert alert-danger">
	 	   
		  </div>
	  </div></div></div></div></div>
<c:if test="${resultPW == 'WRONG'}">
	<script>
	 passwordCheck();
   </script>
</c:if>

</body>
</html>

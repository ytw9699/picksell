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
</style>
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
</script>

<div class="mp-container">
	<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
	<div class="confirm-auth-box">
	<h3>아이디 찾기</h3>
	<div class="confirm-auth-box-content">
		 <div class="confirm-auth-desc">
		 입력한 이메일과 이름으로 아이디를 찾습니다.
		 </div>
	<div></div>
	  <form action="findIdResult" name="findingId" method="GET" onsubmit="return findIdvali()">
	  <div class="form-group">
	  	 <input type="text" name="email" class="confirm-auth-input" placeholder="이메일을 입력해주세요" />
	  </div>
	  <div class="form-group">
	  	  <input type="text" name="name" class="confirm-auth-input" placeholder="이름을 입력해주세요" />
	  </div>
	  <div class="form-group2">
	 <input type="submit"  class="btn-primary" value="찾기" />
	  </div>
	   </form>
	 	   <div id="passwordCheckText" class="alert alert-danger">
		  </div>
	  </div></div></div></div></div>
<div><h3></h3></div>
</body>
</html>

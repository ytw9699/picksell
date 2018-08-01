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
<style>
.next {
    width: 12%;
    margin: 0 auto;
    margin-left: 6px;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 15px;
    font-size: 15px;
    border-radius: 9px;
}
.confirm-auth-box { 
    border-radius: 5px;
    margin-top: 80px;
    margin-right: 30px;
}
.confirm-auth-box h3 {
    color: #7151FC;
    border-bottom: 2px solid #ececec;
    padding: 15px 0 15px 20px;
    font-size: 26px;
    margin: 0;
}
.bigbig {
    width: 100%;
    margin-left: -8px;
    margin-top: 55px;
}
.information {
    display: inline-block;
    margin-right: 12px;
    margin-left: -21px;
    width: 11%;
    height: 30px;
    font-size: 19px;
}
.inputclass {
    width: 20%;
    margin: 6px;
    margin-left: -28px;
    border-radius: 9px;
    font-size: 15px;
    height: 49px;
    border: 0.5px solid gray;
    box-sizing: border-box;
    padding-left: 11px;
}
.test8{
    margin: 17px;
}
#passwordCheckText {
    width: 20%;
    margin: -10px;
    margin-left: 10px;
    height: 34px;
    line-height: 3;
    display: inline-block;
}
</style>
</head>
<body>
<script>
function mberValiCheck(resultID){
   var ID = $('#ID').val();
   var PASSWORD = $('#PASSWORD').val();
   var loginForm = document.getElementById("loginForm");//$('#loginForm');이거는 왜안되는지..
	
   if(ID != ""){
	   $('#passwordCheckText').html('');
   }
	   
   if(PASSWORD != ""){
	   $('#passwordCheckText').html('');
	   }
	   
   if(ID == ""){
  	   $('#passwordCheckText').html('<b><font color=red size=2pt> 아이디를 입력해주세요. </font></b>');
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
	$('#passwordCheckText').html('<b><font color=red size=2pt> 입력하신 아이디가 존재하지 않습니다. </font></b>');
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
<div class="confirm-auth-box">
	<h3>로그인 하기</h3>
	</div>
	<div class="bigbig">
	<form action="login" name="loginForm" id="loginForm" method="post" onsubmit="return mberValiCheck('${resultID}')">
	     <input type="hidden" name=formID id="formID" value="${formID}"/>
		<div class="information">아이디</div><input type="text" class="inputclass" name="ID" id="ID" value="${cookieID}"/>&nbsp;
		<br>
		<div class="information">비밀번호 </div><input type="password" class="inputclass" name="PASSWORD" id="PASSWORD" value="${cookiePW}"/>&nbsp;
		<div class="test8">
		<input type="checkbox" name="idSave" id="idSave" value="save" />아이디/비밀번호 유지
		</div>
		<div class="test9">
		<input type="submit" class="next" value="로그인" /><input type="button" class="next" value="회원가입" onclick="location.href='/picksell/joinForm'"/>
		</div>
		<div class="test8">
		<span id="userIdCheckText"></span>
		<span id="passwordCheckText"></span>
		</div>
	</form>
	</div>
</center>

<c:if test="${resultNumber == 0}">
	<script>
	alert("해당하는 아이디가 없습니다.")
   </script>
</c:if>

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

<c:if test="${resetSuccess != null}">
	<script>
	alert("비밀번호를 변경하였습니다.")
   </script>
</c:if>

<c:if test="${loginCheck == '2'}">
	<script>
	alert("로그인이 제한된 아이디입니다. 관리자에게 문의해주세요 ")
   </script>
</c:if>
</body>
</html>

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
										<!-- 스프링전반관련된것 커스톰 태그 -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!-- 폼관련된것 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>											
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>PickSell 일반회원 가입</title>
<style>
body{ overflow-x:hidden;}
    #container {
	position: relative;
	left: 0;
	width: 10000px;
	top: 0;
	min-height: 500px;
}
#c1{width:2000px; height:100%; float:left; background-color: white; padding: 25px;}
#c2{width:2000px; height:100%; float:left; background-color: white; padding: 50px;}
#c3{width:2000px; height:100%; float:left; background-color: white; padding: 50px;}
#c4{width:2000px; height:100%; float:left; background-color: white; padding: 50px;}
.contentDiv {
    width: 80%;
}
</style>
</head>
<body>
<script>
function checkbox(){ 
	if(document.getElementById("checkbox").checked ){
	  document.getElementById("c1_next").disabled = false;
	}  else {
	document.getElementById("c1_next").disabled = true;
	}
}
</script>

<div id="container">
<div id="c1">
 	<p>회원가입</p>
	<p> 1.약관동의 2.가입방법선택 3.정보입력</p>
	<input type="checkbox" id="checkbox" name="agree" onchange="checkbox()"/>동의
<p><input type="button" value="다음" id ="c1_next" onclick="Animate2id('#c2','easeInOutExpo'); return false" disabled="disabled" />
</div>
<div id="c2">
 <p>회원가입</p>
 <p> 1.약관동의 2.가입방법선택 3.정보입력</p>
 <p>
 <a href="#">
 <img src="/picksell/resources/img/personalPurchase.png" onclick="Animate2id('#c3','easeInOutExpo'); return false"  >
 </a>
 <a href="/picksell/joinForm">
 <img src="/picksell/resources/img/businessPurchase.png" onclick="Animate2id('#c4','easeInOutExpo'); return false"  >
 </a>
 </p>
<p><input type="button" value="이전" onclick="Animate2id('#c1'); return false" />
</div>
<div id="c3">
  <form method="post">
	<input type="hidden" name="kind" value="0"/>
	<!-- 일반회원0  -->
	<p>회원가입</p>
    <p> 1.약관동의 2.가입방법선택 3.정보입력</p>
	<br/>
	*선택정보는 입력하지 않아도 아래 완료 버튼을 통해 가입하실 수 있습니다		
	<br/>
	<br/>
	 아이디<input type="text" name="id" />
	<br/>
        비밀번호<input type="password" name="password" id="password"  onkeyup="passwordsCheck()" />
    <br/>
	비밀번호 재확인<input type="password" name="passwordCheck" id="passwordCheck" onkeyup="passwordsCheck()" />&nbsp;<span id="passwordCheckText"></span>
	<br/>
	이름<input type="text" name="name" />
	<br/>
	이메일<input type="text" name="email" id="email" /><!--  onkeyup="emailCheck()"/>&nbsp;<span id="emailCheckText"></span> -->
	<br/>
	주소(선택)<input type="text" name="address" />
	<br/>
	계좌번호(선택)<input type="text" name="account" placeholder=" -를 빼고 입력해주세요"/>
	<br/>
	예금주(선택)<input type="text" name="account_name" />
	<br/>
	은행명(선택)<input type="text" name="bank" />
	<br/>
	<input type="submit" value="가입완료"/>
	</form>
<p><input type="button" value="이전" onclick="Animate2id('#c2'); return false" /></p>
</div>
<div id="c4">
  <form method="post">
	<input type="hidden" name="kind" value="1"/>
	<!-- 사업자회원  -->
	<p>회원가입</p>
    <p> 1.약관동의 2.가입방법선택 3.정보입력</p>
	<br/>
	*선택정보는 입력하지 않아도 아래 완료 버튼을 통해 가입하실 수 있습니다		
	<br/>
	<br/>
	 아이디<input type="text" name="id" />
	<br/>
        비밀번호<input type="password" name="password" id="password2"  onkeyup="passwordsCheck2()" />
    <br/>
	비밀번호 재확인<input type="password" name="passwordCheck" id="passwordCheck2" onkeyup="passwordsCheck2()" />&nbsp;<span id="passwordCheckText2"></span>
	<br/>
	이름<input type="text" name="name" />
	<br/>
	이메일<input type="text" name="email" id="email" /><!--  onkeyup="emailCheck()"/>&nbsp;<span id="emailCheckText"></span> -->
	<br/>
	주소(선택)<input type="text" name="address" />
	<br/>
	계좌번호(선택)<input type="text" name="account" placeholder=" -를 빼고 입력해주세요"/>
	<br/>
	예금주(선택)<input type="text" name="account_name" />
	<br/>
	은행명(선택)<input type="text" name="bank" />
	<br/>
	사업자등록번호<input type="text" name="business_number" />
	<br/>
	상호명<input type="text" name="business_name" />
	<br/>
	<input type="submit" value="가입완료"/>
	</form>
<p><input type="button" value="이전" onclick="Animate2id('#c2'); return false" /></p>
</div>
</div>

<script type="text/javascript" src="/picksell/resources/js/jquery.easing.1.3.js"></script>

<script type="text/javascript">

function Animate2id(id,ease){ //the id to animate, the easing type
	var animSpeed=600; //set animation speed
	var $container=$("#container"); //define the container to move
	if(ease){ //check if ease variable is set
		var easeType=ease;
	} else {
    	var easeType="easeOutQuart"; //set default easing type
	}
	//do the animation
    $container.stop().animate({"left": -($(id).position().left)}, animSpeed, easeType);
}


function passwordsCheck(){
	   var password = document.getElementById("password").value;
	   var passwordCheck = document.getElementById("passwordCheck").value;

	   if(passwordCheck == ""){
	      document.getElementById("passwordCheckText").innerHTML = ""
	   } else if (password != passwordCheck) {
	      document.getElementById("passwordCheckText").innerHTML = "<b><font color=red size=2pt> 비밀번호가 다릅니다. </font></b>"
	   } else {
	      document.getElementById("passwordCheckText").innerHTML = "<b><font color=green size=2pt> 비밀번호가 일치합니다. </font></b>"
	   }
	}
	
function passwordsCheck2(){
	   var password2 = document.getElementById("password2").value;
	   var passwordCheck2 = document.getElementById("passwordCheck2").value;

	   if(passwordCheck2 == ""){
	      document.getElementById("passwordCheckText2").innerHTML = ""
	   } else if (password2 != passwordCheck2) {
	      document.getElementById("passwordCheckText2").innerHTML = "<b><font color=red size=2pt> 비밀번호가 다릅니다. </font></b>"
	   } else {
	      document.getElementById("passwordCheckText2").innerHTML = "<b><font color=green size=2pt> 비밀번호가 일치합니다. </font></b>"
	   }
	}

	/* function emailCheck() {		

		var email = document.getElementById("email").value;

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

				if(exptext.test(email) == false){

			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
	document.getElementById("emailCheckText").innerHTML 
	= "<b><font color=red size=2pt> 이 메일형식이 올바르지 않습니다. </font></b>"

			//document.addjoin.email.focus();
		}
	}
*/
</script>
</body>
</html>
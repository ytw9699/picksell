<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
										<!-- 스프링전반관련된것 커스톰 태그 -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<html>											<!-- 폼관련된것 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>PickSell 일반회원 가입</title>
<style>
body{ overflow-x:hidden;}
.profileButtons{background-color: #ddd;
	border: none;
    width: 50%;
    margin: 0 auto;
    text-align: center;
    font-size: 17px;
    margin-top: 15px;
    padding: 5px;
    border-radius: 8px;}
    
    #container {
	/* background-color: red; */
	position: relative;
	left: 0;
	width: 10000px;
	top: 0;
	min-height: 500px;
}
#c1{width:1200px; height:100%; float:left; background-color: white; padding: 25px;}
#c2{width:1200px; height:100%; float:left; background-color: white; padding: 50px;}
#c3{width:1200px; height:100%; float:left; background-color: white; padding: 50px;}
.contentDiv {
    width: 80%;
}
</style>
</head>
<body>

<div id="container">
<div id="c1">
 <form method="post">
<input type="hidden" name="kind" value="0"/>
	<!-- 일반회원0  -->
	회원가입
	<br/>
	<br/>
	1.약관동의 2.가입방법선택 3.정보입력
	<br/>
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
<a href="#" onClick="Animate2id('#c2','easeInOutExpo'); return false">다음</a>
<p><input type="button" value="뒤로" onclick="Animate2id('#c1'); return false" class="c2_cancel" />
</div>
<div id="c2">
 <form method="post">
<input type="hidden" name="kind" value="0"/>
	<!-- 일반회원0  -->
	회원가입
	<br/>
	<br/>
	1.약관동의 2.가입방법선택 3.정보입력
	<br/>
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
<a href="#" onClick="Animate2id('#c3','easeInOutExpo'); return false">다음</a>
<p><input type="button" value="뒤로" onclick="Animate2id('#c1'); return false" class="c2_cancel" />
</div>
<center>
<div id="c3">
  <form method="post">
	<input type="hidden" name="kind" value="0"/>
	<!-- 일반회원0  -->
	회원가입
	<br/>
	<br/>
	1.약관동의 2.가입방법선택 3.정보입력
	<br/>
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
<p><input type="button" value="뒤로" onclick="Animate2id('#c2'); return false" class="c2_cancel" />
</div>
</div>

<script type="text/javascript" src="/picksell/resources/js/jquery.easing.1.3.js"></script>

<script type="text/javascript">

function Animate2id(id,ease){ //the id to animate, the easing type
	var animSpeed=1000; //set animation speed
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
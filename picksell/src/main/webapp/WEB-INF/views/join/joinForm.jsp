<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
										<!-- 스프링전반관련된것 커스톰 태그 -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<html>											<!-- 폼관련된것 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PickSell 일반회원 가입</title>
</head>
<body>

<script type="text/javascript">

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
<center>
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
</body>
</html>
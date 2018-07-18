<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<html>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title></title>
<style>
body{ 
	overflow-x:hidden;
	}
    #container {
	position: relative;
	left: 0;
	width: 10000px;
	top: 0;
	min-height: 500px;
	} 
#c1{width:3000px; height:100%; float:left; background-color: white; padding: 25px;}
#c2{width:3000px; height:100%; float:left; background-color: white; padding: 50px;}
#c3{width:3000px; height:100%; float:left; background-color: white; padding: 50px;}

.contentDiv {
    width: 80%;
}
.nextWrap {
    right: 200px;
    width: 30%;
    margin: 0 auto;
    margin-top: 60px;
}
.next {
    width: 10%;
    margin: 0 auto;
    margin-left: -1050px;
    border: none;
    color: white;
    background-color: #999;
    padding: 15px;
    font-size: 15px;
}

</style>
</head>
<body>
<script>
function openCheckID(u){
	if(u.id.value == ''){
		alert('아이디를 입력하세요!');
		u.id.focus();
		return false;
	}
	url = "checkJoinId?id="+u.id.value;
	open(url,"confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=500");
}

//var step1_nextValue = 0;

function checkBoxes(){
	for(i=0; i < checkbox_form.mycheck.length; i++) {
		if(!checkbox_form.mycheck[i].checked){
			$('#c1_next').attr("disabled","disabled").css('background-color','#999');
			//step1_nextValue = 0;
			return false;
		}
	}
	$('#c1_next').removeAttr("disabled").css('background-color','#7151fc');
}
function check_all(){
	var allBox = document.getElementById('checkbox');
	if(allBox.checked){
		for(i=0; i < checkbox_form.mycheck.length; i++) {
			checkbox_form.mycheck[i].checked = true;
		}
		checkBoxes();
	}
	if(!allBox.checked){
		for(i=0; i < checkbox_form.mycheck.length; i++) {
			checkbox_form.mycheck[i].checked = false;
		}
		checkBoxes();
	}
}

$(document).ready(function(){
	$('.mycheck').on('click',function(){
		checkBoxes();
	});
});

</script>

<div id="container">

<div id="c1">
	<h2> 회원가입 </h2>
	<h3> 1.약관동의 2.가입방법선택 3.정보입력 </h3> 
  <form name='checkbox_form'>
    <input type="checkbox" id="checkbox"  onclick="check_all();"/>모두 동의
<!--     <input type="checkbox" id="checkbox" name="mycheck" onchange="uncheck_all();"/>모두 해제<br> -->
    <input type='checkbox' id="cbox1" class="mycheck" name='mycheck'  />픽셀 이용 약관에 대한 동의(필수)<br>
    <input type='checkbox' id="cbox2" class="mycheck" name='mycheck'  />개인정보 수집 및 이용에 대한 동의(필수)<br>
    <input type='checkbox' id="cbox3" class="mycheck" name='mycheck'  />개인정보 국외 이전에 대한 동의(필수)<br>
    <br>
  </form> 
<div class="nextWrap">
  <input type="button" id="c1_next" class="next" onclick="AnimateForm('#c2','easeInOutExpo'); return false" value="다음" disabled="disabled" />
</div>
			
</div>

<div id="c2">
<h2> 회원가입 </h2>
<h3>1.약관동의 2.가입방법선택 3.정보입력</h3>
 <p>
 <img src="/picksell/resources/img/personalPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','nomal'); return false"  >
 <img src="/picksell/resources/img/businessPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','business'); return false"  >
 </p>
<p>
<div class="nextWrap">
<input type="button" class="next" value="이전" onclick="AnimateForm('#c1'); return false" />
</div>
</p>
</div>

<div id="c3">

  <form method="post" name="joinForm" onsubmit="return check();">
	<input type="hidden" id="kind" name="kind" value="1"/>
	<!-- 기본 사업자회원  -->
	<h2>회원가입</h2>
    <h3> 1.약관동의 2.가입방법선택 3.정보입력 </h3>
	<br/>
	<h3>*선택정보는 입력하지 않아도 아래 완료 버튼을 통해 가입하실 수 있습니다</h3>		
	<br/>
	<br/>
	 아이디<input type="text" name="id" />
	<br/>
    <input type="button" value="중복확인" class="idCheckButton" onclick="openCheckID(this.form);" />
	<br/>
        비밀번호<input type="password" name="password" id="password2"  onkeyup="passwordsCheck2()" />
    <br/>
	비밀번호 재확인<input type="password" name="passwordCheck" id="passwordCheck2" onkeyup="passwordsCheck2()" />&nbsp;<span id="passwordCheckText2"></span>
	<br/>
	이름<input type="text" name="name" />
	<br/>
	이메일<input type="text" name="email" id="email" />
	<br/>
	주소(선택)<input type="text" name="address" />
	<br/>
	계좌번호(선택)<input type="text" name="account" placeholder=" -를 빼고 입력해주세요"/>
	<br/>
	예금주(선택)<input type="text" name="account_name" />
	<br/>
	은행명(선택)<input type="text" name="bank" />
	<br/>
	<div id="business">
	사업자등록번호<input type="text" name="business_number" />
	<br/>
	상호명<input type="text" name="business_name" />
	<br/>
	</div>
	<input type="submit" value="가입완료"/>
	</form>
<div class="nextWrap">
<p><input type="button" class="next" value="이전" onclick="AnimateForm('#c2'); return false" /></p>
</div>
</div>
</div>
<script type="text/javascript" src="/picksell/resources/js/jquery.easing.1.3.js"></script>
<script>
function AnimateForm(id,ease,where){ //the id to animate, the easing type
	var animSpeed=600; //set animation speed
	var $container=$("#container"); //define the container to move
	if(ease){ //check if ease variable is set
		var easeType=ease;
	} else {
    	var easeType="easeOutQuart"; //set default easing type
	}
	//do the animation
    $container.stop().animate({"left": -($(id).position().left)}, animSpeed, easeType);
    checkWhere(where);
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
function checkWhere(where){ 
	var check = where;
	var t = document.getElementById('kind');
	
	if(check == 'business'){
		t.setAttribute('value', '1');
		
		$("#business").show();
	}
	if(check == 'nomal'){
		t.setAttribute('value', '0');
		
		$("#business").hide();
	}
}

var idCheckNum = 0;//아이디 중복확인차 필요

function check(){
	
	if(document.joinForm.id.value == ''){
		alert('아이디를 입력하세요');
		document.joinForm.id.focus();
		return false;
	}
	else if(document.joinForm.password.value == ''){
		alert('비밀번호를 입력하세요');
		document.joinForm.password.focus();
		return false;
	}
	else if(document.joinForm.passwordCheck.value == ''){
		alert('비밀번호를 재입력하세요')
		document.joinForm.passwordCheck.focus();
		return false;
	}
	else if(document.joinForm.password.value != document.joinForm.passwordCheck.value){
		alert('비밀번호가 일치하지 않습니다');
		document.joinForm.passwordCheck.focus();
		return false;
	}
	else if(document.joinForm.name.value == ''){
		alert('이름을 입력하세요')
		document.joinForm.name.focus();
		return false;
	}
	else if(document.joinForm.email.value == ''){
		alert('이메일을 입력하세요')
		document.joinForm.email.focus();
		return false;
	}
	else if(idCheckNum == 0){
		alert('아이디 중복확인을 해주세요!');
		document.joinForm.id.focus();
		return false;
	}else
	 	alert('회원가입이 완료되었습니다.로그인 해주세요');
		return true;
}
</script>
</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<html>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title></title>
<style>
}
.bigbig{
    width: 100%;
    margin-left: 69px;
    /* border: 1px solid gray; */
	}
.injeung {
    margin-left: 220px;
    width: 100%;
    height: 6px;
    margin-top: -6px;
}
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
.inputclass {
    width: 19%;
    margin: 6px;
    border-radius: 9px;
    font-size: 15px;
    height: 40px;
    border: 0.5px solid gray;
    box-sizing: border-box;
    padding-left: 11px;
}
.mailCheck {
    width: 176px;
    margin: 10px;
}
#c1{width:3000px; height:100%; float:left; background-color: white; padding: 25px;}
#c2{width:3000px; height:100%; float:left; background-color: white; padding: 50px;}
#c3{width:3000px; height:100%; float:left; background-color: white; padding: 50px;}

.contentDiv {
    width: 80%;
}
.nextWrap {
    display: inline-block;
    right: 200px;
    width: 30%;
    margin: 0;
    margin-top: 39px;
}
.next {
    width: 30%;
    margin: 0;
    border: none;
    color: white;
    background-color: #999;
    padding: 15px;
    font-size: 15px;
}
.pre {
    width: 30%;
    margin: 0;
    border: none;
    color: white;
    background-color: #7151FC;
    padding: 15px;
    font-size: 15px;
}
.pre2 {
    width: 8%;
    height: 30px;
    margin: 0px;
    /* margin-top: -5px; */
    border: none;
    color: white;
    background-color: #7151FC;
    padding: 2px;
    font-size: 15px;
    border-radius: 10px;
    margin-left: -4%;
}
.terms{
overflow-y: scroll;
height: 200px;
width: 40%;
margin-top: 100px;
border: 1px solid #dedede;
}
.terms-btitle{
margin: 48px 0 48px;
text-align: center;
font-size: 18px;
}
#insertColor{
    color: #7151FC;
    border-bottom: 3px solid #7151FC;
}
.signup{
    display: inline-block;
    color: #dbdbdb;
    width: 220px;
    height: 58px;
    padding-top: 19px;
    font-size: 18px;
    line-height: 65px;
    text-align: center;
    border-bottom: 3px solid #dbdbdb;
}
#checkbox_form{  
	margin: 2%;
}
.join {
    margin: 0px 0px 0px;
    font-size: 35px;
    color: #7151FC;
}
.signup-top-instr {
    color: #666666;
    padding-left: 78px;
    margin-bottom: 41px;
    margin-top: 40px;
}
.information {
    /* border: 1px solid gray; */
    display: inline-block;
    margin-right: 0px;
    width: 11%;
    height: 30px;
    font-size: 19px;
}
.mailCheck{
 border: 1px solid white;
}
.checkcheck{
    display: inline-block;
    margin-left: 217px;
    width: 100%;
    margin-top: -3px;
    margin-bottom: 0px;
}
</style>
</head>
<body>
<script>
function emailAuth(commonForm){
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
function openCheckID(u){
	if(u.id.value == ''){
		alert('아이디를 입력하세요!');//
		u.id.focus();
		return false;
	}
	url = "checkJoinId?id="+u.id.value;
	open(url,"confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=500");
}

function checkBoxes(){
	for(i=0; i < checkbox_form.mycheck.length; i++) {
		if(!checkbox_form.mycheck[i].checked){
			$('#c1_next').attr("disabled","disabled").css('background-color','#999');
			return false;
		}
	}
	$('#c1_next').removeAttr("disabled").css('background-color','#7151fc');
}
function check_all(){
	var allBox = document.getElementById('checkbox');
	var cbox4 = document.getElementById('cbox4');
	
	if(allBox.checked){
		for(i=0; i < checkbox_form.mycheck.length; i++) {
			checkbox_form.mycheck[i].checked = true;
			cbox4.checked = true; 
		}
		checkBoxes();
	}
	if(!allBox.checked){
		for(i=0; i < checkbox_form.mycheck.length; i++) {
			checkbox_form.mycheck[i].checked = false;
			cbox4.checked = false; 
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

<div id="c1" class="innerContentWrap">
	<div class="join"> 회원가입 </div>
		<div class="signup" id="insertColor">1. 약관동의</div>
		<div class="signup" >2. 가입 방법 선택</div>
		<div class="signup" >3. 정보 입력</div>
		
  <form name='checkbox_form' id="checkbox_form">
    <input type="checkbox" id="checkbox"  onclick="check_all();"/>모두 동의
    <input type='checkbox' id="cbox1" class="mycheck" name='mycheck'  />픽셀 이용 약관에 대한 동의(필수)<br>
    <input type='checkbox' id="cbox2" class="mycheck" name='mycheck'  />개인정보 수집 및 이용에 대한 동의(필수)<br>
    <input type='checkbox' id="cbox3" class="mycheck" name='mycheck'  />개인정보 국외 이전에 대한 동의(필수)<br>
    <input type='checkbox' id="cbox4" />세일 정보 푸시 알림 동의 (선택)<br>
    <br>
  </form>  
  
<!-- 이용약관 1부분 -->
<div class="terms">
<div class="terms-btitle">이용약관</div>
<div class="terms-mtitle">제 1 장  총 칙</div>
<div class="terms-stitle">제 1 조 (목적)</div>
<div class="indent-l1">
<p>이 약관은 번개장터 주식회사(이하 "회사"라 합니다)가 운영, 제공하는 셀잇 및 관련 제반 서비스(이하 "서비스")의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p></div><div class="terms-stitle">제 2 조 (용어의 정의)</div><div class="indent-l1"><p>이 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 용어에 대한 해석은 관계 법령과 회사의 이용약관 및 개인정보취급방침, 회사가 별도로 정한 지침 등의 상관례에 의합니다.</p><p>"서비스"라 함은 회사가 웹과 모바일 환경에서 제공하는 셀잇 서비스 및 관련 제반 서비스를 말합니다.</p><p>"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.</p><p>"판매자"라 함은 "서비스"에 본인의 재화 및 용역(이하"아이템"이라함) 을 등록하여 판매하거나 또는 제공할 의사로 서비스를 이용하는 자를 말합니다.</p><p>"아이디"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 설정한 전화번호를 말합니다.</p><p>"비밀번호"라 함은 "회원"이 부여받은 "아이디"와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.</p><p>"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함), 통계자료 및 제반 서비스를 의미합니다.</p><p>"크레딧"이라 함은 "서비스"의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.</p><p>"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 문자, 음성, 음향, 화상, 동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.</p><p>"장소정보"라 함은 모바일 단말기의 WPS(WiFi Positioning System), GPS 기반으로 추출된 좌표를 이용하여 "회사" 또는 "회원"이 생성한 지점의 정보를 의미합니다.</p><p>"애플리케이션"이라 함은 모바일 단말기에서 "서비스"를 설치하여 이용할 수 있도록 구성된 프로그램을 말합니다.</p><p>"개인정보"라 함은 '정보통신망 이용촉진 및 정보보호에 관한 법률'(이하 "정보통신망법") 제2조 제1항 제6호 '개인정보'를 말합니다.</p><p>"회원정보"라 함은 제13항과 제14항의 정보를 통칭합니다.</p></div><div class="terms-stitle">제 3 조 (약관의 명시, 효력 및 변경)</div><div class="indent-l1"><p>"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.</p><p>"회사"는 '약관의 규제에 관한 법률'(이하 "약관법"), ‘전자상거래 등에서의 소비자보호에 관한 법률(이하 "전자상거래법")’, ‘정보통신망법’ 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p><p>"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 공지합니다. 다만, "회원"에게 불리한 내용으로 약관을 개정하는 경우에는 그 적용일자 30일 전부터 공지 외에 "회원정보"에 등록된 이메일 등 전자적 수단을 통해 별도로 명확히 통지하도록 합니다.</p><p>"회사"가 전항에 따라 "회원"에게 통지하면서 공지 기간 이내에 거부의사를 표시하지 않으면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 회원이 명시적으로 거부의사를 밝히지 않거나, "서비스"를 이용할 경우에는 "회원"이 개정약관에 동의한 것으로 봅니다.</p><p>"회원"이 개정약관에 동의하지 않는 경우 "회사"는 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 제9조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.</p></div><div class="terms-stitle">제 4 조 (약관의 해석)</div><div class="indent-l1"><p>"회사"는 개별 서비스에 대해서 별도의 이용약관 및 정책(이하 "기타 약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "기타 약관 등"이 우선하여 적용됩니다.</p><p>이 약관에 명시되지 않은 사항은 "위치정보보호법", "약관법", "전자상거래법",공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계 법령 또는 상관례에 따릅니다.</p></div><div class="terms-mtitle">제 2 장  계약의 체결 및 관리</div><div class="terms-stitle">제 5 조 (이용계약의 체결)</div><div class="indent-l1"> <p>이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 후 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.</p></div></div>
<!-- 이용약관 1부분 -->

<!-- 이용약관 2부분 -->
<div class="terms">
<div class="terms-btitle">개인정보 국외 이전 동의</div>
<div>주식회사 셀잇은 안정적인 서비스 제공을 위하여 아마존 웹서버를 이용하고 있으며 이에 사용자의 개인 정보를 국외 서버에 이전할 수 있습니다.</div><ul class="indent-l1"><li><p></p><div><strong>이전받는 자</strong></div><div>Amazon Web Service, Inc</div><p></p></li><li><p></p><div><strong>이전받는 자가 소재하는 국가</strong></div><div>미국</div><p></p></li><li><p></p><div><strong>개인 정보 보호 책임자 연락처</strong></div><div>dhkim@withsellit.com</div><p></p></li><li><p></p><div><strong>이전 받는 자의 개인 정보 이용 목적</strong></div><div>시스템 제공자로써 해당 정보의 단순 저장</div><p></p></li><li><p></p><div><strong>이전하는 개인정보의 항목</strong></div><div>이름, 이메일, 비밀번호, 거래내역, 주소, 계좌정보</div><p></p></li><li><p></p><div><strong>이전 시기 및 이전 방법</strong></div></div>
<!-- 이용약관 2부분 -->

<div class="nextWrap">
  <input type="button" id="c1_next" class="next" onclick="AnimateForm('#c2','easeInOutExpo'); return false" value="다음" disabled="disabled" />
</div>
</div>


<div id="c2" class="innerContentWrap">
<div class="join"> 회원가입 </div>
	<div class="signup">1. 약관동의</div>
	<div class="signup" id="insertColor">2. 가입 방법 선택</div>
	<div class="signup">3. 정보 입력</div>
 <p>
 <img src="/picksell/resources/img/personalPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','nomal'); return false"  >
 <img src="/picksell/resources/img/businessPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','business'); return false"  >
 </p>
<p>
<div class="nextWrap">
<input type="button" class="pre" value="이전" onclick="AnimateForm('#c1'); return false" />
</div>
</div>

<div id="c3" class="innerContentWrap">

  <form method="post" name="commonForm" onsubmit="return check();">
	<input type="hidden" id="kind" name="kind" value="1"/>
	<!-- 기본 사업자회원  -->
	<div class="join"> 회원가입 </div>
		<div class="signup">1. 약관동의</div>
		<div class="signup" >2. 가입 방법 선택</div>
		<div class="signup" id="insertColor">3. 정보 입력</div>
	<br/>
	<div class="signup-top-instr">*선택정보는 입력하지 않아도 아래 완료 버튼을 통해 가입하실 수 있습니다</div>	
	<br/>
	<div class="bigbig">
	<div class="information">아이디</div>
	<input type="text" name="id" class="inputclass"/>
	<div class="checkcheck">
    <input type="button" value="중복확인" onclick="openCheckID(this.form);" class="pre2"/>
    </div>
	<br/>
    <div class="information">비밀번호</div>
    <input type="password" name="password" id="password2"  onkeyup="passwordsCheck2()" class="inputclass"/>
    <br/>
    <div class="information">비밀번호 재확인</div>
    <input type="password" name="passwordCheck" id="passwordCheck2" onkeyup="passwordsCheck2()" class="inputclass"/>&nbsp;<span id="passwordCheckText2"></span>
	<br/>
	<div class="information">이름</div>
	<input type="text" name="name" class="inputclass" />
	<br/>
	<div class="information">이메일</div>
	<input type="email" name="email" id="email" class="inputclass"/>
	<div class="injeung">
	<input type="hidden" name="email2" id="email2"/>
	<input type="button" onclick="emailAuth(this.form)" value="본인 인증" class="pre2"/>
	<input type="text" class ="mailCheck" name="mailCheck" placeholder=" 인증을 해주세요." readonly/>
	</div>
	<br/>
	<div class="information">주소(선택)</div>
	<input type="text" name="address" class="inputclass"/>
	<br/>
	<div class="information">핸드폰 번호(선택)</div>
	<input type="text" name="phoneNum" class="inputclass"/>
	<br/>
	<div class="information">계좌번호(선택)</div>
	<input type="text" name="account" class="inputclass"/>
	<br/>
	<div class="information">예금주(선택)</div>
	<input type="text" name="account_name" class="inputclass"/>
	<br/>
	<div class="information">은행명(선택)</div>
	<input type="text" name="bank" class="inputclass"/>
	<br/>
	<div id="business">
	<div class="information">사업자등록번호</div>
	<input type="text" name="business_number" class="inputclass"/>
	<br/>
	<div class="information">상호명</div>
	<input type="text" name="business_name" class="inputclass"/>
	<br/>
	</div>
	</div>
	<div class="nextWrap">
	<input type="button" class="pre" value="이전" onclick="AnimateForm('#c2'); return false" />
	<input type="submit" class="pre" value="가입완료"/>
	</div>
	</form>
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
	for (i = 0; i < document.commonForm.id.value.length; i++) {
        ch = document.commonForm.id.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
            alert("아이디는 소문자와 숫자만 입력가능합니다.");
            document.commonForm.id.focus();
            document.commonForm.id.select();
            return false;
        }
    }
	if(document.commonForm.id.value == ''){
		alert('아이디를 입력하세요');
		document.commonForm.id.focus();
		return false;
	}
	else if (document.commonForm.id.value.length<5 || document.commonForm.id.value.length>12) {
         alert("아이디를 5~12자까지 입력해주세요.");
        document.commonForm.id.focus();
        document.commonForm.id.select();
         return false;
     }
	else if(document.commonForm.password.value == ''){
		alert('비밀번호를 입력하세요');
		document.commonForm.password.focus();
		return false;
	}
	else if(document.commonForm.password.value.length<4 || document.commonForm.password.value.length>13) {
         alert("비밀번호를 4~13자까지 입력해주세요.")
         document.commonForm.password.focus();
         document.commonForm.password.select();
         return false;
     }
	else if(document.commonForm.passwordCheck.value == ''){
		alert('비밀번호를 재입력하세요')
		document.commonForm.passwordCheck.focus();
		return false;
	}
	else if(document.commonForm.password.value != document.commonForm.passwordCheck.value){
		alert('비밀번호가 일치하지 않습니다');
		document.commonForm.passwordCheck.focus();
		return false;
	}
	else if(document.commonForm.name.value == ''){
		alert('이름을 입력하세요')
		document.commonForm.name.focus();
		return false;
	}
	else if(document.commonForm.email.value == ''){
		alert('이메일을 입력하세요')
		document.commonForm.email.focus();
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
	}
	else if(idCheckNum == 0){
		alert('아이디 중복확인을 해주세요!');
		document.commonForm.id.focus();
		return false;
	}else
	 	alert('회원가입이 완료되었습니다.로그인 해주세요');
		return true;
}

$(document).ready(function(){
	
	var currentWindowWidth = document.body.offsetWidth;
	$('.innerContentWrap').css('width', currentWindowWidth);
 });
 
</script>
</body>
</html>
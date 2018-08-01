<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
.path{
    color: #7151FC;
    border-bottom: 2px solid #ececec;
    padding: 15px 0 15px 20px;
    font-size: 15px;
    margin: 0;
}
.next {
    width: 22%;
    margin: 0;
    border: none;
    color: white;
    background-color: #7151FC;
    padding: 9px;
    font-size: 15px;
    height: -1px;
}
.inputt{
    border-radius: 10px;
    padding: 9px;
    margin-left: 3%;
    margin-top: 2%;
}

</style>
<script type="text/javascript">
function windowclose(){
	//opener.document.commonForm.mailCheck.value="인증완료";
	window.close();
}
function check(){
	var form = document.authenform;
	var authNum = ${authNum}; 
	var email2 = '${email}';
	//alert(authNum);
	//alert(email2);
	
	if(!form.authnum.value){
		alert("인증번호를 입력하세요");
		return false;
	}
	if(form.authnum.value!=authNum){
		alert("틀린 인증번호 입니다. 인증번호를 다시 입력해주세요");
		form.authnum.value="";
		return false;
	}
	if(form.authnum.value==authNum){
		alert("인증완료");
		opener.document.commonForm.mailCheck.value="인증완료";
		opener.document.commonForm.email2.value=email2;
		window.close();
	}
}

</script>

<body>

<div class="path">인증 번호 7자리를 입력하세요</div>

<form method="post" name="authenform" onSubmit="return check();">
	<input type="text" name="authnum" class="inputt"><br /><br />
	<input type="submit" value="완료" class="next">
	<input type="button" value="닫기" class="next" onclick="javascript:windowclose();"/></td>
</form>


</body>
</html>
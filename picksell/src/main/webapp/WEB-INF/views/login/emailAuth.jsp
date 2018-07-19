<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<script type="text/javascript">
function windowclose(){
	opener.document.joinForm.mailCheck.value="인증완료";
	window.close();
}
function check(){
	var form = document.authenform;
	var authNum = ${authNum};
	
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
		opener.document.joinForm.mailCheck.value="인증완료";
		window.close();
	}
}

</script>

<body>

<h5>인증 번호 7자리를 입력하세요</h5>

<form method="post" name="authenform" onSubmit="return check();">
	<input type="text" name="authnum"><br /><br />
	<input type="submit" value="완료">
	<input type="button" value="닫기" onclick="javascript:windowclose();"/></td>
</form>


</body>
</html>
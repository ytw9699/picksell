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
	opener.document.joinForm.mailCheck.value="�����Ϸ�";
	window.close();
}
function check(){
	var form = document.authenform;
	var authNum = ${authNum};
	
	if(!form.authnum.value){
		alert("������ȣ�� �Է��ϼ���");
		return false;
	}
	if(form.authnum.value!=authNum){
		alert("Ʋ�� ������ȣ �Դϴ�. ������ȣ�� �ٽ� �Է����ּ���");
		form.authnum.value="";
		return false;
	}
	if(form.authnum.value==authNum){
		alert("�����Ϸ�");
		opener.document.joinForm.mailCheck.value="�����Ϸ�";
		window.close();
	}
}

</script>

<body>

<h5>���� ��ȣ 7�ڸ��� �Է��ϼ���</h5>

<form method="post" name="authenform" onSubmit="return check();">
	<input type="text" name="authnum"><br /><br />
	<input type="submit" value="�Ϸ�">
	<input type="button" value="�ݱ�" onclick="javascript:windowclose();"/></td>
</form>


</body>
</html>
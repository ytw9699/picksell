<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
										<!-- ���������ݰ��õȰ� Ŀ���� �±� -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<html>											<!-- �����õȰ� -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PickSell �Ϲ�ȸ�� ����</title>
</head>
<body>

<script type="text/javascript">

function passwordsCheck(){
	   var password = document.getElementById("password").value;
	   var passwordCheck = document.getElementById("passwordCheck").value;

	   if(passwordCheck == ""){
	      document.getElementById("passwordCheckText").innerHTML = ""
	   } else if (password != passwordCheck) {
	      document.getElementById("passwordCheckText").innerHTML = "<b><font color=red size=2pt> ��й�ȣ�� �ٸ��ϴ�. </font></b>"
	   } else {
	      document.getElementById("passwordCheckText").innerHTML = "<b><font color=green size=2pt> ��й�ȣ�� ��ġ�մϴ�. </font></b>"
	   }
	}

	/* function emailCheck() {		

		var email = document.getElementById("email").value;

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

				if(exptext.test(email) == false){

			//�̸��� ������ ���ĺ�+����@���ĺ�+����.���ĺ�+���� ������ �ƴҰ��			
	document.getElementById("emailCheckText").innerHTML 
	= "<b><font color=red size=2pt> �� ���������� �ùٸ��� �ʽ��ϴ�. </font></b>"

			//document.addjoin.email.focus();
		}
	}
*/
	

</script>
<center>
  <form method="post">
	<input type="hidden" name="kind" value="0"/>
	<!-- �Ϲ�ȸ��0  -->
	ȸ������
	<br/>
	<br/>
	1.������� 2.���Թ������ 3.�����Է�
	<br/>
	<br/>
	*���������� �Է����� �ʾƵ� �Ʒ� �Ϸ� ��ư�� ���� �����Ͻ� �� �ֽ��ϴ�		
	<br/>
	<br/>
	 ���̵�<input type="text" name="id" />
	<br/>
        ��й�ȣ<input type="password" name="password" id="password"  onkeyup="passwordsCheck()" />
    <br/>
	��й�ȣ ��Ȯ��<input type="password" name="passwordCheck" id="passwordCheck" onkeyup="passwordsCheck()" />&nbsp;<span id="passwordCheckText"></span>
	<br/>
	�̸�<input type="text" name="name" />
	<br/>
	�̸���<input type="text" name="email" id="email" /><!--  onkeyup="emailCheck()"/>&nbsp;<span id="emailCheckText"></span> -->
	<br/>
	�ּ�(����)<input type="text" name="address" />
	<br/>
	���¹�ȣ(����)<input type="text" name="account" placeholder=" -�� ���� �Է����ּ���"/>
	<br/>
	������(����)<input type="text" name="account_name" />
	<br/>
	�����(����)<input type="text" name="bank" />
	<br/>
	<input type="submit" value="���ԿϷ�"/>
</form>
</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
										<!-- ���������ݰ��õȰ� Ŀ���� �±� -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<html>											<!-- �����õȰ� -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>PickSell �Ϲ�ȸ�� ����</title>
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
<a href="#" onClick="Animate2id('#c2','easeInOutExpo'); return false">����</a>
<p><input type="button" value="�ڷ�" onclick="Animate2id('#c1'); return false" class="c2_cancel" />
</div>
<div id="c2">
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
<a href="#" onClick="Animate2id('#c3','easeInOutExpo'); return false">����</a>
<p><input type="button" value="�ڷ�" onclick="Animate2id('#c1'); return false" class="c2_cancel" />
</div>
<center>
<div id="c3">
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
<p><input type="button" value="�ڷ�" onclick="Animate2id('#c2'); return false" class="c2_cancel" />
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
</body>
</html>
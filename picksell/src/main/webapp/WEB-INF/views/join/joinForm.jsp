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
.next1Wrap {
    right: 200px;
    width: 30%;
    margin: 0 auto;
    margin-top: 60px;
}
.next1 {
    width: 10%;
    margin: 0 auto;
    margin-left: -1050px;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 15px;
    font-size: 15px;
}

</style>
</head>
<body>
<script>
function openCheckID(u){
	if(u.id.value == ''){
		alert('���̵� �Է��ϼ���!');
		u.id.focus();
		return false;
	}
	url = "checkJoinId?id="+u.id.value;
	open(url,"confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=500");
}
</script>

<div id="container">

<div id="c1">
	<h2> ȸ������ </h2>
	<h3> 1.������� 2.���Թ������ 3.�����Է� </h3> 
  <form name='checkbox_form'>
    <input type="checkbox" id="checkbox" name="mycheck" onchange="check_all();"/>��� ����
    <input type="checkbox" id="checkbox" name="mycheck" onchange="uncheck_all();"/>��� ����<br>
    <input type='checkbox' id="cbox1" name='mycheck' onchange="check_each();"/>�ȼ� �̿� ����� ���� ����(�ʼ�)<br>
    <input type='checkbox' id="cbox2" name='mycheck' onchange="check_each();"/>�������� ���� �� �̿뿡 ���� ����(�ʼ�)<br>
    <input type='checkbox' id="cbox3" name='mycheck' onchange="check_each();"/>�������� ���� ������ ���� ����(�ʼ�)<br>
    <br>
  </form> 
<div class="next1Wrap">
  <input type="button" id="c1_next" class="next1" onclick="AnimateForm('#c2','easeInOutExpo'); return false" value="����" disabled="disabled" />
</div>
			
<script>
	function check_all() {
		for(i=0; i < checkbox_form.mycheck.length; i++) {
			checkbox_form.mycheck[i].checked = true;
			var a = document.getElementById("c1_next");
			 document.getElementById("c1_next").disabled = false;
		}
	}
	function uncheck_all() {
		for(i=0; i < checkbox_form.mycheck.length; i++) {
			checkbox_form.mycheck[i].checked = false;
			checkbox_form.mycheck[0].checked = false;
			document.getElementById("c1_next").disabled = true;
		}
	}
	function check_each() {
		var cbox1 = document.getElementById("cbox1");
		var cbox2 = document.getElementById("cbox2");
		var cbox3 = document.getElementById("cbox3");
		if(cbox1.checked && cbox2.checked && cbox3.checked){
			document.getElementById("c1_next").disabled = false;
		}
	}
</script>
</div>

<div id="c2">
<h2> ȸ������ </h2>
<h3>1.������� 2.���Թ������ 3.�����Է�</h3>
 <p>
 <img src="/picksell/resources/img/personalPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','nomal'); return false"  >
 <img src="/picksell/resources/img/businessPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','business'); return false"  >
 </p>
<p><input type="button" value="����" onclick="AnimateForm('#c1'); return false" />
</div>

<div id="c3">check

  <form method="post" name="joinForm" onsubmit="return check();">
	<input type="hidden" id="kind" name="kind" value="1"/>
	<!-- �⺻ �����ȸ��  -->
	<p>ȸ������</p>
    <p> 1.������� 2.���Թ������ 3.�����Է�</p>
	<br/>
	*���������� �Է����� �ʾƵ� �Ʒ� �Ϸ� ��ư�� ���� �����Ͻ� �� �ֽ��ϴ�		
	<br/>
	<br/>
	 ���̵�<input type="text" name="id" />
	<br/>
    <input type="button" value="�ߺ�Ȯ��" class="idCheckButton" onclick="openCheckID(this.form);" />
	<br/>
        ��й�ȣ<input type="password" name="password" id="password2"  onkeyup="passwordsCheck2()" />
    <br/>
	��й�ȣ ��Ȯ��<input type="password" name="passwordCheck" id="passwordCheck2" onkeyup="passwordsCheck2()" />&nbsp;<span id="passwordCheckText2"></span>
	<br/>
	�̸�<input type="text" name="name" />
	<br/>
	�̸���<input type="text" name="email" id="email" />
	<br/>
	�ּ�(����)<input type="text" name="address" />
	<br/>
	���¹�ȣ(����)<input type="text" name="account" placeholder=" -�� ���� �Է����ּ���"/>
	<br/>
	������(����)<input type="text" name="account_name" />
	<br/>
	�����(����)<input type="text" name="bank" />
	<br/>
	<div id="business">
	����ڵ�Ϲ�ȣ<input type="text" name="business_number" />
	<br/>
	��ȣ��<input type="text" name="business_name" />
	<br/>
	</div>
	<input type="submit" value="���ԿϷ�"/>
	</form>
<p><input type="button" value="����" onclick="AnimateForm('#c2'); return false" /></p>
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
	      document.getElementById("passwordCheckText2").innerHTML = "<b><font color=red size=2pt> ��й�ȣ�� �ٸ��ϴ�. </font></b>"
	   } else {
	      document.getElementById("passwordCheckText2").innerHTML = "<b><font color=green size=2pt> ��й�ȣ�� ��ġ�մϴ�. </font></b>"
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

var idCheckNum = 0;//���̵� �ߺ�Ȯ���� �ʿ�

function check(){
	
	if(document.joinForm.id.value == ''){
		alert('���̵� �Է��ϼ���');
		document.joinForm.id.focus();
		return false;
	}
	else if(document.joinForm.password.value == ''){
		alert('��й�ȣ�� �Է��ϼ���');
		document.joinForm.password.focus();
		return false;
	}
	else if(document.joinForm.passwordCheck.value == ''){
		alert('��й�ȣ�� ���Է��ϼ���')
		document.joinForm.passwordCheck.focus();
		return false;
	}
	else if(document.joinForm.password.value != document.joinForm.passwordCheck.value){
		alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�');
		document.joinForm.passwordCheck.focus();
		return false;
	}
	else if(document.joinForm.name.value == ''){
		alert('�̸��� �Է��ϼ���')
		document.joinForm.name.focus();
		return false;
	}
	else if(document.joinForm.email.value == ''){
		alert('�̸����� �Է��ϼ���')
		document.joinForm.email.focus();
		return false;
	}
	else if(idCheckNum == 0){
		alert('���̵� �ߺ�Ȯ���� ���ּ���!');
		document.joinForm.id.focus();
		return false;
	}else
	 	alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');
		return true;
}
</script>
</body>
</html>
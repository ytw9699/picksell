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
.terms{
overflow-y: scroll;
height: 200px;
width: 40%;
}
.terms-btitle{
margin: 48px 0 48px;
text-align: center;
font-size: 18px;
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

<div id="c1">
	<h2> ȸ������ </h2>
	<h3> 1.������� 2.���Թ������ 3.�����Է� </h3> 
  <form name='checkbox_form'>
    <input type="checkbox" id="checkbox"  onclick="check_all();"/>��� ����
    <input type='checkbox' id="cbox1" class="mycheck" name='mycheck'  />�ȼ� �̿� ����� ���� ����(�ʼ�)<br>
    <input type='checkbox' id="cbox2" class="mycheck" name='mycheck'  />�������� ���� �� �̿뿡 ���� ����(�ʼ�)<br>
    <input type='checkbox' id="cbox3" class="mycheck" name='mycheck'  />�������� ���� ������ ���� ����(�ʼ�)<br>
    <input type='checkbox' id="cbox4" />���� ���� Ǫ�� �˸� ���� (����)<br>
    <br>
  </form>  
<div class="nextWrap">
  <input type="button" id="c1_next" class="next" onclick="AnimateForm('#c2','easeInOutExpo'); return false" value="����" disabled="disabled" />
</div>
<div class="terms">
<div class="terms-btitle">�̿���</div>
<div class="terms-mtitle">�� 1 ��  �� Ģ</div>
<div class="terms-stitle">�� 1 �� (����)</div>
<div class="indent-l1">
<p>�� ����� �������� �ֽ�ȸ��(���� "ȸ��"�� �մϴ�)�� �, �����ϴ� ���� �� ���� ���� ����(���� "����")�� �̿�� �����Ͽ� ȸ��� ȸ������ �Ǹ�, �ǹ� �� å�ӻ���, ��Ÿ �ʿ��� ������ �������� �������� �մϴ�.</p></div><div class="terms-stitle">�� 2 �� (����� ����)</div><div class="indent-l1"><p>�� ������� ����ϴ� ����� ���Ǵ� ���� �� ȣ�� ������, ���ǵ��� ���� �� ���� �ؼ��� ���� ���ɰ� ȸ���� �̿��� �� ����������޹�ħ, ȸ�簡 ������ ���� ��ħ ���� ����ʿ� ���մϴ�.</p><p>"����"�� ���� ȸ�簡 ���� ����� ȯ�濡�� �����ϴ� ���� ���� �� ���� ���� ���񽺸� ���մϴ�.</p><p>"ȸ��"�̶� ���� ȸ���� "����"�� �����Ͽ� �� ����� ���� "ȸ��"�� �̿����� ü���ϰ� "ȸ��"�� �����ϴ� "����"�� �̿��ϴ� ���� ���մϴ�.</p><p>"�Ǹ���"�� ���� "����"�� ������ ��ȭ �� �뿪(����"������"�̶���) �� ����Ͽ� �Ǹ��ϰų� �Ǵ� ������ �ǻ�� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.</p><p>"���̵�"�� ���� "ȸ��"�� �ĺ��� "����" �̿��� ���Ͽ� "ȸ��"�� ������ ��ȭ��ȣ�� ���մϴ�.</p><p>"��й�ȣ"�� ���� "ȸ��"�� �ο����� "���̵�"�� ��ġ�Ǵ� "ȸ��"���� Ȯ���ϰ� ��к�ȣ�� ���� "ȸ��" �ڽ��� ���� ���� �Ǵ� ������ ������ �ǹ��մϴ�.</p><p>"���Ἥ��"�� ���� "ȸ��"�� ����� �����ϴ� ���� �¶��ε�����������(���� ����������, VOD, ������ ��Ÿ ������������ ����), ����ڷ� �� ���� ���񽺸� �ǹ��մϴ�.</p><p>"ũ����"�̶� ���� "����"�� ȿ���� �̿��� ���� ȸ�簡 ���Ƿ� å�� �Ǵ� ����, ������ �� �ִ� ����� ��ġ�� ���� "����" ���� ���� �����͸� �ǹ��մϴ�.</p><p>"�Խù�"�̶� ���� "ȸ��"�� "����"�� �̿��Կ� �־� "���񽺻�"�� �Խ��� ����, ����, ����, ȭ��, ������ ���� ���� ������ ��, ����, ������ �� ���� ���ϰ� ��ũ ���� �ǹ��մϴ�.</p><p>"�������"�� ���� ����� �ܸ����� WPS(WiFi Positioning System), GPS ������� ����� ��ǥ�� �̿��Ͽ� "ȸ��" �Ǵ� "ȸ��"�� ������ ������ ������ �ǹ��մϴ�.</p><p>"���ø����̼�"�̶� ���� ����� �ܸ��⿡�� "����"�� ��ġ�Ͽ� �̿��� �� �ֵ��� ������ ���α׷��� ���մϴ�.</p><p>"��������"�� ���� '������Ÿ� �̿����� �� ������ȣ�� ���� ����'(���� "������Ÿ���") ��2�� ��1�� ��6ȣ '��������'�� ���մϴ�.</p><p>"ȸ������"�� ���� ��13�װ� ��14���� ������ ��Ī�մϴ�.</p></div><div class="terms-stitle">�� 3 �� (����� ���, ȿ�� �� ����)</div><div class="indent-l1"><p>"ȸ��"�� �� ����� ������ "ȸ��"�� ���� �� �� �ֵ��� ���� �ʱ� ȭ�鿡 �Խ��մϴ�.</p><p>"ȸ��"�� '����� ������ ���� ����'(���� "�����"), �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����(���� "���ڻ�ŷ���")��, ��������Ÿ����� �� ���ù��� �������� �ʴ� �������� �� ����� ������ �� �ֽ��ϴ�.</p><p>"ȸ��"�� ����� ������ ��쿡�� �������� �� ���������� ����Ͽ� �������� �Բ� ��1���� ��Ŀ� ���� �� ��������� �������� 7�� ������ �����մϴ�. �ٸ�, "ȸ��"���� �Ҹ��� �������� ����� �����ϴ� ��쿡�� �� �������� 30�� ������ ���� �ܿ� "ȸ������"�� ��ϵ� �̸��� �� ������ ������ ���� ������ ��Ȯ�� �����ϵ��� �մϴ�.</p><p>"ȸ��"�� ���׿� ���� "ȸ��"���� �����ϸ鼭 ���� �Ⱓ �̳��� �ź��ǻ縦 ǥ������ ������ ������ ������ ���ٴ� ���� ��Ȯ�ϰ� �����Ͽ������� ȸ���� ��������� �ź��ǻ縦 ������ �ʰų�, "����
��"�� �̿��� ��쿡�� "ȸ��"�� ��������� ������ ������ ���ϴ�.
</p><p>"ȸ��"�� ��������� �������� �ʴ� ��� "ȸ��"�� ��������� ������ ������ �� ������, 
�� ��� ȸ���� ��9�� ��1���� ������ ���� �̿����� ������ �� �ֽ��ϴ�.
</p></div><div class="terms-stitle">�� 4 �� (����� �ؼ�)</div>
<div class="indent-l1">
<p>"ȸ��"�� ���� ���񽺿� ���ؼ� ������ �̿��� �� ��å(���� "��Ÿ ��� ��")�� �� �� ������, 
�ش� ������ �� ����� ������ ��쿡�� "��Ÿ ��� ��"�� �켱�Ͽ� ����˴ϴ�.</p>
<p>�� ����� ��õ��� ���� ������ "��ġ������ȣ��", "�����", "���ڻ�ŷ���",
 �����ŷ�����ȸ�� ���ϴ� ���ڻ�ŷ� ����� �Һ��ں�ȣ��ħ �� ���� ���� �Ǵ� ����ʿ� �����ϴ�.
 </p></div><div class="terms-mtitle">�� 2 ��  ����� ü�� �� ����</div>
 <div class="terms-stitle">�� 5 �� (�̿����� ü��)</div><div class="indent-l1">
 <p>�̿����� "ȸ��"�� �ǰ��� �ϴ� ��(���� "���Խ�û��")�� ����� ���뿡 ���Ͽ� ���Ǹ� �� �� ȸ�����Խ�û�� �ϰ� "ȸ��"�� �̷��� ��û�� ���Ͽ� �³������ν� ü��˴ϴ�.
 </p><p>"ȸ��"�� "���Խ�û��"�� ��û�� ���Ͽ� ���� �̿��� �³����� ��Ģ���� �մϴ�. �ٸ�, "ȸ��"�� ���� �� ȣ�� �ش��ϴ� ��û�� ���Ͽ��� �³��� ���� �ʰų�,
  ���Ŀ� �̿����� ������ �� �ֽ��ϴ�.</p><p>���Խ�û�ڰ� �� ����� ���Ͽ� ������ ȸ���ڰ��� ����� ���� �ִ� ���</p><p>Ÿ���� ���Ǹ� �����Ͽ� �̿��û�� �ϴ� ���</p>
  <p>������ ������ �����ϰų�, ȸ�簡 �����ϴ� ������ �������� ���� ���</p><p>14�� �̸� �Ƶ��� ������Ÿ� �̿����� �� ������ȣ � ���� �������� ���� "��������" 
  �Է� �� �����븮��(�θ� ��)�� ���Ǹ� ���� �ƴ��� ���</p><p>�̿����� ��å������ ���Ͽ� ������ �Ұ����ϰų� ��Ÿ ������ ���� 
������ �����ϸ� ��û�ϴ� ���</p><p>����ۼ�, �м����� �Ǵ� �������縦 ���Ͽ� Ư�� ������ �˾ƺ� �� ���� ���·� �����Ͽ� �����ϴ� ���</p><p>�����븮���� �� 14�� �̸� 
�Ƶ��� ������ġ������ �̿�, ������ �����ϴ� ��� ����������, ����öȸ�� �� �Ͻ�������, ����, �����䱸���� ����� �� �ֽ��ϴ�.</p></div><div class="terms-stitle">
�� 26 �� (�� 8�� ������ �Ƶ� ���� ��ȣ�ǹ����� �Ǹ�)</div><div class="indent-l1"><p>"ȸ��"�� �Ʒ��� ��쿡 �ش��ϴ� ��(���� "�� 8�� ������ �Ƶ� ��")�� 
��ȣ�ǹ��ڰ� �� 8�� ������ �Ƶ� ���� ���� �Ǵ� ��ü��ȣ�� ���Ͽ� ������ġ������ �̿� �Ǵ� ������ �����ϴ� ��쿡�� ������ ���ǰ� �ִ� ������ ���ϴ�.</p><p>�� 8�� ������ �Ƶ�</p>
<p>��ġ����</p><p>'����κ�����' ��2�� ��2�� ��2ȣ�� ������ ���� ������ ��ָ� ���� �ڷμ� '����ΰ������ �� ������Ȱ��' ��2�� ��2ȣ�� ������ ���� ��������ο� �ش��ϴ� �� 
(����κ����� ��29���� ������ ���Ͽ� ����ε���� �� �ڿ� ���Ѵ�)</p><p>������ �� ��Ÿ �޹��� �Ǵ� õ������ �� �Ұ��׷����� ������ �߻��� ��� �� �ش�Ⱓ�� ��� �ҿ�Ⱓ���� 
���ܵ˴ϴ�.</p><p>"ȸ��"�� "�̿���"�� �������� ����� �� �ִ� ����� ������ �� �ֽ��ϴ�. �ٸ�, ��۰� �����Ͽ� "�̿���" �� �ּ��� ������� ����� �����ؾ� �ϸ�, 
��ۿ� ������ �߻� �� ��ȸ�硱�� �˷��� �� �ǹ��� ������, ���ذ� �߻� ���� �ÿ��� ��å������ �Ǵ��Ͽ� ����� �Ͽ��� �մϴ�.</p><p>��ȸ��"�� ��۰� �����Ͽ� �Ǹ��ڿ� ������,
 ��۾�ü, ������� ����� ���̿� �߻��� ������ ����ڵ鰣�� �ذ��� ��Ģ���� �ϸ�, ȸ��� ��� å�ӵ� �δ����� �ʽ��ϴ�.</p></div>
</div>
</div>


<div id="c2">
<h2> ȸ������ </h2>
<h3>1.������� 2.���Թ������ 3.�����Է�</h3>
 <p>
 <img src="/picksell/resources/img/personalPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','nomal'); return false"  >
 <img src="/picksell/resources/img/businessPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','business'); return false"  >
 </p>
<p>
<div class="nextWrap">
<input type="button" class="next" value="����" onclick="AnimateForm('#c1'); return false" />
</div>
</p>
</div>

<div id="c3">

  <form method="post" name="joinForm" onsubmit="return check();">
	<input type="hidden" id="kind" name="kind" value="1"/>
	<!-- �⺻ �����ȸ��  -->
	<h2>ȸ������</h2>
    <h3> 1.������� 2.���Թ������ 3.�����Է� </h3>
	<br/>
	<h3>*���������� �Է����� �ʾƵ� �Ʒ� �Ϸ� ��ư�� ���� �����Ͻ� �� �ֽ��ϴ�</h3>		
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
<div class="nextWrap">
<p><input type="button" class="next" value="����" onclick="AnimateForm('#c2'); return false" /></p>
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
	 	alert('ȸ�������� �Ϸ�Ǿ����ϴ�.�α��� ���ּ���');
		return true;
}
</script>
</body>
</html>
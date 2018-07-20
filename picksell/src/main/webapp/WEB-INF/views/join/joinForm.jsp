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
    margin: 0;
    margin-top: 60px;
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
</style>
</head>
<body>
<script>
function emailAuth(commonForm){
	//alert(document.commonForm.email.value);
	var url="emailAuth?email="+document.commonForm.email.value;
	var reg=document.commonForm;
	
	if(reg.email.value==""){
		alert("�̸����� �Է����ּ���");
		reg.email.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
function openCheckID(u){
	if(u.id.value == ''){
		alert('���̵� �Է��ϼ���!');//
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

<!-- �̿��� 1�κ� -->
<div class="terms">
<div class="terms-btitle">�̿���</div>
<div class="terms-mtitle">�� 1 ��  �� Ģ</div>
<div class="terms-stitle">�� 1 �� (����)</div>
<div class="indent-l1">
<p>�� ����� �������� �ֽ�ȸ��(���� "ȸ��"�� �մϴ�)�� �, �����ϴ� ���� �� ���� ���� ����(���� "����")�� �̿�� �����Ͽ� ȸ��� ȸ������ �Ǹ�, �ǹ� �� å�ӻ���, ��Ÿ �ʿ��� ������ �������� �������� �մϴ�.</p></div><div class="terms-stitle">�� 2 �� (����� ����)</div><div class="indent-l1"><p>�� ������� ����ϴ� ����� ���Ǵ� ���� �� ȣ�� ������, ���ǵ��� ���� �� ���� �ؼ��� ���� ���ɰ� ȸ���� �̿��� �� ����������޹�ħ, ȸ�簡 ������ ���� ��ħ ���� ����ʿ� ���մϴ�.</p><p>"����"�� ���� ȸ�簡 ���� ����� ȯ�濡�� �����ϴ� ���� ���� �� ���� ���� ���񽺸� ���մϴ�.</p><p>"ȸ��"�̶� ���� ȸ���� "����"�� �����Ͽ� �� ����� ���� "ȸ��"�� �̿����� ü���ϰ� "ȸ��"�� �����ϴ� "����"�� �̿��ϴ� ���� ���մϴ�.</p><p>"�Ǹ���"�� ���� "����"�� ������ ��ȭ �� �뿪(����"������"�̶���) �� ����Ͽ� �Ǹ��ϰų� �Ǵ� ������ �ǻ�� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.</p><p>"���̵�"�� ���� "ȸ��"�� �ĺ��� "����" �̿��� ���Ͽ� "ȸ��"�� ������ ��ȭ��ȣ�� ���մϴ�.</p><p>"��й�ȣ"�� ���� "ȸ��"�� �ο����� "���̵�"�� ��ġ�Ǵ� "ȸ��"���� Ȯ���ϰ� ��к�ȣ�� ���� "ȸ��" �ڽ��� ���� ���� �Ǵ� ������ ������ �ǹ��մϴ�.</p><p>"���Ἥ��"�� ���� "ȸ��"�� ����� �����ϴ� ���� �¶��ε�����������(���� ����������, VOD, ������ ��Ÿ ������������ ����), ����ڷ� �� ���� ���񽺸� �ǹ��մϴ�.</p><p>"ũ����"�̶� ���� "����"�� ȿ���� �̿��� ���� ȸ�簡 ���Ƿ� å�� �Ǵ� ����, ������ �� �ִ� ����� ��ġ�� ���� "����" ���� ���� �����͸� �ǹ��մϴ�.</p><p>"�Խù�"�̶� ���� "ȸ��"�� "����"�� �̿��Կ� �־� "���񽺻�"�� �Խ��� ����, ����, ����, ȭ��, ������ ���� ���� ������ ��, ����, ������ �� ���� ���ϰ� ��ũ ���� �ǹ��մϴ�.</p><p>"�������"�� ���� ����� �ܸ����� WPS(WiFi Positioning System), GPS ������� ����� ��ǥ�� �̿��Ͽ� "ȸ��" �Ǵ� "ȸ��"�� ������ ������ ������ �ǹ��մϴ�.</p><p>"���ø����̼�"�̶� ���� ����� �ܸ��⿡�� "����"�� ��ġ�Ͽ� �̿��� �� �ֵ��� ������ ���α׷��� ���մϴ�.</p><p>"��������"�� ���� '������Ÿ� �̿����� �� ������ȣ�� ���� ����'(���� "������Ÿ���") ��2�� ��1�� ��6ȣ '��������'�� ���մϴ�.</p><p>"ȸ������"�� ���� ��13�װ� ��14���� ������ ��Ī�մϴ�.</p></div><div class="terms-stitle">�� 3 �� (����� ���, ȿ�� �� ����)</div><div class="indent-l1"><p>"ȸ��"�� �� ����� ������ "ȸ��"�� ���� �� �� �ֵ��� ���� �ʱ� ȭ�鿡 �Խ��մϴ�.</p><p>"ȸ��"�� '����� ������ ���� ����'(���� "�����"), �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����(���� "���ڻ�ŷ���")��, ��������Ÿ����� �� ���ù��� �������� �ʴ� �������� �� ����� ������ �� �ֽ��ϴ�.</p><p>"ȸ��"�� ����� ������ ��쿡�� �������� �� ���������� ����Ͽ� �������� �Բ� ��1���� ��Ŀ� ���� �� ��������� �������� 7�� ������ �����մϴ�. �ٸ�, "ȸ��"���� �Ҹ��� �������� ����� �����ϴ� ��쿡�� �� �������� 30�� ������ ���� �ܿ� "ȸ������"�� ��ϵ� �̸��� �� ������ ������ ���� ������ ��Ȯ�� �����ϵ��� �մϴ�.</p><p>"ȸ��"�� ���׿� ���� "ȸ��"���� �����ϸ鼭 ���� �Ⱓ �̳��� �ź��ǻ縦 ǥ������ ������ ������ ������ ���ٴ� ���� ��Ȯ�ϰ� �����Ͽ������� ȸ���� ��������� �ź��ǻ縦 ������ �ʰų�, "����"�� �̿��� ��쿡�� "ȸ��"�� ��������� ������ ������ ���ϴ�.</p><p>"ȸ��"�� ��������� �������� �ʴ� ��� "ȸ��"�� ��������� ������ ������ �� ������, �� ��� ȸ���� ��9�� ��1���� ������ ���� �̿����� ������ �� �ֽ��ϴ�.</p></div><div class="terms-stitle">�� 4 �� (����� �ؼ�)</div><div class="indent-l1"><p>"ȸ��"�� ���� ���񽺿� ���ؼ� ������ �̿��� �� ��å(���� "��Ÿ ��� ��")�� �� �� ������, �ش� ������ �� ����� ������ ��쿡�� "��Ÿ ��� ��"�� �켱�Ͽ� ����˴ϴ�.</p><p>�� ����� ��õ��� ���� ������ "��ġ������ȣ��", "�����", "���ڻ�ŷ���",�����ŷ�����ȸ�� ���ϴ� ���ڻ�ŷ� ����� �Һ��ں�ȣ��ħ �� ���� ���� �Ǵ� ����ʿ� �����ϴ�.</p></div><div class="terms-mtitle">�� 2 ��  ����� ü�� �� ����</div><div class="terms-stitle">�� 5 �� (�̿����� ü��)</div><div class="indent-l1"> <p>�̿����� "ȸ��"�� �ǰ��� �ϴ� ��(���� "���Խ�û��")�� ����� ���뿡 ���Ͽ� ���Ǹ� �� �� ȸ�����Խ�û�� �ϰ� "ȸ��"�� �̷��� ��û�� ���Ͽ� �³������ν� ü��˴ϴ�.</p></div></div>
<!-- �̿��� 1�κ� -->
<!-- �̿��� 2�κ� -->
<div class="terms">
<div class="terms-btitle">�������� ���� ���� ����</div>
<div>�ֽ�ȸ�� ������ �������� ���� ������ ���Ͽ� �Ƹ��� �������� �̿��ϰ� ������ �̿� ������� ���� ������ ���� ������ ������ �� �ֽ��ϴ�.</div><ul class="indent-l1"><li><p></p><div><strong>�����޴� ��</strong></div><div>Amazon Web Service, Inc</div><p></p></li><li><p></p><div><strong>�����޴� �ڰ� �����ϴ� ����</strong></div><div>�̱�</div><p></p></li><li><p></p><div><strong>���� ���� ��ȣ å���� ����ó</strong></div><div>dhkim@withsellit.com</div><p></p></li><li><p></p><div><strong>���� �޴� ���� ���� ���� �̿� ����</strong></div><div>�ý��� �����ڷν� �ش� ������ �ܼ� ����</div><p></p></li><li><p></p><div><strong>�����ϴ� ���������� �׸�</strong></div><div>�̸�, �̸���, ��й�ȣ, �ŷ�����, �ּ�, ��������</div><p></p></li><li><p></p><div><strong>���� �ñ� �� ���� ���</strong></div></div>
<!-- �̿��� 2�κ� -->
</div>


<div id="c2" class="innerContentWrap">
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
</div>

<div id="c3" class="innerContentWrap">

  <form method="post" name="commonForm" onsubmit="return check();">
	<input type="hidden" id="kind" name="kind" value="1"/>
	<!-- �⺻ �����ȸ��  -->
	<h2>ȸ������</h2>
    <h3> 1.������� 2.���Թ������ 3.�����Է� </h3>
	<br/>
	<h3>*���������� �Է����� �ʾƵ� �Ʒ� �Ϸ� ��ư�� ���� �����Ͻ� �� �ֽ��ϴ�</h3>		
	<br/>
	<br/>
	 ���̵�<input type="text" name="id" />
    <input type="button" value="�ߺ�Ȯ��" class="idCheckButton" onclick="openCheckID(this.form);" />
	<br/>
        ��й�ȣ<input type="password" name="password" id="password2"  onkeyup="passwordsCheck2()" />
    <br/>
	��й�ȣ ��Ȯ��<input type="password" name="passwordCheck" id="passwordCheck2" onkeyup="passwordsCheck2()" />&nbsp;<span id="passwordCheckText2"></span>
	<br/>
	�̸�<input type="text" name="name" />
	<br/>
	�̸���<input type="text" name="email" id="email"/>
	<input type="hidden" name="email2" id="email2"/>
	<input type="button" onclick="emailAuth(this.form)" value="���� ����"/>
	<input type="text" name="mailCheck" placeholder="������ �Ϸ���� �ʾҽ��ϴ�" readonly/>
	<br/>
	�ּ�(����)<input type="text" name="address" />
	<br/>
	�ڵ��� ��ȣ(����)<input type="text" name="phoneNum" placeholder=" -�� ���� �Է����ּ���"/>
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
	
	if(document.commonForm.id.value == ''){
		alert('���̵� �Է��ϼ���');
		document.commonForm.id.focus();
		return false;
	}
	else if(document.commonForm.password.value == ''){
		alert('��й�ȣ�� �Է��ϼ���');
		document.commonForm.password.focus();
		return false;
	}
	else if(document.commonForm.passwordCheck.value == ''){
		alert('��й�ȣ�� ���Է��ϼ���')
		document.commonForm.passwordCheck.focus();
		return false;
	}
	else if(document.commonForm.password.value != document.commonForm.passwordCheck.value){
		alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�');
		document.commonForm.passwordCheck.focus();
		return false;
	}
	else if(document.commonForm.name.value == ''){
		alert('�̸��� �Է��ϼ���')
		document.commonForm.name.focus();
		return false;
	}
	else if(document.commonForm.email.value == ''){
		alert('�̸����� �Է��ϼ���')
		document.commonForm.email.focus();
		return false;
	}
	else if(document.commonForm.mailCheck.value != '�����Ϸ�'){
		alert('�̸��� ������ ���ּ���') 
		document.commonForm.email.focus();
		return false;
	}
	else if(document.commonForm.email.value != document.commonForm.email2.value){
		alert('������ �̸����� �Է��ϼ���')
		document.commonForm.email.focus();
		return false;
	}
	else if(idCheckNum == 0){
		alert('���̵� �ߺ�Ȯ���� ���ּ���!');
		document.commonForm.id.focus();
		return false;
	}else
	 	alert('ȸ�������� �Ϸ�Ǿ����ϴ�.�α��� ���ּ���');
		return true;
}

$(document).ready(function(){
	
	var currentWindowWidth = document.body.offsetWidth;
	$('.innerContentWrap').css('width', currentWindowWidth);
 });
 
</script>
</body>
</html>
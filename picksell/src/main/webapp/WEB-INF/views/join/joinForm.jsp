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
		alert("�̸����� �Է����ּ���");
		reg.email.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600,height=400");
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
	<div class="join"> ȸ������ </div>
		<div class="signup" id="insertColor">1. �������</div>
		<div class="signup" >2. ���� ��� ����</div>
		<div class="signup" >3. ���� �Է�</div>
		
  <form name='checkbox_form' id="checkbox_form">
    <input type="checkbox" id="checkbox"  onclick="check_all();"/>��� ����
    <input type='checkbox' id="cbox1" class="mycheck" name='mycheck'  />�ȼ� �̿� ����� ���� ����(�ʼ�)<br>
    <input type='checkbox' id="cbox2" class="mycheck" name='mycheck'  />�������� ���� �� �̿뿡 ���� ����(�ʼ�)<br>
    <input type='checkbox' id="cbox3" class="mycheck" name='mycheck'  />�������� ���� ������ ���� ����(�ʼ�)<br>
    <input type='checkbox' id="cbox4" />���� ���� Ǫ�� �˸� ���� (����)<br>
    <br>
  </form>  
  
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

<div class="nextWrap">
  <input type="button" id="c1_next" class="next" onclick="AnimateForm('#c2','easeInOutExpo'); return false" value="����" disabled="disabled" />
</div>
</div>


<div id="c2" class="innerContentWrap">
<div class="join"> ȸ������ </div>
	<div class="signup">1. �������</div>
	<div class="signup" id="insertColor">2. ���� ��� ����</div>
	<div class="signup">3. ���� �Է�</div>
 <p>
 <img src="/picksell/resources/img/personalPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','nomal'); return false"  >
 <img src="/picksell/resources/img/businessPurchase.png" onclick="AnimateForm('#c3','easeInOutExpo','business'); return false"  >
 </p>
<p>
<div class="nextWrap">
<input type="button" class="pre" value="����" onclick="AnimateForm('#c1'); return false" />
</div>
</div>

<div id="c3" class="innerContentWrap">

  <form method="post" name="commonForm" onsubmit="return check();">
	<input type="hidden" id="kind" name="kind" value="1"/>
	<!-- �⺻ �����ȸ��  -->
	<div class="join"> ȸ������ </div>
		<div class="signup">1. �������</div>
		<div class="signup" >2. ���� ��� ����</div>
		<div class="signup" id="insertColor">3. ���� �Է�</div>
	<br/>
	<div class="signup-top-instr">*���������� �Է����� �ʾƵ� �Ʒ� �Ϸ� ��ư�� ���� �����Ͻ� �� �ֽ��ϴ�</div>	
	<br/>
	<div class="bigbig">
	<div class="information">���̵�</div>
	<input type="text" name="id" class="inputclass"/>
	<div class="checkcheck">
    <input type="button" value="�ߺ�Ȯ��" onclick="openCheckID(this.form);" class="pre2"/>
    </div>
	<br/>
    <div class="information">��й�ȣ</div>
    <input type="password" name="password" id="password2"  onkeyup="passwordsCheck2()" class="inputclass"/>
    <br/>
    <div class="information">��й�ȣ ��Ȯ��</div>
    <input type="password" name="passwordCheck" id="passwordCheck2" onkeyup="passwordsCheck2()" class="inputclass"/>&nbsp;<span id="passwordCheckText2"></span>
	<br/>
	<div class="information">�̸�</div>
	<input type="text" name="name" class="inputclass" />
	<br/>
	<div class="information">�̸���</div>
	<input type="email" name="email" id="email" class="inputclass"/>
	<div class="injeung">
	<input type="hidden" name="email2" id="email2"/>
	<input type="button" onclick="emailAuth(this.form)" value="���� ����" class="pre2"/>
	<input type="text" class ="mailCheck" name="mailCheck" placeholder=" ������ ���ּ���." readonly/>
	</div>
	<br/>
	<div class="information">�ּ�(����)</div>
	<input type="text" name="address" class="inputclass"/>
	<br/>
	<div class="information">�ڵ��� ��ȣ(����)</div>
	<input type="text" name="phoneNum" class="inputclass"/>
	<br/>
	<div class="information">���¹�ȣ(����)</div>
	<input type="text" name="account" class="inputclass"/>
	<br/>
	<div class="information">������(����)</div>
	<input type="text" name="account_name" class="inputclass"/>
	<br/>
	<div class="information">�����(����)</div>
	<input type="text" name="bank" class="inputclass"/>
	<br/>
	<div id="business">
	<div class="information">����ڵ�Ϲ�ȣ</div>
	<input type="text" name="business_number" class="inputclass"/>
	<br/>
	<div class="information">��ȣ��</div>
	<input type="text" name="business_name" class="inputclass"/>
	<br/>
	</div>
	</div>
	<div class="nextWrap">
	<input type="button" class="pre" value="����" onclick="AnimateForm('#c2'); return false" />
	<input type="submit" class="pre" value="���ԿϷ�"/>
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
	for (i = 0; i < document.commonForm.id.value.length; i++) {
        ch = document.commonForm.id.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
            alert("���̵�� �ҹ��ڿ� ���ڸ� �Է°����մϴ�.");
            document.commonForm.id.focus();
            document.commonForm.id.select();
            return false;
        }
    }
	if(document.commonForm.id.value == ''){
		alert('���̵� �Է��ϼ���');
		document.commonForm.id.focus();
		return false;
	}
	else if (document.commonForm.id.value.length<5 || document.commonForm.id.value.length>12) {
         alert("���̵� 5~12�ڱ��� �Է����ּ���.");
        document.commonForm.id.focus();
        document.commonForm.id.select();
         return false;
     }
	else if(document.commonForm.password.value == ''){
		alert('��й�ȣ�� �Է��ϼ���');
		document.commonForm.password.focus();
		return false;
	}
	else if(document.commonForm.password.value.length<4 || document.commonForm.password.value.length>13) {
         alert("��й�ȣ�� 4~13�ڱ��� �Է����ּ���.")
         document.commonForm.password.focus();
         document.commonForm.password.select();
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
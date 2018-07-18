<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>내정보</title>
<!-- <link rel="stylesheet" href="/picksell/resources/mypage/mypageInformation.css" type="text/css" /> -->
<h2>회원정보수정</h2>
</head>
<style>
#profile { /* 파일 필드 숨기기 */
display:none;
}
#profileSearch {
    background-color: white;
    width: 200px;
    color: #7151fc;
    display: block;
    font-size: 20px;
    margin-left: 120px; 
}
.PROFILE_IMG{
  width: 100%;
}
.imgWrapper{
 width: 150px;
}
#profileGray{
position: fixed; 
width: 100%; 
height: 100%; 
top: 0; 
left: 0; 
background-color: #000; 
opacity: 0.6; 
display: none;
}
#modprofile{    
	display: none;
    width: 400px;
    border-radius: 8px;
    position: absolute;
    top: 25%;
    left: 35%;
    padding: 50px;
    background-color: white;
    }
    
span.step1TEXT {
display: block;
font-size: 25px;
text-align: center;
margin-top: 20px;
color: #7151fc;
}
.mainImg {
    width: 50%;
    margin: 0 auto;
    min-height: 300px;
    max-height: 300px;
}
img#mainPic {
    width: 100%;
    max-height: 360px;
}
img#mainPic2 {
    width: 100%;
    max-height: 360px;
}
   
</style>
<body>
<script>

function passwordsCheck(){
var NewPassword = $('#password').val();
var rePassword = $('#passwordCheck').val();

if(NewPassword === rePassword){
	 $('#Innerpassword').html('<b><font color = green size =2pt>비밀번호가 일치합니다. </font><b>');
}
else if(NewPassword !== rePassword){//
	 $('#Innerpassword').html('<b><font color = red size =2pt> 비밀번호가 일치하지 않습니다. </font><b>');
	 return false;
}
}

</script>
<div>
		<div class="imgWrapper">
			<a href="javascript:openProfileMod();">
				<c:if test="${resultMap.PROFILE_IMG == 'default'}">
				<img class="mainImgtag" src="/picksell/resources/img/basicProfile.png" id="mainPic" />
				</c:if>
				<c:if test="${resultMap.PROFILE_IMG != 'default'}">
				<img src="/picksell/resources/profileImgUpload/${resultMap.PROFILE_IMG}" class="PROFILE_IMG"/>
			    </c:if>
			</a>
		</div>
		
    <div id="profileGray"></div>
	<div id="modprofile">
			<span class="step1TEXT">이미지를 선택해주세요</span>
		<form action="/picksell/mypage/profile" id="profileForm" name= "profileForm" method="post" enctype="multipart/form-data" onsubmit="return profileCheck2()">
																											
			<div class="mainImg">
				<img class="mainImgtag" src="/picksell/resources/img/basicProfile.png" id="mainPic2" />
			</div>
	        <label for="profile" id="profileSearch">프로필 이미지 찾기</label>
			<input type="file" name="PROFILE_IMG" id="profile" /><br>
			<input type="submit" class="profileButtons" id="profileConfirm" value="확인" />
			<input type="button" class="profileButtons" value="기본이미지 사용하기" onclick="location.href='/picksell/mypage/defaultProfile'"/>
			<input type="button" class="profileButtons" value="취소" onclick="javascript:closeProfileMod();" />
		</form>
	</div>

<form action="/picksell/mypage/modify" method="post" onsubmit = "return passwordsCheck()">
	<input type="hidden" name="id" value="${resultMap.ID}"/>
	<input type="hidden" name="profile_img" value="${resultMap.PROFILE_IMG}"/>
	<input type="hidden" name="alarm_consent" value="${resultMap.ALARM_CONSENT}"/>
		
	아이디: ${resultMap.ID}
	 <br/>
	이름: ${resultMap.NAME}
	<br/>
	회원 종류:
	<c:if test="${resultMap.KIND == '0'}">
	일반회원
	</c:if>
	<c:if test="${resultMap.KIND == '1'}">
	사업자회원
	</c:if>
	<c:if test="${resultMap.KIND == '99'}">
	관리자
	</c:if>
	<br/>
        신규 비밀번호:<input type="password" name="password" id="password" onkeyup="passwordsCheck()" value="${resultMap.PASSWORD}"/>
    <br/>
	비밀번호 다시 입력:<input type="password" name="passwordCheck" id="passwordCheck" onkeyup="passwordsCheck()" value="${resultMap.PASSWORD}"/>&nbsp;<span id="Innerpassword"></span>
	<br/>
	이메일:<input type="text" value="${resultMap.EMAIL}" name="email" id="email" />
	<br/>
	주소:<input type="text" value="${resultMap.ADDRESS}" name="address" />
	<br/>
	은행명:<input type="text" value="${resultMap.BANK}" name="bank" />
	<br/>
	계좌번호:<input type="text" value="${resultMap.ACCOUNT}" name="account" placeholder=" -를 빼고 입력해주세요"/>
	<br/>
	예금주:<input type="text" value="${resultMap.ACCOUNT_NAME}" name="account_name" />
	<br/>
	<!-- 사업자회원일 경우 보여주기-->
	<c:if test="${resultMap.KIND == '1'}">
	사업자등록번호:<input type="text" value="${resultMap.BUSINESS_NUMBER}" name="business_number" />
	<br/>
	상호명:<input type="text" value="${resultMap.BUSINESS_NAME}" name="business_name" />
	<br/>
	</c:if>
	가입일: <fmt:formatDate value="${resultMap.REGDATE}" pattern="yy.MM.dd. hh:mm" />
	<br/>
	최근 로그인: <fmt:formatDate value="${resultMap.LATESTLOGIN2}" pattern="yy.MM.dd. hh:mm" />
	<br/>
	알림상태: ${resultMap.ALARM_CONSENT}
	<br/>
	계정상태: 
	<c:if test="${resultMap.STATUS == '0'}">
	정상
	</c:if>
	<c:if test="${resultMap.STATUS == '1'}">
	게시글 작성 금지
	</c:if>
	<c:if test="${resultMap.STATUS == '2' }">
	로그인 제한
	</c:if>
	<br/>
	<input type="submit" value="정보 수정하기"/>
	<br/>
</form>
 <!-- <input type="button" value="탈퇴하기"/> -->
</div>
<c:if test="${Updated == 'Updated'}">
<script>
alert("수정이 완료되었습니다");
</script>
</c:if>
<script>
	var profileBack = document.getElementById('profileGray');
	var profileDiv = document.getElementById('modprofile');
	
	function openProfileMod(){
		profileBack.style.display = 'block';
		profileDiv.style.display = 'block';
	}
	function closeProfileMod(){
		profileBack.style.display = 'none';
		profileDiv.style.display = 'none';
	}
	function profileCheck2(){
		if(document.profileForm.PROFILE_IMG.value == ''){
			alert('이미지를 올려주세요.');
			return false;
		} 
		return true;
	}

	
	
$(document).ready(function(){
		/* 사진업로드 타입 유효성검증 */
		var validationType = function(fileName){
			var type = fileName.substring(fileName.lastIndexOf('.')+1, fileName.length);
			if(type.toUpperCase() == 'JPG' || type.toUpperCase() == 'GIF' || type.toUpperCase() == 'PNG' || type.toUpperCase() == 'BMP'){
				return true;
			}else
				return false;
		};
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) { 
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#mainPic2').attr('src', e.target.result);
					//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
					//(아래 코드에서 읽어들인 dataURL형식)
				}					
				reader.readAsDataURL(input.files[0]);
				//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}//readURL()-- 
		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#profile").change(function(){
			//alert(this.value); //선택한 이미지 경로 표시
			if(!validationType(this.value)){
				alert("사진파일이 아닙니다");
				return false;
			}else if(validationType(this.value)){
				readURL(this);
			}
		});
	 });
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.main{
    margin-left: 200px;
    height: 100%;
    min-width: 1024px;
}
.pageSubject{
	border-bottom: 2px solid #7151fc;
    padding: 10px;
    text-align: center;

}

hr{
 border: none;
 border : 1px solid grey;

 
}

.memberInfo{
  margin-top : 40px;
  margin-left : 15px;
}
.hiddenPage{
 display : none;
 border : 1px;
 background-color : #e8e7e7;
  text-align: center;
}
.pimg{
	/*display: none;*/
	
}
button {
  
  background-color: white;
  border : 1px solid white;
  margin : 11px;
  display: inline-block;
  font-weight: bold;
 
}
 button:focus { outline:0 !important; }
.bbutton:hover{
 box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
.id{
 display: inline-block;
}
.profile{
    margin-top: 50px;
    padding: 52px;
    padding-right: 170px;
    margin-left: 50px;
    margin-right: 50px;
    margin-bottom: 50px;
    padding-left: 120px;

}
.link{
    margin-left: 190px;
    margin-right: 160px;
    padding: 14px;
    background-color: white;

   
}

</style>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script>
$(document).ready(function(){
    $("button.change").click(function(){
        $("div.hiddenPage").toggle("slow");
        $("div.hiddenPage").css('display','inline')
    });
});


</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 회원 상세보기</title>
</head>
<body>
<div class="main">
<div class="pageSubject" >
 <h1 style="margin-left:17px;margin-right:17px;">회원 페이지</h1></div>
<div class="memberInfo">
<div class="profile" style="background-color:#e8e7e7;border-radius:25px;">
<div class="d" style="display:inline;">
<c:choose>
	 <c:when test="${map.PROFILE_IMG != '' || map.PROFILE_IMG ne null }">
	<div class="id" style="float:right;"><img src="/picksell/resources/profileImgUpload/${map.PROFILE_IMG }" style="width:150px; height:130px;"/></div>
	 </c:when>
	 <c:when test="${map.PROFILE_IMG eq null }">
	<div class="id" style="float:right;"><img src="/picksell/resources/profileImgUpload/freeprofileimg.jpg" style="width:150px; height:130px;"/></div>
	 </c:when>
	 </c:choose>


아이디 : ${map.ID }</div>
<div class="name">
이름 : ${map.NAME }
</div>
<div class="email">
이메일 : ${map.EMAIL }
</div>
<div class="address">
주소 : ${map.ADDRESS }
</div>
<div class="status">
계정 상태 : 
<c:choose>
<c:when test="${ '0' eq map.STATUS }">
 정상
</c:when>
<c:when test="${ '1' eq map.STATUS }">
 게시글 제한
</c:when>
<c:when test="${ '2' eq map.STATUS }">
 로그인 제한
</c:when>
</c:choose>
<button class="change">변경</button>
</div>
<div class="hiddenPage"> 

	<c:choose>
		<c:when test="${map.STATUS == '0'}">
		<input type="submit" value="게시글 제한" onclick="location.href='/picksell/admin/member/infoChangeProc?id=${map.ID}&status=1'" >
   	    <input type="submit" value="로그인 제한" onclick="location.href='/picksell/admin/member/infoChangeProc?id=${map.ID}&status=2'" >
		</c:when>
		<c:when test="${map.STATUS == '1' }">
				<input type="submit" value="정 상" onclick="location.href='/picksell/admin/member/infoChangeProc?id=${map.ID}&status=0'" >
		   		 <input type="submit" value="로그인 제한" onclick="location.href='/picksell/admin/member/infoChangeProc?id=${map.ID}&status=2'" >
		</c:when>
		<c:when test="${map.STATUS == '2' }">
			<input type="submit" value="정 상" onclick="location.href='/picksell/admin/member/infoChangeProc?id=${map.ID}&status=0'" >
		   	<input type="submit" value="게시글 제한" onclick="location.href='/picksell/admin/member/infoChangeProc?id=${map.ID}&status=1'" >
		</c:when>
	</c:choose> 

</div>
<div class="alarm">
알람 동의 여부 :
<c:choose>
<c:when test="${ map.ALARM_CONSENT eq 'ON'  }">
<img src="/picksell/resources/img/Alram1.png" width="20px" height="18px" >
</c:when>
<c:when test="${map.ALARM_CONSENT  eq 'OFF'}">
<img src="/picksell/resources/img/noAlarm.png" width="20px" height="18px">
</c:when>
</c:choose>
</div>
<div class="regdate">
가입 일자 : <fmt:formatDate value="${map.REGDATE }" pattern="yyyy-MM-dd"/>
</div>
<div class="kind">
권한 :
   <c:choose>
	 <c:when test="${ '99' eq map.KIND}">
	관리자  <img src="/picksell/resources/img/admin.png" width="20px" height="20px"/> 
	 </c:when>
	 <c:when test="${ '0' eq map.KIND }" >
	개인회원  <img src="/picksell/resources/img/personal.png"  width="20px" height="20px"/> 
	 </c:when>
	 <c:when test="${ '1' eq map.KIND }" >
	사업자 회원 <img src="/picksell/resources/img/business-icon.png" width="20px" height="20px"/>
	</c:when>
	</c:choose>
</div>
</div>
</div>

<div class="link" >

<button class="bbutton" id="btn" type="submit" onclick="window.location='/picksell/admin/member/orderList/${map.ID}'"><img class="btn-img"src="/picksell/resources/img/orderlist.png" width="150px" height="150px"></button>
주문 내역 리스트

<button class="bbutton" id="btn" type="submit" onclick="window.location='/picksell/admin/member/sellHistory/${map.ID}'"><img class="btn-img" src="/picksell/resources/img/sellHistory.png" width="150px" height="150px"></button>
판매 내역 리스트
<button class="bbutton" id="btn" type="submit" onclick="window.location='/picksell/admin/member/purchaseHistory/${map.ID}'"><img class="btn-img" src="/picksell/resources/img/buying.png" width="150px" height="150px">
</button>
구매 내역 리스트
<button style="
  border : none;" class="bbutton" id="btn" type="submit" onclick="window.location='/picksell/admin/member/products/${map.ID}'"><img class="btn-img"  src="/picksell/resources/img/sell.png" width="150px" height="150px"></button>현재 판매 글
</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.main{
   margin-left: 200px; /* Same as the width of the sidenav */
}
.hiddenPage{
  	margin-left: 300px; 
    width: 100%;
    padding: 50px 0;
    text-align: center;
    background-color: lightgrey;
    
}
.panel{
  margin-left : 120px;
  margin-top : 40px;
  width : 300px;
  height: 500px;

}
button{
  background: #337ab7;
  color:#fff;
  border:none;
  position:relative;
  height:22px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#337ab7;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #337ab7;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("button").click(function()){
		$(".hiddenPage").toggle();	
		
	});
	
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 회원 상세보기</title>
</head>
<body>
<div class="main">

<div class="panel">
<div class="memberInfo">
아이디 : ${map.ID }
<hr>

이름 : ${map.NAME }
<hr>


이메일 : ${map.EMAIL }
<hr>

주소 : ${map.ADDRESS }
<hr>

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

<button>변경</button>
<hr>


알람 동의 여부 : ${map.ALARM_CONSENT }
<hr>

가입 일자 : <fmt:formatDate value="${map.REGDATE }" pattern="yyyy-MM-dd"/>
<hr>
권한 : <c:choose>
	 <c:when test="${ '99' eq map.KIND}">
	관리자
	 </c:when>
	 <c:when test="${ '0' eq map.KIND }" >
	개인회원
	 </c:when>
	 <c:when test="${ '1' eq map.KIND }" >
	사업자 회원
	</c:when>
	</c:choose>
<hr>
</div>
<a href="/picksell/admin/member/orderList/${map.ID}">
회원 주문 내역 리스트
</a>
<hr>

<a href="/picksell/admin/member/sellHistory/${map.ID}">
회원 판매 내역 리스트</a>
<hr>

<a href="/picksell/admin/member/purchaseHistory/${map.ID}">
회원 구매 내역 리스트</a>
<hr>

<a href="/picksell/admin/member/products/${map.ID}">
회원 판매 글 리스트</a>
<hr>
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

</div>

</body>
</html>
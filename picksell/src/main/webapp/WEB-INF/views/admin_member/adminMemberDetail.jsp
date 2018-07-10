<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.main{
   margin-left: 160px; /* Same as the width of the sidenav */
}
#hiddenPage{
  	margin-left: 160px; 
    width: 100%;
    padding: 50px 0;
    text-align: center;
    background-color: lightgrey;
    
}
</style>
<script type="text/javascript">
  function msg(){
	  var x = document.getElementById("hiddenPage");
	  var status = ${map.STATUS}
	  if(x.style.display === "none" ){
		  x.style.display = "block";
		  
	  }else{
		  x.style.display = "none";
	  }
	  
	  
	  
 }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 회원 상세보기</title>
</head>
<body>
<div class="main">
<table border="1px" align="center">
<tr>
<td>아이디 : ${map.ID }</td>
</tr>
<tr>
<td>
이름 : ${map.NAME }
</td>
</tr>
<tr><td>
이메일 : ${map.EMAIL }
</td></tr>
<tr><td>
주소 : ${map.ADDRESS }
</td></tr>

<tr><td>

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

<input type="button" onclick="msg()" name="" value="변경"/>
</td></tr>

<tr><td>
알람 동의 여부 : ${map.ALARM_CONSENT }
</td></tr>
<tr><td>
가입 일자 : <fmt:formatDate value="${map.REGDATE }" pattern="yyyy-MM-dd"/>
</td></tr>
<tr><td>권한 : <c:choose>
	 <c:when test="${ '99' eq map.KIND}">
	관리자</td>
	 </c:when>
	 <c:when test="${ '0' eq map.KIND }" >
	개인회원</td>
	 </c:when>
	 <c:when test="${ '1' eq map.KIND }" >
	사업자 회원</td>
	</c:when>
	</c:choose>
</tr>
<tr><td>
<a href="/picksell/admin/member/orderList/${map.ID}">
회원 주문 내역 리스트
</a>
</td></tr>
<tr><td>
<a href="/picksell/admin/member/sellHistory/${map.ID}">
회원 판매 내역 리스트</a>
</td></tr>
<tr><td>
<a href="/picksell/admin/member/purchaseHistory/${map.ID}">
회원 구매 내역 리스트</a>
</td></tr>
<tr><td>
<a href="/picksell/admin/member/products/${map.ID}">
회원 판매 글 리스트</a>
</td></tr>
</table>
</div>
<div id="hiddenPage"> 

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
</body>
</html>
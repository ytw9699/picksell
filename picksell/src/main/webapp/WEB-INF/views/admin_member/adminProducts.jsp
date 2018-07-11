<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

.main{
   margin-left: 300px; /* Same as the width of the sidenav */
   

}

</style>
<head>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 중 리스트</title>
</head>
<body>
<h1>현재 판매 중인 상품 글 리스트</h1>
<div class="main">
<c:choose>
	<c:when test="${ 0 eq total }">
	 판매 중인 상품이 없습니다.
	 
	</c:when>
	<c:when test="${0 lt total }">

<table  border="1px" align="center" style="text-align:center">
 	<tr>
 	 	<th>INDEX</th>
 	    <th>상품 번호</th>
 		<th>카테고리 번호</th>
 		<th>판매자 ID</th>
 		<th>판매 상태</th>
 		<th>글 제목</th>
 		<th>글 내용</th>
 		<th>조회수</th>
 		<th>상품 수</th>
 		<th>상품 가격</th>
 		<th>게시글 상태</th>
 		<th>상품 등록 날짜</th>
 	</tr>
 
 	<c:forEach var="maplist" items="${maplist }" varStatus="i">
 	<tr>
 	 <td>${i.count }</td>
 	 <td>${maplist.PRODUCT_NUM}</td>
 	 <td>${maplist.CATEGORY_NUM }</td>
 	 <td>${maplist.SELLER_ID }</td>
 	 <td>판매중</td>
 	 <td><a href="/picksell/products/detail/${maplist.CATEGORY_NUM }/${maplist.PRODUCT_NUM}">${maplist.SUBJECT }</a></td>
 	 <td>${maplist.CONTENT }</td>
 	 <td>${maplist.HITCOUNT }</td>
 	 <td>${maplist.STOCK }</td>
 	 <td>${maplist.PRICE }</td>
 	 <td>
 	 <c:choose>
 	 <c:when test="${ '0'  eq maplist.BOARD_STATUS}">
 	 정 상
 	 <br>
 	 <input type="submit"  value="블라인드" onclick="location.href='/picksell/admin/member/productBlindProc?id=${maplist.SELLER_ID}&product_num=${maplist.PRODUCT_NUM }&status=1'" />
 	 </c:when>
 	 <c:when test="${ '1' eq maplist.BOARD_STATUS }">
 	 블라인드
 	 <br> 
 	 <input type="submit"  value="정상처리" onclick="location.href='/picksell/admin/member/productBlindProc?id=${maplist.SELLER_ID}&product_num=${maplist.PRODUCT_NUM }&status=0'" />
 	 </c:when>
 	 </c:choose></td>
 	 <td><fmt:formatDate  value="${maplist.PRODUCT_REGDATE }" pattern="yyyy-MM-dd" /></td>
 	</tr>
 	</c:forEach>	
</table>
</c:when>
</c:choose>
</div>
</body>
</html>
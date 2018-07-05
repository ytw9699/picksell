<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

.main{
   margin-left: 160px; /* Same as the width of the sidenav */
   

}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 중 리스트</title>
</head>
<body>
<c:choose>
	<c:when test="${ 0 eq total }">
	 판매 중인 상품이 없습니다.
	 
	</c:when>
</c:choose>
<table border="1px" align="center" style="text-align: center">
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
 		<th>상품 등록 날짜</th>
 	</tr>
 
 	<c:forEach var="maplist" items="${maplist }" varStatus="i">
 	<tr>
 	 <td>${i.index +1 }</td>
 	 <td>${maplist.PRODUCT_NUM}</td>
 	 <td>${maplist.CATEGORY_NUM }</td>
 	 <td>${maplist.SELLER_ID }</td>
 	 <td>${maplist.DEAL_STATUS }</td>
 	 <td><a href="">${maplist.SUBJECT }</a></td>
 	 <td>${maplist.CONTENT }</td>
 	 <td>${maplist.HITCOUNT }</td>
 	 <td>${maplist.STOCK }</td>
 	 <td>${maplist.PRICE }</td>
 	 <td>${maplist.PRODUCT_REGDATE }</td>
 	</tr>
 	</c:forEach>	

</table>
</body>
</html>
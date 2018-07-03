<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 구매 내역 리스트</title>
</head>
<body>
<table border="1px" align="center">
 	<tr>
 	    <th>번호</th>
 		<th>구매 내역 번호</th>
 		<th>구매자 ID</th>
 		<th>판매자 ID</th>
 		<th>상품 번호</th>
 		<th>구매 개수</th>
 		<th>구매 금액</th>
 	    <th>구매 상태</th>
 		<th>구매 일자</th>
 	</tr>
 	<c:forEach var="maplist" items="${maplist }" varStatus="i">
 		<tr>
 		<td>${i.index+1 }</td>
 		<td>${maplist.BH_NUM }</td>
 		<td>${maplist.BUYER_ID }</td>
 		<td>${maplist.SELLER_ID }</td>
 		<td>${maplist.PRODUCT_NUM }</td>
 		<td>${maplist.ORDER_QUANTITY }</td>
 		<td>${maplist.TOTAL_PRICE }</td>
 		<td>${maplist.STATUS }</td>
 		<td>구매 일자</td>
 		</tr>
 	</c:forEach>
 	</table>
</body>
</html>
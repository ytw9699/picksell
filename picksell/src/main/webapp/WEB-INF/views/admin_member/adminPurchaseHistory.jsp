<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.main{
  margin-left : 250px;
}
table.PurchaseHistory{
 border-collaspe : separate;
 boarder-spacing : 1px;
 text-align: center;
 line-height : 1.5;
 margin: 10px 5px;

}
table.PurchaseHistory th {
    width: 200px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #337ab7;
   
}
table.PurchaseHistory td {
    width: 200px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #fff;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 구매 내역 리스트</title>
</head>
<body>
<div class="main">
<h1 style="margin-left: 208px;">관리자 구매 내역 리스트</h1>
<c:choose>
<c:when test="${0 eq total }">
구매 내역이 없습니다.
</c:when>
<c:when test="${0 lt total }">
<table  class="PurchaseHistory">
 	<tr>
 	    <th>번호</th>
 		<th>구매 내역 번호</th>
 		<th>판매자 ID</th>
 		<th>상품 번호</th>
 		<th>구매 개수</th>
 		<th>구매 금액</th>
 	    <th>구매 상태</th>
 		<th>구매 일자</th>
 	</tr>
 	<c:forEach var="maplist" items="${maplist }" varStatus="i">
 		<tr>
 		<td>${i.count}</td>
 		<td>${maplist.ORDERLIST_NUM }</td>
 		<td>${maplist.SELLER_ID }</td>
 		<td>${maplist.PRODUCT_NUM }</td>
 		<td>${maplist.ORDER_QUANTITY }</td>
 		<td>${maplist.TOTAL_PRICE }</td>
 		<td>구매완료</td>
 		<td>
 			<fmt:formatDate value="${maplist.STEP1_DATE }" pattern="yy-MM-dd hh:mm"></fmt:formatDate>
 		</td>
 		</tr>
 	</c:forEach>
 	</table>
 </c:when>
</c:choose>
</div>
</body>
</html>
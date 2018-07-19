<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
 padding-right: 36px;

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
<h1 style="margin-left:6px;border-bottom: 2px solid #7151fc;
    padding: 10px;
    text-align: center;">구매 내역 리스트</h1>
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
 		<th>상품 명</th>
 		<th>구매 금액</th>
 	    <th>구매 상태</th>
 		<th>구매 일자</th>
 	</tr>
 	<c:forEach var="maplist" items="${maplist }" varStatus="maplistStatus">
 		<tr>
 		<td>${maplistStatus.count}</td>
 		<td>${maplist.ORDER_NUM }</td>
 		<td>${maplist.SELLER_ID }
 		<td> <c:forEach items="${SubList[maplistStatus.index]}" var="i" varStatus="Sub" begin="0" end="0" >${i.SUBJECT } 
 		<c:if test="${(fn:length(SubList[maplistStatus.index])-1) > 0 }">
 			외 ${fn:length(SubList[maplistStatus.index])-1}건
 			</c:if>
 		</c:forEach></td>
 		<td>${maplist.TOTAL_PRICE }(원)</td>
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
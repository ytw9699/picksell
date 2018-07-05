<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.main {
   margin-left: 160px; /* Same as the width of the sidenav */
   
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">
<c:choose>
<c:when test="${0 eq map.mapSize }">
주문내역이 없습니다.
</c:when>
<c:when test="${0 lt map.mapSize }">
주문건수는 총 ${map.mapSize }건 입니다.
<table border="1px" align="center">
	<thead>
	<tr>
	<th>주문 번호</th>
	<th>주문자 ID</th>
	<th>주문량</th>
	<th>상품번호</th>
	<th>판매자 ID</th>
	<th>주문 금액</th>
	<th>주문 상태</th>
	<th>주문 일자</th>
	</tr>
<c:forEach var="i" items="${maplist}">
	<tr>
	 <td>${i.ORDER_NUM}</td>
	 <td>${i.BUYER_ID }
	 <td>${i.ORDER_QUANTITY}</td>
	 <td>${i.PRODUCT_NUM}</td>
	 <td>${i.SELLER_ID }</td>
	 <td>${i.TOTAL_PRICE }(원)</td>
	  <c:choose>
	  <c:when test="${i.STATUS eq 0 }">
	  <td>입금대기</td>
	  <td><fmt:formatDate value="${i.STEP1_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	  <c:when test="${i.STATUS eq 1 }">
	  <td>입금완료 및 배송대기중</td>
	  <td><fmt:formatDate value="${i.STEP2_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when> 
	  <c:when test="${i.STATUS eq 2 }">
	  <td>배송 및 인수확인 대기</td>
	  <td><fmt:formatDate value="${i.STEP3_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	   <c:when test="${i.STATUS eq 3 }">
	  <td>인수확인 및 거래완료</td>
	  <td><fmt:formatDate value="${i.STEP4_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	   <c:when test="${i.STATUS eq 4 }">
	  <td>결제 취소</td>
	  <td><fmt:formatDate value="${i.CANCEL_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	
	  </c:choose>	 
	 </tr>
</c:forEach>
</table>
</c:when>
</c:choose>
</div>
</body>
</html>
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
<script src="http://code.jquery.com/jquery-1.7.js"></script>
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
</c:when>
</c:choose>
<table>
<c:forEach var="orderList" items="${orderList}" varStatus="orderListStatus">
     <br>상품주문번호: ${orderList.ORDER_NUM } </br><!-- 상품 주문번호 -->
     <c:choose>
	  <c:when test="${i.STATUS eq '0' }">
	    <br>입금대기</br>
	  <td><fmt:formatDate value="${i.STEP1_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	  <c:when test="${i.STATUS eq '1' }">
	  <td>입금완료 및 배송대기중</td>
	  <td><fmt:formatDate value="${i.STEP2_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when> 
	  <c:when test="${i.STATUS eq '2' }">
	  <td>배송 및 인수확인 대기</td>
	  <td><fmt:formatDate value="${i.STEP3_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	   <c:when test="${i.STATUS eq '3' }">
	  <td>인수확인 및 거래완료</td>
	  <td><fmt:formatDate value="${i.STEP4_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	   <c:when test="${i.STATUS eq '44' }">
	  <td>결제 취소</td>
	  <td><fmt:formatDate value="${i.CANCEL_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	  </c:choose>	 
     <br>주문일: ${ps_order.STEP1_DATE} </br><!-- 주문일(입금대기날짜) -->
<c:forEach var="joinMap" items="${orderSubList[orderListStatus.index]}">
 <br>사진: 
	<a href="/picksell/mypage/orderDetail/${joinMap.ORDER_NUM }">
		<img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 200px;" />
	</a>
 </br>
 <br>제목: ${joinMap.SUBJECT }</br>
 <br>상품금액: ${joinMap.PRICE }</br>
</c:forEach> 
</c:forEach>
</table>

<%-- <table border="1px" align="center">
	<thead>
	<tr>
	<th>주문 번호</th>
	<th>주문자 ID</th>
	<th>상품 번호</th>
	<th>상품 명</th>
	<th>판매자 ID</th>
	<th>총 주문 금액</th>
	<th>주문 상태</th>
	<th>주문 일자</th>

	 </tr>
	</thead>
 <tr>
<c:forEach var="i" items="${orderList}" varStatus="orderListStatus">
	
	 <td>${i.ORDER_NUM}</td>
	 <td>${i.BUYER_ID }</td>
	 <td>${i.PRODUCT_NUM }</td>
	
	
	<td id="PRODUCT_NUM">
	<c:forEach var = "j" items="${adminOrderSubList}" varStatus="${map.mapSize.index }">
	${adminOrderSubList.SUBJECT }
	</c:forEach>
	</td>

	 <td>판매자 ID</td>
	 <td>총 주문 금액 </td>
	  <c:choose>
	  <c:when test="${i.STATUS eq '0' }">
	  <td>입금대기</td>
	  <td><fmt:formatDate value="${i.STEP1_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	  <c:when test="${i.STATUS eq '1' }">
	  <td>입금완료 및 배송대기중</td>
	  <td><fmt:formatDate value="${i.STEP2_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when> 
	  <c:when test="${i.STATUS eq '2' }">
	  <td>배송 및 인수확인 대기</td>
	  <td><fmt:formatDate value="${i.STEP3_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	   <c:when test="${i.STATUS eq '3' }">
	  <td>인수확인 및 거래완료</td>
	  <td><fmt:formatDate value="${i.STEP4_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	   <c:when test="${i.STATUS eq '44' }">
	  <td>결제 취소</td>
	  <td><fmt:formatDate value="${i.CANCEL_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
	  </c:when>
	  </c:choose>	 
     </tr>
    
    </c:forEach>

</table>
--%>
</div>
</body>
</html>
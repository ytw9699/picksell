<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.main {
   margin-left: 300px; /* Same as the width of the sidenav */
   
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

<c:forEach var="orderList" items="${orderList}" varStatus="orderListStatus">

<p>주문번호 ${orderList.ORDER_NUM }
<p>전체 주문 금액 ${orderList.TOTAL_PRICE}
 
    <c:forEach items="${adminOrderSubList[orderListStatus.index]}" var="i" varStatus="Sub">
	
  	 <!-- 상품 주문번호 -->
<p>제품명 ${i.SUBJECT } <c:if test="${(fn:length(adminOrderSubList[orderListStatus.index])-1) > 0 }">
 			외 ${fn:length(adminOrderSubList[orderListStatus.index])-1}건
 		</c:if>
    </c:forEach>
      <c:choose>
	  <c:when test="${orderList.STATUS eq '0' }">
	 입금대기
	<fmt:formatDate value="${orderList.STEP1_DATE }" pattern="yy-MM-dd HH:mm:ss"/>
	  </c:when>
	  <c:when test="${orderList.STATUS eq '1' }">
	  입금완료 및 배송대기중 
	  <fmt:formatDate value="${orderList.STEP2_DATE }" pattern="yy-MM-dd HH:mm:ss"/>
	  </c:when> 
	  <c:when test="${orderList.STATUS eq '2' }">
	   배송 및 인수확인 대기
	   <fmt:formatDate value="${orderList.STEP3_DATE }" pattern="yy-MM-dd HH:mm:ss"/>
	  </c:when>
	   <c:when test="${orderList.STATUS eq '3' }">
	인수확인 및 거래완료
	  <fmt:formatDate value="${orderList.STEP4_DATE }" pattern="yy-MM-dd HH:mm:ss"/>
	  </c:when>
	   <c:when test="${orderList.STATUS eq '44' }">
	  결제 취소
	 <fmt:formatDate value="${orderList.CANCEL_DATE }" pattern="yy-MM-dd HH:mm:ss"/>
	  </c:when>
	  </c:choose>	  	 
	${orderList.STEP1_DATE} <!-- 주문일(입금대기날짜) -->              
<hr>

   </c:forEach>

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
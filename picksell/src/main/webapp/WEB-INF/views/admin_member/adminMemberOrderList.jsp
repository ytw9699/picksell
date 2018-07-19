<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.main {
   margin-left: 250px; /* Same as the width of the sidenav */
   
}
.oneline{
	padding : 1px;
	border : 1px;
}

</style>
<head>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript">

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">
<h1 style="border-bottom: 2px solid #7151fc;
    padding: 10px;
    text-align: center;">주문 리스트</h1>
<div class="totalOrder">
<c:choose>
<c:when test="${0 eq map.mapSize }">
<h3 >주문 내역이 없습니다.</h3>
</c:when>
<c:when test="${0 lt map.mapSize }">
<h3>총 주문 수는 <font color="red">${map.mapSize }</font> 건 입니다. (최신순)</h3>
</c:when>
</c:choose>
</div>

<c:forEach var="orderList" items="${orderList}" varStatus="orderListStatus">
<div class="oneLine" id="oneLine" style="padding:8px;background-color:#fbfbfb;border-radius:25px;">
<p>주문번호  : ${orderList.ORDER_NUM }
<p>전체 주문 금액 : ${orderList.TOTAL_PRICE} (원)
 
    <c:forEach items="${adminOrderSubList[orderListStatus.index]}" var="i" varStatus="Sub" begin="0" end="0" >
	
  	 <!-- 상품 주문번호 -->
<p>제품명 : ${i.SUBJECT }
 <c:if test="${(fn:length(adminOrderSubList[orderListStatus.index])-1) > 0 }">
 			외 ${fn:length(adminOrderSubList[orderListStatus.index])-1}건
 		</c:if>
    </c:forEach>
   <p>거래 상태 :
      <c:choose>
	  <c:when test="${orderList.STATUS eq '0' }">
	<font color="red">입금대기</font>
	<fmt:formatDate value="${orderList.STEP1_DATE }" pattern="yy/MM/dd HH:mm:ss"/>
	  </c:when>
	  <c:when test="${orderList.STATUS eq '1' }">
	<font color="red">입금완료 및 배송대기중</font> 
	  <fmt:formatDate value="${orderList.STEP2_DATE }" pattern="yy/MM/dd HH:mm:ss"/>
	  </c:when> 
	  <c:when test="${orderList.STATUS eq '2' }">
	  <font color="red"> 배송 및 인수확인 대기</font>
	   <fmt:formatDate value="${orderList.STEP3_DATE }" pattern="yy/MM/dd HH:mm:ss"/>
	  </c:when>
	   <c:when test="${orderList.STATUS eq '3' }">
	 <font color="red">인수확인 및 거래완료</font>
	  <fmt:formatDate value="${orderList.STEP4_DATE }" pattern="yy/MM/dd HH:mm:ss"/>
	  </c:when>
	   <c:when test="${orderList.STATUS eq '44' }">
	 <font color="red">결제 취소</font>
	 <fmt:formatDate value="${orderList.CANCEL_DATE }" pattern="yy/MM/dd HH:mm:ss"/>
	  </c:when>
	  </c:choose>	  	 
	
	<p>최초 주문 시간 : <fmt:formatDate value="${orderList.STEP1_DATE}" pattern="yy/MM/dd HH:mm"/><!-- 주문일(입금대기날짜) -->              
	
</div>
<br>
 </c:forEach>



</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!-- 수정 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문조회</title>
<style>
</style>
</head>
<body>
<table>
<c:if test="${fn:length(orderList) > 0}">
<c:forEach var="ps_order" items="${orderList}" varStatus="orderListStatus">
<BR/>"하나의 주문시작 ======================================================="
	<a href="/picksell/mypage/orderDetail/${ps_order.ORDER_NUM }">
	주문 내역 상세보기
	</a>
     <c:if test="${ps_order.STATUS == '0'}">
		<br> 거래상태:입금대기중
		</c:if>
		<c:if test="${ps_order.STATUS == '1'}">
		<br>거래상태:입금 완료 및 배송 대기중
		</c:if>
		<c:if test="${ps_order.STATUS == '2'}">
		<br>거래상태:배송 및 인수확인 대기
		</c:if>
		<c:if test="${ps_order.STATUS == '3'}">
		<br>거래상태:인수확인 및 거래완료
		</c:if>
		<c:if test="${ps_order.STATUS == '44'}">
		<br>거래상태:결제취소
		</c:if>
     <br>주문일: ${ps_order.STEP1_DATE}<!-- 주문일(입금대기날짜) -->
<c:forEach var="joinMap" items="${orderSubList[orderListStatus.index]}">
 <br>사진: ${joinMap.ORDER_NUM }
		<img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 200px;" />
 <br>제목: ${joinMap.SUBJECT }
 <br>상품금액: ${joinMap.PRICE }
 <br>갯수: ${joinMap.ORDER_QUANTITY}
</c:forEach> 
"하나의 주문 끝==========================================================="<BR/>
</c:forEach>

	<%-- <c:forEach var="order" items="${orderList}">
	<tr>
		<br>${order.ORDER_NUM}</br>
		<br>
			<a href="/picksell/mypage/orderDetail/${order.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${order.FIRST_IMG }" style="width: 200px;" />
			</a>
		</br>
		<br><a href="/picksell/mypage/orderDetail/${order.PRODUCT_NUM }">${order.SUBJECT }</a></br>
		<br><fmt:formatNumber value="${order.PRICE }" pattern="#,###.##" /> 원</br>
		
	</tr>
	</c:forEach> --%>
</c:if>
<c:if test="${fn:length(orderList) < 1}">
<p>내역이 없습니다</p>
</c:if>
</table>
</body>
</html>

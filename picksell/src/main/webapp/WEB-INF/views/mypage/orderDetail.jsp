<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문조회 디테일</title>
<style>
</style>
</head>
<body>
<table>
<c:if test="${fn:length(orderDetail) > 0}">
			주문일: 			${orderDetail.STEP1_DATE}<br>
			주문번호:    		${orderDetail.ORDER_NUM}<br>
			<c:if test="${orderDetail.STATUS == '0'}">
			거래상태:입금대기중<br>
			</c:if>
			<c:if test="${orderDetail.STATUS == '1'}">
			거래상태:입금 완료 및 배송 대기중<br>
			</c:if>
			<c:if test="${orderDetail.STATUS == '2'}">
			거래상태:배송 및 인수확인 대기<br>
			</c:if>
			<c:if test="${orderDetail.STATUS == '3'}">
			거래상태:인수확인 및 거래완료<br>
			</c:if>
			<c:if test="${orderDetail.STATUS == '44'}">
			거래상태:결제취소<br>
			</c:if>
			구매자아이디:		${orderDetail.BUYER_ID}<br>
			총결제금액:		${orderDetail.TOTAL_PRICE}<br>
			배송지:			${orderDetail.DESTINATION}<br>
			계좌번호: 			${orderDetail.ACCOUNT}<br>
			예금주:			${orderDetail.ACCOUNT_NAME}<br>
			은행명:	 		${orderDetail.BANK}<br>
			택배사:  			${orderDetail.ELIVERY_COMPANY}<br>
			송장번호:  		${orderDetail.INVOICE_NUM}<br>
			
<c:if test="${fn:length(orderSubDetail) > 0}">
<c:forEach var="joinMap" items="${orderSubDetail}">
<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
 <br>사진: ${joinMap.ORDER_NUM }
		<img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 200px;" />
</a>
<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
 <br>제목: ${joinMap.SUBJECT }
</a>
 <br>가격: ${joinMap.PRICE }
 <br>수량: ${joinMap.ORDER_QUANTITY}
</c:forEach> 
</c:if>
</c:if>
</table>
</body>
</html>

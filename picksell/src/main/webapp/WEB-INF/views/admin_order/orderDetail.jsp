<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.main{ 
 	 margin-left: 200px;  
 	} 
</style>
</head>
<body>



<div class="main">

<c:forEach var="orderDetail" items="${orderDetail}" varStatus="status">

 <c:if test="${status.first}">

<p>주문번호 : ${orderDetail.ORDER_NUM}</p>


<p>주문자 ID : ${orderDetail.BUYER_ID}</p>


<p>배송상태 : 

		<c:if test="${orderDetail.STATUS eq 0}">
		입금대기
		</c:if>
		<c:if test="${orderDetail.STATUS eq 1}">
		입금완료 및 배송대기중
		</c:if>
		<c:if test="${orderDetail.STATUS eq 2}">
		배송 및 인수확인 대기
		</c:if>
		<c:if test="${orderDetail.STATUS eq 3}">
		인수확인 및 거래완료 
		</c:if>
		<c:if test="${orderDetail.STATUS eq 4}">
		결제취소
		</c:if>

</p>
<ul>
	
</ul>

<p>총가격 : ${orderDetail.TOTAL_PRICE}</p>


<p>목적지 : ${orderDetail.DESTINATION}</p>


<p>계좌번호 : ${orderDetail.ACCOUNT} </p>


<p>예금주 : ${orderDetail.ACCOUNT_NAME}</p>

<p>은행 : ${orderDetail.BANK}</p>


<p>주문번호 : ${orderDetail.PURCHASE_NUM}</p>


<p>배송사 : ${orderDetail.DELIVERY_COMPANY}</p>


<p>송장번호 : ${orderDetail.INVOICE_NUM}</p>


<p>주문 단계별 시각</p>
<ul>
	<li>주문시각 : ${orderDetail.STEP1_DATE}</li>
	<li>입금시각 : ${orderDetail.STEP2_DATE}</li>
	<li>배송시각 : ${orderDetail.STEP3_DATE}</li>
	<li>인수시각 : ${orderDetail.STEP4_DATE}</li>
	<li>취소시각 : ${orderDetail.CANCEL_DATE}</li>
</ul>

<p>배송시 주의사항 : ${orderDetail.PRECAUSIONS}</p>

<p>구매자 연락처 : ${orderDetail.BUYER_PHONE}</p>

<p>구매자 이메일 : ${orderDetail.BUYER_EMAIL}</p>

 </c:if>

<p>상품번호 : ${orderDetail.PRODUCT_NUM}</p>

<p>주문개수 : ${orderDetail.ORDER_QUANTITY}</p>

<%-- <c:if test="${status.first}"> --%>

<p>판매자 ID : ${orderDetail.SELLER_ID}</p>
	
<%-- </c:if> --%>

</c:forEach>
</div>
</body>
</html>
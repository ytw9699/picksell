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
<title>주문상세</title>
<style>
</style>
</head>
<body>
<h2>주문상세</h2>
<table>
<c:if test="${fn:length(saleDetail) > 0}">
			<h4>
			주문일: 		     <fmt:formatDate value="${saleDetail.STEP1_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			입금완료일: 		 <fmt:formatDate value="${saleDetail.STEP2_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			배송시작일: 		 <fmt:formatDate value="${saleDetail.STEP3_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			인수확인 및 거래 완료일:<fmt:formatDate value="${saleDetail.STEP4_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			주문취소일: 		 <fmt:formatDate value="${saleDetail.CANCEL_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			주문번호:    		${saleDetail.ORDER_NUM} /
			<c:if test="${saleDetail.STATUS == '0'}">
			거래상태:입금대기중
			</c:if>
			<c:if test="${saleDetail.STATUS == '1'}">
			거래상태:입금 완료 및 배송 대기중
			</c:if>
			<c:if test="${saleDetail.STATUS == '2'}">
			거래상태:배송 및 인수확인 대기
			</c:if>
			<c:if test="${saleDetail.STATUS == '3'}">
			거래상태:인수확인 및 거래완료
			</c:if>
			<c:if test="${saleDetail.STATUS == '44'}">
			거래상태:결제취소
			</c:if>
			</h4>
			<c:if test="${fn:length(saleSubDetail ) > 0}">
			<c:forEach var="joinMap" items="${saleSubDetail }">
			<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
		    <img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 200px;" />
		    /${joinMap.SUBJECT }
			</a>
			/${joinMap.PRICE }원
			/갯수: ${joinMap.ORDER_QUANTITY}개
			 <br>
			</c:forEach>
			<h4>결제 정보</h4>
			결제수단: 계좌이체  
			<br>총 상품 가격: ${saleDetail.TOTAL_PRICE - 2500} 원
			<br>배송비: 2500 원
			<br>총결제금액: ${saleDetail.TOTAL_PRICE} 원
			</c:if>
			<br>
			<h4>받는사람 정보</h4>  
			수령인 : ${saleDetail.ACCOUNT_NAME}<br>
			연락처:  ${saleDetail.BUYER_PHONE}<br>
			이메일:  ${saleDetail.BUYER_EMAIL}<br>
			배송지:   ${saleDetail.DESTINATION}<br>
			배송시 주의사항: ${saleDetail.PRECAUTIONS}<br>
			택배사:  		${saleDetail.DELIVERY_COMPANY}<br>
			송장번호:  	${saleDetail.INVOICE_NUM}<br>
			
</c:if>
</table>
</body>
</html>

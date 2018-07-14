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
<title>주문 내역 상세 및 배송 조회</title>
<style>
</style>
</head>
<body>
<script>
	//알람입력
	function alarmInsert(ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND){
	var allData = "ALARM_TARGET="+ALARM_TARGET+"&ALARM_VARIABLE1="+ALARM_VARIABLE1+"&ALARM_VARIABLE2="+ALARM_VARIABLE2+"&ALARM_WRITER="+ALARM_WRITER+"&ALARM_KIND="+ALARM_KIND;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmInsert",
				dataType : 'json',
				data : allData,
				success : function(data){
					alert("알람입력완료");
				}
			});
	}   
	function canclePs_order(ORDER_NUM, BUYER_ID, SELLER_ID, PRODUCT_NUM){
		alert("1");
		var allData = "ORDER_NUM="+ORDER_NUM+"&PRODUCT_NUM="+PRODUCT_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/canclePs_order",
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(SELLER_ID, ORDER_NUM, ORDER_NUM, BUYER_ID, "10");
						//location.reload();
					}
				});	
	}
	
</script>
<h2>주문 내역 상세 및 배송 조회</h2>
<table>
<c:if test="${fn:length(orderDetail) > 0}">
			<h4>
			주문일: 		     <fmt:formatDate value="${orderDetail.STEP1_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			입금완료일: 		 <fmt:formatDate value="${orderDetail.STEP2_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			배송시작일: 		 <fmt:formatDate value="${orderDetail.STEP3_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			인수확인 및 거래 완료일:<fmt:formatDate value="${orderDetail.STEP4_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			주문취소일: 		 <fmt:formatDate value="${orderDetail.CANCEL_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
			판매자 아이디:      ${orderDetail.SELLER_ID} <br>
			주문번호:    		${orderDetail.ORDER_NUM} <br>
			<c:if test="${orderDetail.STATUS == '0'}">
			거래상태:입금대기중
			</c:if>
			<c:if test="${orderDetail.STATUS == '1'}">
			거래상태:입금 완료 및 배송 대기중
			</c:if>
			<c:if test="${orderDetail.STATUS == '2'}">
			거래상태:배송 및 인수확인 대기
			</c:if>
			<c:if test="${orderDetail.STATUS == '3'}">
			거래상태:인수확인 및 거래완료
			</c:if>
			<c:if test="${orderDetail.STATUS == '44'}">
			거래상태:결제취소
			</c:if>
			</h4>
			<c:if test="${fn:length(orderSubDetail) > 0}">
			<c:forEach var="joinMap" items="${orderSubDetail}">
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
			<br>총 상품 가격: ${orderDetail.TOTAL_PRICE - 2500} 원
			<br>배송비: 2500 원
			<br>총결제금액: ${orderDetail.TOTAL_PRICE} 원
			</c:if>
			<br>
			<h4>받는사람 정보</h4>  
			수령인 : ${orderDetail.ACCOUNT_NAME}<br>
			연락처:  ${orderDetail.BUYER_PHONE}<br>
			이메일:  ${orderDetail.BUYER_EMAIL}<br>
			배송지:   ${orderDetail.DESTINATION}<br>
			배송시 주의사항: ${orderDetail.PRECAUTIONS}<br>
			택배사:  		${orderDetail.DELIVERY_COMPANY}<br>
			송장번호:  	${orderDetail.INVOICE_NUM}<br>
			<br>																								
			<input type ="button" value="주문취소" onclick="canclePs_order('${orderDetail.ORDER_NUM}','${orderDetail.BUYER_ID}','${orderDetail.SELLER_ID}','${orderDetail.PRODUCT_NUM}')"/>
</c:if>															
</table>
</body>
</html>

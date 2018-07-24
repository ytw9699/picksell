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
.bigWrapper{
    border: 1px solid gray;
    width: 100%;
    height: 1000px;
}
.headerClass{
	border: 1px solid gray;
	width: 97%;
	height: 10%
}
.orderClass{
	border: 1px solid gray;
	width: 97%;
	height: 30%
}
.tradeIClass{
	border: 1px solid gray;
	width: 97%;
	height: 30%
}
.deliveryClass{
	border: 1px solid gray;
	width: 97%;
	height: 30%
}
.status{
	 float: right;
	 width: 50%;
	 border: 1px solid gray;
}
.header{
	width: 50%;
	border: 1px solid gray;
}
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
					if(ALARM_KIND == "12"){
						alert("곧 관리자가 확인 후 입금완료 해드립니다");
					}
				}
			});
	}   
	function canclePs_order(ORDER_NUM, BUYER_ID, SELLER_ID, PRODUCT_NUM){
		//alert("1");
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
	
	function canclePs_order2(ORDER_NUM, BUYER_ID, SELLER_ID){
		//alert("2");
		var allData = "ORDER_NUM="+ORDER_NUM;
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
<div class="bigWrapper"> 
<c:if test="${fn:length(orderDetail) > 0}">
<div class="headerClass">
<span class="header">주문 내역 상세 및 배송 조회</span>
	<span class="status">거래상태:
        <c:if test="${orderDetail.STATUS == '0'}">
		입금대기중
		</c:if>
		<c:if test="${orderDetail.STATUS == '1'}">
		입금 완료 및 배송 대기중
		</c:if>
		<c:if test="${orderDetail.STATUS == '2'}">
		배송 및 인수확인 대기
		</c:if>
		<c:if test="${orderDetail.STATUS == '3'}">
		인수확인 및 거래완료
		인수확인 및 거래 완료일:<fmt:formatDate value="${orderDetail.STEP4_DATE}" pattern="yy년 MM월 dd일 hh:mm" />  <br>
		</c:if>
		<c:if test="${orderDetail.STATUS == '44'}">
		거래상태:결제취소  , 결제취소일: 		 <fmt:formatDate value="${orderDetail.CANCEL_DATE}" pattern="yy년 MM월 dd일 hh:mm" />  <br>
		</c:if>
	</span>
	<div>
		<input type ="button" value="입금완료" onclick="alarmInsert('admin','empty','empty','${sessionScope.sessionId}',12)"/>
		
		<c:if test="${fn:length(orderSubDetail) > 0}">
		<c:forEach var="joinMap" items="${orderSubDetail}" varStatus="status">
		<c:if test="${status.last}">
		 <c:if test="${orderDetail.STATUS == '0' || orderDetail.STATUS == '1'  || orderDetail.STATUS == '2'}">	
		 <c:if test="${joinMap.HOWTOSELL != '2'}">																							
		<input type ="button" value="결제취소" onclick="canclePs_order('${orderDetail.ORDER_NUM}','${orderDetail.BUYER_ID}','${joinMap.SELLER_ID}','${joinMap.PRODUCT_NUM}')"/>
		</c:if>
		<c:if test="${joinMap.HOWTOSELL == '2'}">																							
		<input type ="button" value="결제취소" onclick="canclePs_order2('${orderDetail.ORDER_NUM}','${orderDetail.BUYER_ID}','${joinMap.SELLER_ID}')"/>
		</c:if>
		<input type ="button" value="인수확인 및 거래완료" onclick="location.href ='/picksell/mypage/completing?ORDER_NUM=${orderDetail.ORDER_NUM}&BUYER_ID=${orderDetail.BUYER_ID}&SELLER_ID=${joinMap.SELLER_ID}'"/>
		</c:if>									
		</c:if>
		</c:forEach>
		</c:if>
	</div>
</div>
<div class="orderClass">
		<c:if test="${fn:length(orderSubDetail) > 0}">
		<span>주문정보</span>
		<div>
		<c:forEach var="joinMap" items="${orderSubDetail}" varStatus="status">
		<div>
		<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
	    <img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 200px;" />
	    /${joinMap.SUBJECT }
		</a>
		/<fmt:formatNumber value="${joinMap.PRICE}" pattern="#,###.##" /> 원 
		/${joinMap.ORDER_QUANTITY}개 
		/	판매자 ${joinMap.SELLER_ID} 
		 <br>
		 </div>
		</c:forEach>
		</div>
		</c:if>
		<span>
		주문번호:    		${orderDetail.ORDER_NUM} <br>
		주문일: 		     <fmt:formatDate value="${orderDetail.STEP1_DATE}" pattern="yy년 MM월 dd일 hh:mm" />  <br>
		</span>
</div>
<div class="tradeIClass">
		<span>결제 정보</span>
		<div>
		<span>결제수단: 계좌이체</span>
		<span>
		<c:if test="${orderDetail.STATUS != '0'}">
		<br>입금완료일: <fmt:formatDate value="${orderDetail.STEP2_DATE}" pattern="yy년 MM월 dd일 hh:mm" />  <br>
		</c:if>
		</span>
		</div>
		
		<div>
		<br>총 상품 가격:<fmt:formatNumber value="${orderDetail.TOTAL_PRICE - 2500}" pattern="#,###.##" /> 원 
		<br>배송비: 2,500 원
		<br>총결제금액: <fmt:formatNumber value="${orderDetail.TOTAL_PRICE}" pattern="#,###.##" /> 원
		</div> 
</div>
<div class="deliveryClass">
<span>받는사람 정보</span>  
<div>
		수령인 : ${orderDetail.ACCOUNT_NAME}<br>
		연락처:  ${orderDetail.BUYER_PHONE}<br>
		배송지:   ${orderDetail.DESTINATION}<br>


<div>
		배송시 주의사항: ${orderDetail.PRECAUTIONS}<br>
		택배사:  		${orderDetail.DELIVERY_COMPANY}<br>
		송장번호:  	${orderDetail.INVOICE_NUM}<br>
		<c:if test="${orderDetail.STATUS != '0' && orderDetail.STATUS != '1'}">
		배송시작일: 		 <fmt:formatDate value="${orderDetail.STEP3_DATE}" pattern="yy년 MM월 dd일 hh:mm" />  <br>
		<br>
		</c:if>	
</div>
</div>
</c:if>
</div>
</body>
</html>


	

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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>판매내역 상세 및 배송 조회</title>
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
						alarmInsert(BUYER_ID, ORDER_NUM, ORDER_NUM, SELLER_ID, "11");
						//location.reload();
					}
				});	
	}
	
	function canclePs_order2(ORDER_NUM, BUYER_ID, SELLER_ID){
		alert("2");
		var allData = "ORDER_NUM="+ORDER_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/canclePs_order",
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(BUYER_ID, ORDER_NUM, ORDER_NUM, SELLER_ID, "11");
						//location.reload();
					}
				});	
	}
	
</script>

<script>
var totalPRICE = Number(0);
var subtotalPRICE = Number('${saleDetail.TOTAL_PRICE}');
</script>
		
<h2>판매내역 상세 및 배송 조회</h2>
<table>
<c:if test="${fn:length(saleDetail) > 0}">
		<h4>
		고객의 주문일: 		  <fmt:formatDate value="${saleDetail.STEP1_DATE}" pattern="yy. MM. dd일 hh:mm" />  <br>
		고객의 입금완료일:    <fmt:formatDate value="${saleDetail.STEP2_DATE}" pattern="yy. MM. dd일 hh:mm" />  <br>
		배송시작일: 		 <fmt:formatDate value="${saleDetail.STEP3_DATE}" pattern="yy. MM. dd일 hh:mm" />  <br>
		인수확인 및 거래 완료일:<fmt:formatDate value="${saleDetail.STEP4_DATE}" pattern="yy. MM. dd일 hh:mm" />  <br>
		<c:if test="${saleDetail.CANCEL_DATE != null}">
		주문취소일: 		 <fmt:formatDate value="${saleDetail.CANCEL_DATE}" pattern="yy. MM. dd일 hh:mm" />  <br>
		</c:if>
		주문번호:    	${saleDetail.ORDER_NUM} /
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
		거래상태:<font color = "Red">결제취소</font> 
		</c:if>
		</h4>
		
		
		<c:if test="${fn:length(saleSubDetail ) > 0}">
		<c:forEach var="joinMap" items="${saleSubDetail }" varStatus="status">
		<c:if test="${status.first}">
		<script>
	    	function printTotal(){
	 		   document.getElementById('myPrice').innerHTML = totalPRICE;
	 		   document.getElementById('otherPrice').innerHTML = subtotalPRICE;
	 		}
		</script>
		</c:if>
		
		<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
	    <img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 200px;" />
	    ${joinMap.SUBJECT }
		</a>
		/<fmt:formatNumber value="${joinMap.PRICE }" pattern="#,###.##" /> 원
		/${joinMap.ORDER_QUANTITY}개
		<br>
         <script>
         totalPRICE += Number('${joinMap.PRICE}');
         </script>
         <c:if test="${status.last}">
    	 <script>
    	 subtotalPRICE = subtotalPRICE - totalPRICE -2500;
         </script>
         </c:if>
		 <c:if test="${status.last}">
		 <c:if test="${saleDetail.STATUS != '44'}">	
		 <c:if test="${joinMap.HOWTOSELL != '2'}">																							
		<input type ="button" value="판매취소" onclick="canclePs_order('${saleDetail.ORDER_NUM}','${saleDetail.BUYER_ID}','${joinMap.SELLER_ID}','${joinMap.PRODUCT_NUM}')"/>
		</c:if>
		<c:if test="${joinMap.HOWTOSELL == '2'}">																							
		<input type ="button" value="판매취소" onclick="canclePs_order2('${saleDetail.ORDER_NUM}','${saleDetail.BUYER_ID}','${joinMap.SELLER_ID}')"/>
		</c:if>
		<input type ="button" value="배송사항 입력" onclick="$('.deliveryDiv').show();"/>
			<div class="deliveryDiv">
			   <form action="/picksell/mypage/deliveryInsert" method="GET" id="deliveryForm">
					<input type="hidden" name="ORDER_NUM" value="${saleDetail.ORDER_NUM}" />
					<!-- 아래 2개의 값은 알람을 위해 전송 -->
					<input type="hidden" name="ALARM_TARGET" value="${saleDetail.BUYER_ID}" />
					<input type="hidden" name="ALARM_WRITER" value="${joinMap.SELLER_ID}" />
					택배사<input type="text" name="DELIVERY_COMPANY" /><br>
					송장번호<input type="text" name="INVOICE_NUM" />
					<input type="submit" value="입력" />
			   </form>
			</div>
		</c:if>
		</c:if>
		</c:forEach>
		</c:if>
		<h4>고객 결제 정보</h4>
		결제수단: 계좌이체
		<br>내가 판매한 상품의 총 금액:<span id="myPrice"></span>원
		<br>고객이 구매한 다른 판매자의 상품 금액:<span id="otherPrice"></span>원
		<br>배송비: 2,500 원
		<br>고객의 총 결제 금액:<fmt:formatNumber value="${saleDetail.TOTAL_PRICE }" pattern="#,###.##" /> 원 
		<br>
		<h4>받는사람 정보</h4>  
		수령인 : ${saleDetail.ACCOUNT_NAME}<br>
		연락처:  ${saleDetail.BUYER_PHONE}<br>
		이메일:  ${saleDetail.BUYER_EMAIL}<br>
		배송지:   ${saleDetail.DESTINATION}<br>
		배송시 주의사항: ${saleDetail.PRECAUTIONS}<br>
		택배사:  	${saleDetail.DELIVERY_COMPANY}<br>
		송장번호:  ${saleDetail.INVOICE_NUM}<br>
</c:if>
</table>
 <script>
  printTotal();
  </script>
  
  <script> 
  $(document).ready(function(){
	  $(".deliveryDiv").hide();
  });
  </script>
  
</body>
</html>

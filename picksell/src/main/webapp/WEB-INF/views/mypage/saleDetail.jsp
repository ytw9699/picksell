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
var totalPRICE = Number(0);

var subtotalPRICE = Number('${saleDetail.TOTAL_PRICE}');
//alert('${saleDetail.TOTAL_PRICE}');
   
</script>
		
<h2>판매내역 상세 및 배송 조회</h2>
<table>
<c:if test="${fn:length(saleDetail) > 0}">
		<h4>
		고객의 주문일: 		  <fmt:formatDate value="${saleDetail.STEP1_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
		고객의 입금완료일:    <fmt:formatDate value="${saleDetail.STEP2_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
		배송시작일: 		 <fmt:formatDate value="${saleDetail.STEP3_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
		인수확인 및 거래 완료일:<fmt:formatDate value="${saleDetail.STEP4_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
		<c:if test="${saleDetail.CANCEL_DATE != null}">
		주문취소일: 		 <fmt:formatDate value="${saleDetail.CANCEL_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />  <br>
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
		거래상태:결제취소
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
	    /${joinMap.SUBJECT }
		</a>
		/${joinMap.PRICE }원
		/갯수: ${joinMap.ORDER_QUANTITY}개
		<br>
		
         <script>
         totalPRICE += Number('${joinMap.PRICE}');
         alert(totalPRICE);
         </script>
         <c:if test="${status.last}">
    	 <script>
    	 subtotalPRICE = subtotalPRICE - totalPRICE -2500;
         </script>
         </c:if>
         
        <%--  <c:if test="${status.last}">
          <script>
          printTotal();
          </script>
         </c:if> --%>
		<!-- 	<script>
			    var totalPRICE = 0;
			    $(document).ready(function () {
					var PRICE = '${joinMap.PRICE}';
					totalPRICE = totalPRICE + eval(PRICE);
					$('#myPrice').html(totalPRICE);
			    });
			</script> -->
		</c:forEach>
		<h4>고객 결제 정보</h4>
		결제수단: 계좌이체
		<br>내가 판매한 상품의 총 금액:<span id="myPrice"></span>원
		<br>고객이 구매한 다른 판매자의 상품 금액:<span id="otherPrice"></span>원
		<br>배송비: 2500 원
		<br>고객의 총 결제 금액: ${saleDetail.TOTAL_PRICE} 원
		</c:if>
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
  alert(totalPRICE);
  alert(subtotalPRICE);
  
  </script>
</body>
</html>

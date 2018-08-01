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
<title></title>
<style>
.bigWrapper {
    width: 100%;
    height: 1000px;
    margin-bottom: 100px;
}
.paymentBinder {
    display: inline-block;
    width: 48%;
    float: left;
}
.headerClass {
    width: 97%;
    margin: 1%;
}
.orderClass {
    width: 97%;
    margin: 1%;
}
.tradeIClass {
    width: 97%;
    height: 25%;
    margin: 1%;
}
.deliveryClass{
	border: 1px solid gray;
	width: 97%;
	height: 25%;
	margin: 1%;
}
.status {
    width: 98%;
    margin: 1%;
    height: 53px;
}
.header {
    width: 80%;
    margin: 1%;
    display: block;
    border-bottom: 3px solid #ececec;
    color: #7151FC;
    padding: 15px 0 15px 20px;
    font-size: 20px;
}
.header2 {
    width: 80%;
    margin: 1%;
    display: block;
    border-bottom: 3px solid #ececec;
    padding: 15px 0 15px 20px;
    font-size: 19px;
}
.line {
    width: 80%;
    margin: 1%;
    height: 23px;
    border-bottom: 3px solid #ececec;
    color: #7151FC;
    padding: 15px 0 15px 20px;
    font-size: 20px;
}
.line2 {
    width: 90%;
    margin: 1%;
    height: 23px;
    border-bottom: 3px solid #ececec;
    color: #7151FC;
    padding: 15px 0 15px 20px;
    font-size: 20px;
    display: inline-block;
}
.rightLine {
    width: 23%;
    height: 23px;
    margin: 1%;
    padding: 15px 0 15px 20px;
    font-size: 16px;
    display: block;
}

.rightLineDeep {
    display: block;
}
.orderSubDetail {
    width: 95%;
    margin: 1%;
    border-bottom: 2px solid #dedede;
}
.td1 {
    width: 5%;
}

.orderInfoWrap {
    display: inline-block;
    width: 68%;
    border: 1px solid #d8d8d8;
    box-sizing: border-box;
    border-radius: 5px;
}
.paymentInfoWrap {
    width: 80%;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    margin: 1%;
    margin-left: 3%;
    display: inline-block;
}
.paymentInfoWrap2 {
    width: 100%;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    margin: 1%;
}
table.paytable {
    width: 100%;
}
td.subHeader {
    padding: 20px;
    color: #333;
    font-size: 20px;
}
td.product_noticeTEXT {
    color: #333;
    font-size: 18px;
    padding: 10px;
    padding-left: 20px;
}
td.product_valueTEXT {
    color: #333;
    font-size: 18px;
    padding: 10px;
    padding-right: 35px;
    text-align: right;
}
td.product_totalTEXT {
    color: #e31c1c;
    font-size: 18px;
    padding: 10px;
    padding-left: 20px;
    width: 45%;
}
td.product_total_valueTEXT {
    color: #e31c1c;
    font-size: 18px;
    padding: 10px;
    padding-right: 35px;
    text-align: right;
}
.header2.subheader {
    border-bottom: none;
}
input.statusBtn {
    transition: 0.3s;
    border: 1px solid #7151fc;
    background-color: white;
    color: #7151fc;
    padding: 10px;
    margin-right: 10px;
}
input.statusBtn:hover {
    background-color: #7151fc;
    color: white;
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
						alert("감사합니다 관리자가 확인 후 입금완료 해드리겠습니다.");
					}
				}
			});
	}   
	function canclePs_order(ORDER_NUM, BUYER_ID, SELLER_ID, PRODUCT_NUM){
		 if(confirm('정말 결제 취소하시겠습니까?')){
		var allData = "ORDER_NUM="+ORDER_NUM+"&PRODUCT_NUM="+PRODUCT_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/canclePs_order",
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(SELLER_ID, ORDER_NUM, ORDER_NUM, BUYER_ID, "10");
						alert("결제 취소 되었습니다");
						location.reload();
					}
				});
	}
	}
	
	function canclePs_order2(ORDER_NUM, BUYER_ID, SELLER_ID){
		 if(confirm('정말 결제 취소하시겠습니까?')){
		var allData = "ORDER_NUM="+ORDER_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/canclePs_order",
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(SELLER_ID, ORDER_NUM, ORDER_NUM, BUYER_ID, "10");
						alert("결제 취소 되었습니다");
						location.reload();
					}
				});	
	}
	}
</script>
<div class="bigWrapper"> 
<c:if test="${fn:length(orderDetail) > 0}">
<div class="headerClass">
<div class="header">
주문 내역 상세 및 배송 조회
</div>
	<div class="header2 subheader">
		<div class="status">거래상태:
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
		<fmt:formatDate value="${orderDetail.STEP4_DATE}" pattern="yy년 MM월 dd일 hh:mm" />  <br>
		</c:if>
		<c:if test="${orderDetail.STATUS == '44'}">
		결제취소 - <fmt:formatDate value="${orderDetail.CANCEL_DATE}" pattern="yy. MM. dd. hh:mm" />  <br>
		</c:if>
		</div >
	   <div class="status">
	   		 <c:if test="${orderDetail.STATUS == '0'}">
			<input type ="button" class="statusBtn" value="입금완료" onclick="alarmInsert('admin','empty','empty','${sessionScope.sessionId}',12)"/>
			</c:if>
			<c:if test="${fn:length(orderSubDetail) > 0}">
			<c:forEach var="joinMap" items="${orderSubDetail}" varStatus="status">
			<c:if test="${status.last}">
			 <c:if test="${orderDetail.STATUS == '0' || orderDetail.STATUS == '1'  || orderDetail.STATUS == '2'}">	
			 <c:if test="${joinMap.HOWTOSELL != '2'}">																							
			<input type ="button" value="결제취소" class="statusBtn" onclick="canclePs_order('${orderDetail.ORDER_NUM}','${orderDetail.BUYER_ID}','${joinMap.SELLER_ID}','${joinMap.PRODUCT_NUM}')"/>
			</c:if>
			<c:if test="${joinMap.HOWTOSELL == '2'}">																							
			<input type ="button" value="결제취소" class="statusBtn" onclick="canclePs_order2('${orderDetail.ORDER_NUM}','${orderDetail.BUYER_ID}','${joinMap.SELLER_ID}')"/>
			</c:if>
			<input type ="button" value="인수확인 및 거래완료" class="statusBtn" onclick="location.href ='/picksell/mypage/completing?ORDER_NUM=${orderDetail.ORDER_NUM}&BUYER_ID=${orderDetail.BUYER_ID}&SELLER_ID=${joinMap.SELLER_ID}'"/>
			</c:if>									
			</c:if>
			</c:forEach>
			</c:if>
	    </div >
	</div>
</div>
<div class="orderClass">
		<c:if test="${fn:length(orderSubDetail) > 0}">
		<div class="line">주문정보</div>
		<div class="rightLine">
		<span class="rightLineDeep">주문번호: ${orderDetail.ORDER_NUM}</span>
		<span>주문일: <fmt:formatDate value="${orderDetail.STEP1_DATE}" pattern="yy년 MM월 dd일 hh:mm" /></span>
		</div>
		<c:forEach var="joinMap" items="${orderSubDetail}" varStatus="status">
		<div class="orderSubDetail">
		<table>
		<tr>
		<td class="td1">
			<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
				<img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 100%; margin: 1%;" onerror="this.src='/picksell/resources/img/imgready.gif'">
			</a>
		</td>
		<td class="td1">
			${joinMap.SUBJECT}
		</td>
		<td class="td1">
		    <fmt:formatNumber value="${joinMap.PRICE}" pattern="#,###.##" /> 원 
		</td>
		<td class="td1">
		    ${joinMap.ORDER_QUANTITY}개 
		</td>
		<td class="td1">
			판매자 ${joinMap.SELLER_ID} 
		</td>
		</tr>
		</table>
		 </div>
		</c:forEach>
		</c:if>
		
</div>
<div class="tradeIClass">

	
	<div class="paymentBinder">
		<div class="line">결제 정보</div>
		<div class="paymentInfoWrap">
		<table class="paytable" cellpadding="0" cellspacing="0">
			<tbody>
			
			<c:if test="${orderDetail.STATUS != '0'}">
				<tr>
					<td class="product_noticeTEXT">입금 완료일 </td>
					<td class="product_valueTEXT"><fmt:formatDate value="${orderDetail.STEP2_DATE}" pattern="yy. MM. dd" />
					</td>
				</tr>
			</c:if>
					
			<tr>
				<td class="product_noticeTEXT">결제 수단 </td>
				<td class="product_valueTEXT">
				계좌 이체
				</td> 
			</tr>
			<tr>
				<td class="product_noticeTEXT">총 상품 금액</td>
				<td class="product_valueTEXT"><fmt:formatNumber value="${orderDetail.TOTAL_PRICE - 2500}" pattern="#,###.##" /> 원</td>
			</tr>
	
			<tr>
				<td class="product_noticeTEXT">배송비</td>
				<td class="product_valueTEXT">
				2,500 원
				</td>
			</tr>
			<tr>
				<td class="product_totalTEXT">총 결제금액</td>
				<td class="product_total_valueTEXT">
					<fmt:formatNumber value="${orderDetail.TOTAL_PRICE}" pattern="#,###.##" /> 원
				</td>
			</tr>
			
		</tbody></table>
	</div>
	</div><!-- paymentBinder end -->
	
	<div class="paymentBinder">
	<div class="line2">배송지 정보</div>
	<div class="paymentInfoWrap2">
		<table class="paytable" cellpadding="0" cellspacing="0">
			<tbody>
			
			<c:if test="${orderDetail.STATUS != '0' && orderDetail.STATUS != '1'}">
				<tr>
					<td class="product_noticeTEXT">배송시작일 </td>
					<td class="product_valueTEXT"><fmt:formatDate value="${orderDetail.STEP3_DATE}" pattern="yy년 MM월 dd일 hh:mm" />
					</td>
				</tr>
			</c:if>
					
			<tr>
				<td class="product_noticeTEXT">수령인 </td>
				<td class="product_valueTEXT">
					${orderDetail.ACCOUNT_NAME}
				</td> 
			</tr>
			<tr>
				<td class="product_noticeTEXT">연락처</td>
				<td class="product_valueTEXT">${orderDetail.BUYER_PHONE}</td>
			</tr>
			
			<tr>
				<td class="product_noticeTEXT">배송지</td>
				<td class="product_valueTEXT">
				 ${orderDetail.DESTINATION}
				</td>
			</tr>
			
			<tr>
				<td class="product_noticeTEXT">택배사</td>
				<td class="product_valueTEXT">
					${orderDetail.DELIVERY_COMPANY}
				</td>
			</tr>
			
			<tr>
				<td class="product_noticeTEXT">송장번호</td>
				<td class="product_valueTEXT">
					${orderDetail.INVOICE_NUM}
				</td>
			</tr>
			
			<tr>
				<td class="product_totalTEXT">배송시 주의사항</td>
				<td class="product_total_valueTEXT">
					${orderDetail.PRECAUTIONS}
				</td>
			</tr>
			
		</tbody></table>
		</div>
	</div><!-- paymentBinder end -->
</div>
</c:if>
</div>
</body>
</html>


	

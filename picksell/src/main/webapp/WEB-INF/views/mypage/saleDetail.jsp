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
.deliveryDiv{
	display: none;
	width: 300px;
    background-color: white;
    position: fixed;
    top: 40%;
    left: 40%;
    height: 100px;
    text-align: center;
    padding:20px;
}
.hiddenBackGround{
    width: 100%;
    background-color: #262626;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    opacity: 0.7;
    display: none;
}
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
    font-size: 19px;
}
.header2 {
    width: 80%;
    margin: 1%;
    display: block;
    border-bottom: 3px solid #ececec;
    padding: 15px 0 15px 20px;
    font-size: 20px;
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
	function closeDeliveryDiv(){
		$(".deliveryDiv").hide();
		$(".hiddenBackGround").hide();
		
	}
	function delivery(){
		$(".deliveryDiv").show();
		$(".hiddenBackGround").show();
		deliveryForm.DELIVERY_COMPANY.focus();
	}
	//알람입력
	function alarmInsert(ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND){
	var allData = "ALARM_TARGET="+ALARM_TARGET+"&ALARM_VARIABLE1="+ALARM_VARIABLE1+"&ALARM_VARIABLE2="+ALARM_VARIABLE2+"&ALARM_WRITER="+ALARM_WRITER+"&ALARM_KIND="+ALARM_KIND;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmInsert",
				dataType : 'json',
				data : allData,
				success : function(data){
					//alert("알람입력완료");
				}
			});
	}   
	function canclePs_order(ORDER_NUM, BUYER_ID, SELLER_ID, PRODUCT_NUM){
		 if(confirm('정말 판매 취소하시겠습니까?')){
		var allData = "ORDER_NUM="+ORDER_NUM+"&PRODUCT_NUM="+PRODUCT_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/canclePs_order",
					
					
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(BUYER_ID, ORDER_NUM, ORDER_NUM, SELLER_ID, "11");
						location.reload();
						alert("판매 취소 되었습니다");
					}
				});	
	}
	}
	function canclePs_order2(ORDER_NUM, BUYER_ID, SELLER_ID){
		 if(confirm('정말 판매 취소하시겠습니까?')){
		var allData = "ORDER_NUM="+ORDER_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/canclePs_order",
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(BUYER_ID, ORDER_NUM, ORDER_NUM, SELLER_ID, "11");
						location.reload();
						alert("판매 취소 되었습니다");
					}
				});	
		 }
	}
	
</script>

<script>
var totalPRICE = Number(0);
//var subtotalPRICE = Number('${saleDetail.TOTAL_PRICE}');
</script>

<div class="bigWrapper"> 
<c:if test="${fn:length(saleDetail) > 0}">
<div class="headerClass">
<div class="header">
판매내역 상세 및 배송 조회
</div>
	<div class="header2 subheader">
		<div class="status">거래상태 : 
		<c:if test="${saleDetail.STATUS == '0'}">
		입금대기중
		</c:if>
		<c:if test="${saleDetail.STATUS == '1'}">
		입금 완료 및 배송 대기중
		</c:if>
		<c:if test="${saleDetail.STATUS == '2'}">
		배송중 및 인수확인 대기
		</c:if>
		<c:if test="${saleDetail.STATUS == '3'}">
		인수확인 및 거래완료  
		<fmt:formatDate value="${saleDetail.STEP4_DATE}" pattern="yy. MM. dd일 hh:mm" />  <br>
		</c:if>
		<c:if test="${saleDetail.STATUS == '44'}">
		결제취소 -<fmt:formatDate value="${saleDetail.CANCEL_DATE}" pattern="yy. MM. dd일 hh:mm" />  <br>
		</c:if>
		</div>
		<div class="status">
		<c:if test="${fn:length(saleSubDetail) > 0}">
			<c:forEach var="joinMap" items="${saleSubDetail}" varStatus="status">
		 <c:if test="${status.last}">
		 <c:if test="${saleDetail.STATUS == '0' || saleDetail.STATUS == '1'  || saleDetail.STATUS == '2'}">
		 <c:if test="${joinMap.HOWTOSELL != '2'}">																							
		<input type ="button" value="판매취소" class="statusBtn" onclick="canclePs_order('${saleDetail.ORDER_NUM}','${saleDetail.BUYER_ID}','${joinMap.SELLER_ID}','${joinMap.PRODUCT_NUM}')"/>
		</c:if>
		<c:if test="${joinMap.HOWTOSELL == '2'}">																							
		<input type ="button" value="판매취소" class="statusBtn" onclick="canclePs_order2('${saleDetail.ORDER_NUM}','${saleDetail.BUYER_ID}','${joinMap.SELLER_ID}')"/>
		</c:if>
		<input type ="button" value="배송사항 입력" class="statusBtn" onclick="delivery();"/> 
		<div class="hiddenBackGround" onclick="closeDeliveryDiv()"></div>
			<div class="deliveryDiv">
			   <form action="/picksell/mypage/deliveryInsert" method="GET" id="deliveryForm">
					<input type="hidden" name="ORDER_NUM" value="${saleDetail.ORDER_NUM}" />
					<!-- 아래 2개의 값은 알람을 위해 전송 -->
					<input type="hidden" name="ALARM_TARGET" value="${saleDetail.BUYER_ID}" />
					<input type="hidden" name="ALARM_WRITER" value="${joinMap.SELLER_ID}" />
					택배사<input type="text" name="DELIVERY_COMPANY"/><br>
					송장번호<input type="text" name="INVOICE_NUM" /><br>
					<input type="submit" class="statusBtn" value="입력" />
					<input type="button" class="statusBtn" value="취소" onclick="closeDeliveryDiv()"/>
			   </form>
			</div>
		</c:if>
		</c:if>
		</c:forEach>
		</c:if>
		 </div >
		</div>
		</div>
<div class="orderClass">	
	<c:if test="${fn:length(saleSubDetail) > 0}">
		<div class="line">받은 주문 정보</div>
		<div class="rightLine">
		<span class="rightLineDeep">주문번호: ${saleDetail.ORDER_NUM}</span>
		<span>고객의 주문일: <fmt:formatDate value="${saleDetail.STEP1_DATE}" pattern="yy. MM. dd일 hh:mm" /> </span>
		</div>
		<c:forEach var="joinMap" items="${saleSubDetail }" varStatus="status">
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
		</tr>
		</table>
		 </div>
		</c:forEach>
		</c:if>
</div>
<div class="tradeIClass">
		<div class="paymentBinder">
		<div class="line">판매 정보</div>
		<div class="paymentInfoWrap">
		<table class="paytable" cellpadding="0" cellspacing="0">
			<tbody>
			
	<c:if test="${saleDetail.STATUS != '0'}">
		<tr>
			<td class="product_noticeTEXT">입금 완료일 </td>
			<td class="product_valueTEXT"><fmt:formatDate value="${saleDetail.STEP2_DATE}" pattern="yy. MM. dd" />
			</td>
		</tr>
	</c:if>
	
			<tr>
				<td class="product_noticeTEXT">고객 결제 수단 </td>
				<td class="product_valueTEXT">
				계좌 이체
				</td> 
			</tr>
			
			<tr>
				<td class="product_noticeTEXT">총 상품 금액</td>
				<td class="product_valueTEXT" id="myPrice"></td>
			</tr>
			<tr>
				<td class="product_totalTEXT">총 판매 금액</td>
				<td class="product_total_valueTEXT" id="myPrice2">
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
			
		<c:if test="${saleDetail.STATUS != '0' && saleDetail.STATUS != '1'}">
			<tr>
				<td class="product_noticeTEXT">배송시작일 </td>
				<td class="product_valueTEXT"><fmt:formatDate value="${saleDetail.STEP3_DATE}" pattern="yy년 MM월 dd일 hh:mm" />
				</td>
			</tr>
		</c:if>
		
		<tr>
				<td class="product_noticeTEXT">수령인 </td>
				<td class="product_valueTEXT">
					${saleDetail.ACCOUNT_NAME}
				</td> 
			</tr>
			<tr>
				<td class="product_noticeTEXT">연락처</td>
				<td class="product_valueTEXT">${saleDetail.BUYER_PHONE}</td>
			</tr>
			
			<tr>
				<td class="product_noticeTEXT">배송지</td>
				<td class="product_valueTEXT">
				 ${saleDetail.DESTINATION}
				</td>
			</tr>
			
			<tr>
				<td class="product_noticeTEXT">택배사</td>
				<td class="product_valueTEXT">
					${saleDetail.DELIVERY_COMPANY}
				</td>
			</tr>
			
			<tr>
				<td class="product_noticeTEXT">송장번호</td>
				<td class="product_valueTEXT">
					${saleDetail.INVOICE_NUM}
				</td>
			</tr>
			
			<tr>
				<td class="product_totalTEXT">배송시 주의사항</td>
				<td class="product_total_valueTEXT">
					${saleDetail.PRECAUTIONS}
				</td>
			</tr>
			
		</tbody></table>
		</div>
	</div><!-- paymentBinder end -->
</div>
		
		</c:if>
</div>
<c:forEach var="joinMap" items="${saleSubDetail }" varStatus="status">
       <script>
       	totalPRICE += Number('${joinMap.PRICE}');
       </script>
</c:forEach>
 	<script>
		function printTotal(){
		   document.getElementById('myPrice').innerHTML = totalPRICE;
		   document.getElementById('myPrice2').innerHTML = totalPRICE;
		}
		 printTotal();
  	</script>
</body>
</html>

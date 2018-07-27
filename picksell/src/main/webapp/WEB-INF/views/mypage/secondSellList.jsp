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
table.purchaseTABLE {
    width: 105%;  
}
.next {
    width: 80%;
    margin: 0 auto;
    margin-left: 0%;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 8%;
    font-size: 14px;
}
.subjectTd {
    width: 16%;
    font-size: 17px;
    text-align: center;
}
.tdtd {
    width: 12%;
    font-size: 17px;
    text-align: center;
}
.tbodys{
width: 10%;
margin-top: 10%;
}
.confirm-auth-box {
    color: #7151FC;
    border-bottom: 2px solid #ececec;
    padding: 15px 0 15px 20px;
    font-size: 26px;
    margin: 0;
    width: 25%;
        margin-bottom: 21px;
}
}
</style>
</head>
<body>
<script>
	function refusalApprove(SELLER_ID, CATEGORY_NUM, PRODUCT_NUM, BUYER_ID){
		var allData = "PRODUCT_NUM="+PRODUCT_NUM+"&BUYER_ID="+BUYER_ID;
		$.ajax({
			type : "GET",
			url : "/picksell/mypage/refusalApprove",
			dataType : 'json',
			data : allData,
			success : function(data){
				alarmInsert(BUYER_ID, CATEGORY_NUM, PRODUCT_NUM, SELLER_ID, "5");
				location.reload();
			}
		});	
	}
	function alarmInsert(ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND){
	var allData = "ALARM_TARGET="+ALARM_TARGET+"&ALARM_VARIABLE1="+ALARM_VARIABLE1+"&ALARM_VARIABLE2="+ALARM_VARIABLE2+"&ALARM_WRITER="+ALARM_WRITER+"&ALARM_KIND="+ALARM_KIND;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmInsert",
				dataType : 'json',
				data : allData,
				success : function(data){
				}
			});	
	}
	function deletesecondSellList(PURCHASE_NUM, SELLER_ID, CATEGORY_NUM, PRODUCT_NUM, BUYER_ID){
		var allData = "PURCHASE_NUM="+PURCHASE_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/deletesecondSellList",
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(SELLER_ID, CATEGORY_NUM, PRODUCT_NUM, BUYER_ID, "7");
						location.reload();
					}
				});	
	}
	
	//(판매자가)구매신청 수락
//onclick="purchaseApprove(this,'${purchase.PURCHASE_NUM}','${purchase.BUYER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.SELLER_ID }','watingAccept${status.index+1}','completedAccept${status.index+1}');" /></td>
function purchaseApprove(eventElement, purchaseNumber, buyer, category_num, product_num, sessionId,watingAccept,completedAccept){
	var target = document.getElementById(watingAccept);
	var params = "pn="+product_num+"&purnum="+purchaseNumber+"&buyer="+buyer;
	$.ajax({
		type : "POST",
		url : "/picksell/products/purchaseApproveProc",
		dataType : 'json',
		data : params,
		success : function(data){
			
	if(data.resultCode == 'success'){
		alarmInsert(buyer, category_num, product_num,sessionId,"2");
		alert(data.resultMsg);
		$(eventElement).parents('td').html("<input type='button' value='수락 취소' class='next' onclick=purchaseApproveCancel(this,"+purchaseNumber+",'"+buyer+"',"+category_num+","+product_num+",'"+sessionId+"','"+completedAccept+"','"+watingAccept+"'); />");
		$(target).parents('td').html("<div id='"+completedAccept+"'>수락 완료</div>");
	}else if(data.resultCode == 'fail'){
		alert(data.resultMsg);
	}
		}
	});
}
	
//(판매자가)구매신청 수락 취소
function purchaseApproveCancel(eventElement, purchaseNumber, buyer, category_num, product_num, sessionId,completedAccept,watingAccept){
	var target = document.getElementById(completedAccept);
	var params = "pn="+product_num+"&purnum="+purchaseNumber+"&buyer="+buyer;
	$.ajax({
	type : "POST",
	url : "/picksell/products/purchaseApproveCancelProc",
	dataType : 'json',
	data : params,
	success : function(data){
		if(data.resultCode == 'success'){
			alert(data.resultMsg);
    		 alarmInsert(buyer, category_num, product_num,sessionId,"8");        
    		 
			$(eventElement).parents('td').html("<input type='button' value='요청 수락' class='next' onclick=purchaseApprove(this,"+purchaseNumber+",'"+buyer+"',"+category_num+","+product_num+",'"+sessionId+"','"+watingAccept+"','"+completedAccept+"'); />");
			$(target).parents('td').html("<div id='"+watingAccept+"'>수락 대기중</div>");
		}else if(data.resultCode == 'fail'){
			alert(data.resultMsg);
		}
	}
	});
}
</script>
<div class="confirm-auth-box">중고 판매 요청 리스트</div>
<div class="purchaseList">	
<table class="purchaseTABLE" cellpadding="0" cellspacing="0">
<c:if test="${fn:length(secondSellList) > 0}">
	<c:forEach var="purchase" items="${secondSellList}" varStatus="status">
	<tbody class="tbodys">
	<tr>
		<td class="tdtd">
			<a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${purchase.FIRST_IMG }" style="width: 90%; margin: 1%;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
			</a>
		</td>
		<td class="subjectTd"><a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }">${purchase.SUBJECT }</a></td>
		<td class="tdtd"><fmt:formatNumber value="${purchase.PRICE }" pattern="#,###.##" /> 원</td>
		<td class="tdtd">요청일 <fmt:formatDate value="${purchase.REGDATE}" pattern="yy. MM. dd " /></td>
		<c:if test="${purchase.STATUS == '0'}">
		<td class="tdtd"><div id="watingAccept${status.index+1}">수락 대기중</div></td>
		</c:if>
		<c:if test="${purchase.STATUS == '1'}"> 
		<td class="tdtd"><div id="completedAccept${status.index+1}">수락 완료</div></td>
		</c:if>								
		<td class="tdtd">구매자 ${purchase.BUYER_ID}</td>
	<c:if test="${purchase.STATUS == 0 }">							
	<td class="tdtd"><input type="button" value="요청 수락" class="next" id ="accept" onclick="purchaseApprove(this,'${purchase.PURCHASE_NUM}','${purchase.BUYER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.SELLER_ID }','watingAccept${status.index+1}','completedAccept${status.index+1}');" /></td>
	</c:if>
	<c:if test="${purchase.STATUS == 1 }">																		
	<td class="tdtd"><input type="button" value="수락 취소" class="next" onclick="purchaseApproveCancel(this,'${purchase.PURCHASE_NUM}','${purchase.BUYER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.SELLER_ID }','completedAccept${status.index+1}','watingAccept${status.index+1}');" /></td>
	</c:if>  										
	<td class="tdtd"><input type="button" value="요청 거부" class="next" id="refusal" onclick="refusalApprove('${purchase.SELLER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.BUYER_ID}');" /></td>
	</tr>
	</tbody>														
	</c:forEach>
</c:if>
</table>
</div>
<c:if test="${fn:length(secondSellList) < 1}">
<span class="hasNoOrderList">내역이 없습니다.</span>
</c:if>
</body>
</html>

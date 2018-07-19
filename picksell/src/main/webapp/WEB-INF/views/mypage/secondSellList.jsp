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
		$(eventElement).parents('td').html("<input type='button' value='수락 취소' onclick=purchaseApproveCancel(this,"+purchaseNumber+",'"+buyer+"',"+category_num+","+product_num+",'"+sessionId+"','"+completedAccept+"','"+watingAccept+"'); />");
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
    		 
			$(eventElement).parents('td').html("<input type='button' value='요청 수락' onclick=purchaseApprove(this,"+purchaseNumber+",'"+buyer+"',"+category_num+","+product_num+",'"+sessionId+"','"+watingAccept+"','"+completedAccept+"'); />");
			$(target).parents('td').html("<div id='"+watingAccept+"'>수락 대기중</div>");
		}else if(data.resultCode == 'fail'){
			alert(data.resultMsg);
		}
	}
	});
}
	
</script>
<h2>중고 판매 요청 리스트</h2> 
<table>
<c:if test="${fn:length(secondSellList) > 0}">
	<tr>
		<td>사진</td>
		<td>제목</td>
		<td>가격</td>
		<td>구매자 아이디</td>
		<td>요청 날짜</td>
		<td>요청 상태</td>
		<td>수락or취소</td>
		<td>거부</td>
	</tr>

	<c:forEach var="purchase" items="${secondSellList}" varStatus="status">
	<tr>
		<td>
			<a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${purchase.FIRST_IMG }" style="width: 200px;" />
			</a>
		</td>
		<td><a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }">${purchase.SUBJECT }</a></td>
		<td><fmt:formatNumber value="${purchase.PRICE }" pattern="#,###.##" /> 원</td>
		<td>${purchase.BUYER_ID}</td>
		<td><fmt:formatDate value="${purchase.REGDATE}" pattern="yy. MM. dd. hh:mm" /></td>
		<c:if test="${purchase.STATUS == '0'}">
		<td><div id="watingAccept${status.index+1}">수락 대기중</div></td>
		</c:if>
		<c:if test="${purchase.STATUS == '1'}"> 
		<td><div id="completedAccept${status.index+1}">수락 완료</div></td>
		</c:if>								
		
	<c:if test="${purchase.STATUS == 0 }">							
	<td><input type="button" value="요청 수락" id ="accept" onclick="purchaseApprove(this,'${purchase.PURCHASE_NUM}','${purchase.BUYER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.SELLER_ID }','watingAccept${status.index+1}','completedAccept${status.index+1}');" /></td>
	</c:if>
	<c:if test="${purchase.STATUS == 1 }">																		
	<td><input type="button" value="수락 취소" onclick="purchaseApproveCancel(this,'${purchase.PURCHASE_NUM}','${purchase.BUYER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.SELLER_ID }','completedAccept${status.index+1}','watingAccept${status.index+1}');" /></td>
	</c:if>  										
	<td><input type="button" value="수락 거부" id="refusal" onclick="refusalApprove('${purchase.SELLER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.BUYER_ID}');" /></td>
	</tr> 															
	<c:if test="${purchase.STATUS == '1'}">
<!-- <script>
	document.getElementById("purchase"+${status.index+1}).disabled = false;
</script> -->
</c:if>
	</c:forEach>

</c:if>
<c:if test="${fn:length(secondSellList) < 1}">
<p>요청 내역이 없습니다.</p>
</c:if>
</table>
</body>
</html>

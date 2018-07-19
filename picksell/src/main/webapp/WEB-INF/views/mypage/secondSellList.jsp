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
	function purchaseApprove(eventElement, purchaseNumber, buyer, category_num, product_num, sessionId){
		var params = "pn="+product_num+"&purnum="+purchaseNumber+"&buyer="+buyer;
		$.ajax({
			type : "POST",
			url : "/picksell/products/purchaseApproveProc",
			dataType : 'json',
			data : params,
			success : function(data){
				
				//만약에 수락이 정상적으로 이루어져서 임의로 만든 resultCode 가 'success' 를 담았다면,
				if(data.resultCode == 'success'){
					alarmInsert(buyer, category_num, product_num,sessionId,"2");
					alert(data.resultMsg);
					$(eventElement).parents('td').html('<input type="button" value="수락취소" onclick="purchaseApproveCancel(this,'+data.purchase_num+','+data.buyerID+');" />');
				//만약에 수락이 중복되어 임의로 만든 resultCode 가 'fail' 를 담았다면,
				}else if(data.resultCode == 'fail'){
					alert(data.resultMsg);
				}
				
				//document.location.href='/picksell/products/detail/${category_num}/${product_num}';
				
				
			}
		});
	}
	
</script>
<h2>중고 구매 판매 리스트</h2> 
<table>
<c:if test="${fn:length(secondSellList) > 0}">
	<tr>
		<td>사진</td>
		<td>제목</td>
		<td>가격</td>
		<td>구매자 아이디</td>
		<td>요청 날짜</td>
		<td>요청 상태</td>
		<td>수락</td>
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
		<td>수락 대기중</td>
		</c:if>
		<c:if test="${purchase.STATUS == '1'}">
		<td>수락 완료</td>
		</c:if>								
														
	<td><input type="button" value="수락" id ="accept" onclick="purchaseApprove(this,'${purchase.PURCHASE_NUM}','${purchase.BUYER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.SELLER_ID }');" /></td>
	<td><input type="button" value="취소" id ="cancel" onclick="deletePurchaseList('${purchase.PURCHASE_NUM }','${purchase.SELLER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.BUYER_ID}');" /></td>
	<td><input type="button" value="거부" id ="refusal" onclick="deletesecondSellList('${purchase.PURCHASE_NUM }','${purchase.SELLER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.BUYER_ID}');" /></td>
	</tr> 
	<c:if test="${purchase.STATUS == '1'}">
<script>
	document.getElementById("purchase"+${status.index+1}).disabled = false;
</script>
</c:if>
	</c:forEach>

</c:if>
<c:if test="${fn:length(secondSellList) < 1}">
<p>요청 내역이 없습니다.</p>
</c:if>
</table>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!-- 수정 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매내역</title>
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
	function deletePurchaseList(PURCHASE_NUM, SELLER_ID, CATEGORY_NUM, PRODUCT_NUM, BUYER_ID){
		var allData = "PURCHASE_NUM="+PURCHASE_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/deletePurchaseList",
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(SELLER_ID, CATEGORY_NUM, PRODUCT_NUM, BUYER_ID, "7");
						location.reload();
					}
				});	
	}
	
</script>
<h2>중고 구매 신청 리스트</h2> 
<table>
<c:if test="${fn:length(purchaseList) > 0}">
	<tr>
		<td>사진</td>
		<td>제목</td>
		<td>가격</td>
		<td>신청날짜</td>
		<td>구매 요청 상태</td>
		<td>판매자 아이디</td>
		<td>취소</td>
		<td>구매하기</td>
	</tr>

	<c:forEach var="purchase" items="${purchaseList}">
	<tr>
		<td>
			<a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${purchase.FIRST_IMG }" style="width: 200px;" />
			</a>
		</td>
		<td><a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }">${purchase.SUBJECT }</a></td>
		<td><fmt:formatNumber value="${purchase.PRICE }" pattern="#,###.##" /> 원</td>
		<td><fmt:formatDate value="${purchase.REGDATE}" pattern="yy년 MM월 dd일 hh:mm" /></td>
		<c:if test="${purchase.STATUS == '0'}">
		<td>구매 요청 수락 대기중</td>
		</c:if>
		<c:if test="${purchase.STATUS == '1'}">
		<td>구매 요청 수락 완료</td>
		</c:if>																	
		<td>${purchase.SELLER_ID }</td>
		<td><input type="button" value="취소" id ="cancel" onclick="deletePurchaseList('${purchase.PURCHASE_NUM }','${purchase.SELLER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.BUYER_ID}');" /></td>
		<td><input type="button" value="구매" id ="purchase" disabled="disabled" onclick="location.href = '/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }'"/></td>
	</tr> 
	<c:if test="${purchase.STATUS == '1'}">
<script>
	document.getElementById("purchase").disabled = false;//
</script>
</c:if>
	</c:forEach>

</c:if>
<c:if test="${fn:length(purchaseList) < 1}">
<p>구매 요청 내역이 없습니다. 일반상품글에서 구매 요청을 해주시기 바랍니다.</p>
</c:if>
</table>
</body>
</html>

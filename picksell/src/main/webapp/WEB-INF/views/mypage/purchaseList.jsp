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
<h2>일반 상품 안전 구매 신청 리스트</h2> 
<table>
<c:if test="${fn:length(purchaseList) > 0}">
	<tr>
		<td>대표이미지</td>
		<td>제목</td>
		<td>가격</td>
		<td>신청날짜</td>
		<td>구매 요청 상태</td>
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
		<td>${purchase.REGDATE }</td>
		<c:if test="${purchase.STATUS == '0'}">
		<td>구매 요청 수락 대기중</td>
		</c:if>
		<c:if test="${purchase.STATUS == '1'}">
		<td>구매 요청 수락 완료</td>
		</c:if>
		<td><input type="button" value="취소" id ="cancel" onclick="location.href = '/picksell/mypage/deletePurchaseList/${purchase.PURCHASE_NUM }'"/></td>
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

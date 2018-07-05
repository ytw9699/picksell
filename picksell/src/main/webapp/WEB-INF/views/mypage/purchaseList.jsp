<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매내역</title>
<style>
</style>
</head>
<body>
구매 신청 리스트 입니다
<table>
<c:if test="${purchaseList.size() > 0}">
	<tr>
		<td>대표이미지</td>
		<td>제목</td>
		<td>가격</td>
		<td>신청날짜</td>
		<td>신청상태</td>
		<td>구매하기</td>
		<td>거래상태</td>
	</tr>

	<c:forEach var="purchase" items="${purchaseList}">
	<tr>
		<td>
			<a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }/1">
			<img src="/picksell/resources/productUpload/${purchase.FIRST_IMG }" style="width: 200px;" />
			</a>
		</td>
		<td><a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }/1">${purchase.SUBJECT }</a></td>
		<td><fmt:formatNumber value="${purchase.PRICE }" pattern="#,###.##" /> 원</td>
		<td>${purchase.REGDATE }</td>
		<c:if test="${purchase.STATUS == '0'}">
		<td>구매 요청 수락 대기중</td>
		</c:if>
		<c:if test="${purchase.STATUS == '1'}">
		<td>구매 요청 수락 완료</td>
		</c:if>
		<td><input type="button" value="구매" id ="purchase" disabled="disabled" /></td>
		<c:if test="${purchase.STATUS == '0'}">
		<td>입금 요청 전</td>
		</c:if>
		<c:if test="${purchase.PS_ORDER_STATUS == '0' && purchase.STATUS == '1'}">
		<td>입금대기중</td>
		</c:if>
		<c:if test="${purchase.PS_ORDER_STATUS == '1'}">
		<td>입금 완료 및 배송 대기중</td>
		</c:if>
		<c:if test="${purchase.PS_ORDER_STATUS == '2'}">
		<td>배송 및 인수확인 대기</td>
		</c:if>
		<c:if test="${purchase.PS_ORDER_STATUS == '3'}">
		<td>인수확인 및 거래완료</td>
		</c:if>
		<c:if test="${purchase.PS_ORDER_STATUS == '44'}">
		<td>결제취소</td>
		</c:if>
	</tr>
	</c:forEach>

</c:if>
<c:if test="${purchaseList.size() < 1}">
<p>내역이 없습니다 구매 신청을 해주세요</p>
</c:if>
</table>
<c:if test="${purchase.STATUS == '1'}">
<script>
	document.getElementById("purchase").disabled = true;
</script>
</c:if>
</body>
</html>

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
<title>주문조회</title>
<style>
</style>
</head>
<body>
주문조회 리스트 입니다
<table>

	<tr>
		<td>상품 주문번호</td>
		<td>사진</td>
		<td>제목</td>
		<td>상품금액</td>
		<td>거래상태</td>
	</tr>

	<c:forEach var="order" items="${orderList}">
	<tr>
		<td>${order.ORDER_NUM}</td>
		<td>
			<a href="/picksell/products/detail/${order.CATEGORY_NUM }/${order.PRODUCT_NUM }/1">
			<img src="/picksell/resources/productUpload/${order.FIRST_IMG }" style="width: 200px;" />
			</a>
		</td>
		<td><a href="/picksell/products/detail/${order.CATEGORY_NUM }/${order.PRODUCT_NUM }/1">${order.SUBJECT }</a></td>
		<td><fmt:formatNumber value="${order.PRICE }" pattern="#,###.##" /> 원</td>
		
		<c:if test="${order.STATUS == '0'}">
		<td>입금대기중</td>
		</c:if>
		<c:if test="${order.STATUS == '1'}">
		<td>입금 완료 및 배송 대기중</td>
		</c:if>
		<c:if test="${order.STATUS == '2'}">
		<td>배송 및 인수확인 대기</td>
		</c:if>
		<c:if test="${order.STATUS == '3'}">
		<td>인수확인 및 거래완료</td>
		</c:if>
		<c:if test="${order.STATUS == '44'}">
		<td>결제취소</td>
		</c:if>
	</tr>
	</c:forEach>

</c:if>
<c:if test="${orderList.size() < 1}">
<p>내역이 없습니다</p>
</c:if>
</table>
</body>
</html>

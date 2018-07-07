<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <!-- 수정 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매내역</title>
<style>
</style>
</head>
<body>
<h4>
<a href="/picksell/mypage/sellList/0">일반 상품</a>/
<a href="/picksell/mypage/sellList/1">픽셀플러스 상품</a>/
</h4>
<h4>
<a href="/picksell/mypage/sellList/0">판매중 상품</a>/
<a href="/picksell/mypage/sellList/1">거래중 상품</a>/
<a href="/picksell/mypage/sellList/2">판매 완료 상품</a>/
</h4>
<table>
<c:if test="${fn:length(sellList) > 0}">
	<tr>
		<td>판매상품</td>
		<td>대표이미지</td>
		<td>제목</td>
		<td>가격</td>
		<td>작성일</td>
	</tr>

	<c:forEach var="list" items="${sellList}">
	<tr>
		<td>
		<c:if test="${list.HOWTOSELL != '2'}">
		일반상품
		</c:if>
		<c:if test="${list.HOWTOSELL == '2'}">
		픽셀플러스 상품
		</c:if>
		</td>
		<td>
			<a href="/picksell/products/detail/${list.CATEGORY_NUM }/${list.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${list.FIRST_IMG }" style="width: 200px;" />
			</a>
		</td>
		<td><a href="/picksell/products/detail/${list.CATEGORY_NUM }/${list.PRODUCT_NUM }">${list.SUBJECT }</a></td>
		<td><fmt:formatNumber value="${list.PRICE }" pattern="#,###.##" /> 원</td>
		<td>${list.PRODUCT_REGDATE }</td>
	</tr>
	</c:forEach>

</c:if>
<c:if test="${fn:length(sellList) < 1}">
<p>세션 아이디에 해당하는 판매 상품이 없습니다</p>
</c:if>
</table>
</body>
</html>

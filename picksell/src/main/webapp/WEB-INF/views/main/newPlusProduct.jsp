<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>

<style>
.productWrap {
    display: inline-block;
}
</style>
</head>
<body>

<p>new 새로 등록된 플러스 상품  전체</p>
<c:forEach var="pulsProduct" items="${plusProductList }" end="3">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/detail/${pulsProduct.CATEGORY_NUM }/${pulsProduct.PRODUCT_NUM }/1">
		<img src="/picksell/resources/productUpload/${pulsProduct.FIRST_IMG }" style="width: 200px;" />
		</a>
	</div>
	<div class="infoWrap">
		<span class="productSubject">${pulsProduct.SUBJECT }</span><br>
		<span class="productPrice">
		<fmt:formatNumber value="${pulsProduct.PRICE }" pattern="#,###.##" /> 원
		</span>
	</div>
</div>
</c:forEach>
</body>
</html>

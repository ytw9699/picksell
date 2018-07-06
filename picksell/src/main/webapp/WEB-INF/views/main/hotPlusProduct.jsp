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

<p>픽셀 플러스 인기상품  전체</p>
<a href="/picksell/hotPlusProduct/latest">모든상품</a>
<a href="/picksell/hotPlusProduct/latest">최신순</a>
<a href="/picksell/hotPlusProduct/HighPrice">높은가격순</a>
<a href="/picksell/hotPlusProduct/LowPrice">낮은가격순</a>

<c:forEach var="hotProduct" items="${hotProductList}">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/detail/${hotProduct.CATEGORY_NUM }/${hotProduct.PRODUCT_NUM }/1">
		<img src="/picksell/resources/productUpload/${hotProduct.FIRST_IMG }" style="width: 200px;" />
		</a>
	</div>
	<div class="infoWrap">
		<span class="productSubject">${hotProduct.SUBJECT }</span><br>
		<span class="productPrice">
		<fmt:formatNumber value="${hotProduct.PRICE }" pattern="#,###.##" /> 원
		</span>
		<br>
		<span>${hotProduct.PRODUCT_REGDATE }</span>
	</div>
</div>
</c:forEach>
</body>
</html>

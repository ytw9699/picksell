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

<p>픽셀 플러스 인기상품    <a href="/picksell/hotPlusProduct">전체보기</a></p>
<c:forEach var="hotProduct" items="${hotProductList}" end="3">
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
	</div>
</div>
</c:forEach>
<p>인기 카테고리</p>
<c:forEach var="hotCategory" items="${hotCategoryList }">
	<div class="productWrap">
	<div class="firstImgWrap">
		카테고리 이미지
	</div>
	<div class="infoWrap">
		<span class="productSubject">${hotCategory.CATEGORY_NAME }</span><br>
	</div>
</div>
</c:forEach>
<p>new 새로 등록된 플러스 상품  <a href="/picksell/products/plus">전체보기</a></p>
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
<p>new 새로 등록된 일반 상품  <a href="/picksell/products/goods">전체보기</a></p>
<c:forEach var="nomalProduct" items="${nomalProductList }" end="3">
<div class="productWrap">
<div class="firstImgWrap">
	<a href="/picksell/products/detail/${nomalProduct.CATEGORY_NUM }/${nomalProduct.PRODUCT_NUM }/1">
	<img src="/picksell/resources/productUpload/${nomalProduct.FIRST_IMG }" style="width: 200px;" />
	</a>
</div>
<div class="infoWrap">
	<span class="productSubject"><c:if test="${nomalProduct.PRODUCT_STATUS == '0'}">[미사용]</c:if>
	<c:if test="${nomalProduct.PRODUCT_STATUS == '1'}">[새상품]</c:if> ${nomalProduct.SUBJECT }</span><br>
	<span class="productPrice">
	<fmt:formatNumber value="${nomalProduct.PRICE }" pattern="#,###.##" /> 원
	</span>
</div>
</div>
</c:forEach>
</body>
</html>

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

<h3>픽셀 플러스 <font color="red">BEST</font> 인기 상품    <a href="/picksell/hotPlusProduct"><font color="red" size="2">전체보기</font></a></h3>
<c:forEach var="hotProduct" items="${hotProductList}" end="4" varStatus="status">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/detail/${hotProduct.CATEGORY_NUM }/${hotProduct.PRODUCT_NUM }">
		<img src="/picksell/resources/productUpload/${hotProduct.FIRST_IMG }" style="width: 200px;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
		</a>
	</div>
	<div class="infoWrap">
		<span class="productSubject"><font color="red" size="4">${status.index+1}.</font>${hotProduct.SUBJECT }</span><br>
		<span class="productPrice">
		<fmt:formatNumber value="${hotProduct.PRICE }" pattern="#,###.##" /> 원
		</span>
	</div>
</div>
</c:forEach>

<h3>픽셀 플러스<font color="red">BEST</font> 카테고리 <a href="/picksell/products/plus"><font color="red" size="2">전체보기</font></a></h3>
<c:forEach var="hotCategory" items="${hotCategoryList }" varStatus="status" end="4">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/plus?ca=${hotCategory.CATEGORY_NUM }">
		<img src="/picksell/" style="width: 200px;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
		</a>
	</div>
	<div class="infoWrap">
		<a href="/picksell/products/plus?ca=${hotCategory.CATEGORY_NUM }">
		<span class="productSubject"><font color="red" size="4">${status.index+1}.</font>[#${hotCategory.CATEGORY_NAME }]</span><br>
		</a>
	</div>
</div>
</c:forEach>
<h3>NEW 픽셀 플러스 상품  <a href="/picksell/products/plus"><font color="red" size="2">전체보기</font></a></h3>
<c:forEach var="pulsProduct" items="${plusProductList }" end="4">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/detail/${pulsProduct.CATEGORY_NUM }/${pulsProduct.PRODUCT_NUM }">
		<img src="/picksell/resources/productUpload/${pulsProduct.FIRST_IMG }" style="width: 200px;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
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
<h3>NEW 일반 상품  <a href="/picksell/products/goods"><font color="red" size="2">전체보기</font></a></h3>
<c:forEach var="nomalProduct" items="${nomalProductList }" end="4">
<div class="productWrap">
<div class="firstImgWrap">
	<a href="/picksell/products/detail/${nomalProduct.CATEGORY_NUM }/${nomalProduct.PRODUCT_NUM }">
	<img src="/picksell/resources/productUpload/${nomalProduct.FIRST_IMG }" style="width: 200px;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
	</a>
</div>
<div class="infoWrap">
	<span class="productSubject"><c:if test="${nomalProduct.PRODUCT_STATUS == '0'}"><font size="1">[미사용]</font></c:if>
	<c:if test="${nomalProduct.PRODUCT_STATUS == '1'}"><font size="1">[새상품]</font></c:if> ${nomalProduct.SUBJECT }</span><br>
	<span class="productPrice">
	<fmt:formatNumber value="${nomalProduct.PRICE }" pattern="#,###.##" /> 원
	</span>
</div>
</div>
</c:forEach>
</body>
</html>

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
<title>메인</title>
<style>
.productWrap {
    display: inline-block;
}
</style>
</head>
<body>
<p>인기 카테고리</p>
<c:forEach var="nomalProduct" items="${nomalProductList }">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/detail/${nomalProduct.CATEGORY_NUM }/${nomalProduct.PRODUCT_NUM }/1">
		<img src="/picksell/resources/productUpload/${nomalProduct.FIRST_IMG }" style="width: 200px;" />
		</a>
	</div>
	<div class="infoWrap">
		<span class="productSubject">${nomalProduct.SUBJECT }</span><br>
		<span class="productPrice">
		<fmt:formatNumber value="${nomalProduct.PRICE }" pattern="#,###.##" /> 원
		</span>
	</div>
</div>
</c:forEach>
<p>픽셀 플러스 인기상품</p>
<c:forEach var="nomalProduct" items="${nomalProductList }">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/detail/${nomalProduct.CATEGORY_NUM }/${nomalProduct.PRODUCT_NUM }/1">
		<img src="/picksell/resources/productUpload/${nomalProduct.FIRST_IMG }" style="width: 200px;" />
		</a>
	</div>
	<div class="infoWrap">
		<span class="productSubject">${nomalProduct.SUBJECT }</span><br>
		<span class="productPrice">
		<fmt:formatNumber value="${nomalProduct.PRICE }" pattern="#,###.##" /> 원
		</span>
	</div>
</div>
</c:forEach>
<p>new 새로 등록된 플러스 상품</p>
<c:forEach var="nomalProduct" items="${nomalProductList }">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/detail/${nomalProduct.CATEGORY_NUM }/${nomalProduct.PRODUCT_NUM }/1">
		<img src="/picksell/resources/productUpload/${nomalProduct.FIRST_IMG }" style="width: 200px;" />
		</a>
	</div>
	<div class="infoWrap">
		<span class="productSubject">${nomalProduct.SUBJECT }</span><br>
		<span class="productPrice">
		<fmt:formatNumber value="${nomalProduct.PRICE }" pattern="#,###.##" /> 원
		</span>
	</div>
</div>
</c:forEach>
<p>new 새로 등록된 일반 상품</p>
<c:forEach var="nomalProduct" items="${nomalProductList }">
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

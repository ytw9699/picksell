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
<title>mainSearch</title>
<style>
.productWrap {
    display: inline-block;
}
</style>
</head>
<body>
<h4>
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}">전체 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}">일반 안전 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}">일반 안전 + 직거래 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}">픽셀플러스 상품</a>/
</h4>
<h4>
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=1">최신등록순</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=2">판매량순</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=3">낮은가격순</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=4">높은가격순</a>/
</h4>

<c:forEach var="mainSearch" items="${mainSearchList }">
	<div class="productWrap">
	<div class="firstImgWrap">
		<a href="/picksell/products/detail/${mainSearch.CATEGORY_NUM }/${mainSearch.PRODUCT_NUM }">
		<img src="/picksell/resources/productUpload/${mainSearch.FIRST_IMG }" style="width: 200px;" />
		</a>
	</div>
	<div class="infoWrap">
		<span class="productSubject">${mainSearch.SUBJECT }</span><br>
		<span class="productPrice">
		<fmt:formatNumber value="${mainSearch.PRICE }" pattern="#,###.##" /> 원
		</span>
	</div>
</div>
</c:forEach>
</body>
</html>

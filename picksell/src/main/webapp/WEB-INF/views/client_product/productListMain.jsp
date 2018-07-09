<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.categoryWrap {
    border: 1px solid #ececec;
    height: 150px;
}
span.product_category > a {
    border: 1px solid #dbdbdb;
    padding: 8px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 19px;
    float: left;
    margin-left: 15px;
    margin-bottom: 11px;
}
span.product_category.active > a {
    background-color: #7151fc;
    border: 1px solid #7151fc;
}
.product_category:hover > a{
	border: 1px solid #7151fc;
	color: #7151fc;
}
span.product_category a {
    color: #b5b5b5;
    font-size: 15px;
}
span.product_category.active a {
    color: white;
}

/* 최신순 낮은가격순 높은가격순 */
.orderMethodWrap {
    height: 50px;
    margin-top: 40px;
    border-bottom: 2px solid #ececec;
}
ul.orderMethodUL {
    margin: 0;
    padding: 0;
    height: 50px;
    line-height: 50px;
}
li.orderMethodLI > a {
    float: left;
    width: 100px;
    text-align: center;
    font-size: 15px;
    color: #9f9f9f;
}
li.orderMethodLI.active > a {
    color: #7151fc;
    border-bottom: 2px solid #7151fc;
}
</style>
</head>
<body>
	<div class="categoryWrap">
		<div class="categoryList">
				<span class="product_category <c:if test='${currentLS == 0 }'>active</c:if>"><a href="/picksell/products?ca=${currentCA }&ls=0&od=${currentOD}">모든상품</a></span>
				<span class="product_category <c:if test='${currentLS == 1 }'>active</c:if>"><a href="/picksell/products?ca=${currentCA }&ls=1&od=${currentOD}">플러스상품</a></span>
				<span class="product_category <c:if test='${currentLS == 2 }'>active</c:if>"><a href="/picksell/products?ca=${currentCA }&ls=2&od=${currentOD}">일반상품</a></span>
		</div>
	</div>
	<div class="orderMethodWrap">
		<ul class="orderMethodUL">
			
			<li class="orderMethodLI <c:if test='${currentOD == 0 }'>active</c:if>">
				<a href="/picksell/products?ca=${currentCA }&ls=${currentLS }&od=0">최신순</a>
			</li>
			<li class="orderMethodLI <c:if test='${currentOD == 1 }'>active</c:if>">
				<a href="/picksell/products?ca=${currentCA }&ls=${currentLS }&od=1">낮은가격순</a>
			</li>
			<li class="orderMethodLI <c:if test='${currentOD == 2 }'>active</c:if>">
				<a href="/picksell/products?ca=${currentCA }&ls=${currentLS }&od=2">높은가격순</a>
			</li>
			
		</ul>
	</div>
	<div class="contentWrap">
		<c:choose>
			<c:when test="${!empty resultProductList }" >
			<c:forEach var="product" items="${resultProductList }" varStatus="status">
				
				<div class="productWrap">
					<div class="writerWrap">
						<span class="productSeller">${product.SELLER_ID }</span>
					</div>
					<div class="firstImgWrap">
						<a href="/picksell/products/detail/${product.CATEGORY_NUM }/${product.PRODUCT_NUM }">
						<img src="/picksell/resources/productUpload/${product.FIRST_IMG }" style="width: 200px;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
						</a>
					</div>
					<div class="infoWrap">
						<span class="productSubject">${product.SUBJECT }</span><br>
						<span class="productPrice">
						<fmt:formatNumber value="${product.PRICE }" pattern="#,###.##" /> 원
						</span>
					</div>
				
				</div>
			</c:forEach>
			<div class="paging">
			${pagingHtml}
			</div>
			</c:when>
			<c:when test="${empty resultProductList }">
				등록된 상품이 없습니다!
			</c:when>
		</c:choose>
	</div>
</body>
</html>
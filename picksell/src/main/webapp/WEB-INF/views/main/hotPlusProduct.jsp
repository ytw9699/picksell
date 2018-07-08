<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.productWrap {
    display: inline-block;
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

.categoryList {
    width: 82%;
    padding-top: 25px;
    display: inline-block;
    box-sizing: border-box;
}
.categoryTitle {
    padding-top: 25px;
    display: inline-block;
    width: 12%;
    box-sizing: border-box;
}

.categoryWrap {
    border: 1px solid #ececec;
    height: 150px;
}
.categoryTitle {
    float: left;
    color: #999999;
    text-align: right;
    padding-top: 30px;
    display: inline-block;
    width: 10%;
    box-sizing: border-box;
}
/*  */
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
		<div class="categoryTitle">
			<span class="categoryText">카테고리</span>
		</div>
		<div class="categoryList">
			<c:choose>
				<c:when test="${currentCategory == 0}">
				<span class="product_category active"><a href="/picksell/hotPlusProduct">모든상품</a></span>
				</c:when>
				<c:when test="${currentCategory != 0 }">
				<span class="product_category"><a href="/picksell/hotPlusProduct">모든상품</a></span>
				</c:when>
			</c:choose>
			
			<c:forEach var="category" items="${categoryList }" >
				<c:choose>
				<c:when test="${currentCategory == category.CATEGORY_NUM }">
					<span class="product_category active"><a href="/picksell/hotPlusProduct?ca=${category.CATEGORY_NUM }">${category.CATEGORY_NAME }</a></span>
				</c:when>
				<c:when test="${currentCategory != category.CATEGORY_NUM }">
					<span class="product_category"><a href="/picksell/hotPlusProduct?ca=${category.CATEGORY_NUM }">${category.CATEGORY_NAME }</a></span>
				</c:when>
				</c:choose>
			</c:forEach>
			
			<!-- <span><a href="/picksell/products/goods?ca=1">전자제품</a></span>
			<span><a href="/picksell/products/goods?ca=2">패션/의류</a></span>
			<span><a href="/picksell/products/goods?ca=3">패션/잡화</a></span>
			<span><a href="/picksell/products/goods?ca=4">화장품/미용</a></span>
			<span><a href="/picksell/products/goods?ca=5">스포츠/레저</a></span>
			<span><a href="/picksell/products/goods?ca=6">유아동/출산</a></span>
			<span><a href="/picksell/products/goods?ca=7">완구/문구/취미</a></span>
			<span><a href="/picksell/products/goods?ca=8">도서/음반/DVD</a></span>
			<span><a href="/picksell/products/goods?ca=9">가구/인테리어</a></span>
			<span><a href="/picksell/products/goods?ca=10">생활/건강</a></span> -->
		</div>
	</div>
	<div class="orderMethodWrap">
	<ul class="orderMethodUL">
		
		<li class="orderMethodLI <c:if test="${orderMethod == 0 }">active</c:if>">
			<a href="/picksell/hotPlusProduct/?ca=${currentCategory }&od=0">최신순</a>
		</li>
		<li class="orderMethodLI <c:if test="${orderMethod == 1 }">active</c:if>">
			<a href="/picksell/hotPlusProduct/?ca=${currentCategory }&od=1">낮은가격순</a>
		</li>
		<li class="orderMethodLI <c:if test="${orderMethod == 2 }">active</c:if>">
			<a href="/picksell/hotPlusProduct/?ca=${currentCategory }&od=2">높은가격순</a>
		</li>
		
	</ul>
	</div>
	
	
	<div class="contentWrap">
	
	<c:choose>
		<c:when test="${!empty resultProductList }" >
			<c:forEach var="product" items="${resultProductList }">
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
						</span><br>
						<span class="productSubject">${product.PRODUCT_REGDATE }</span>
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
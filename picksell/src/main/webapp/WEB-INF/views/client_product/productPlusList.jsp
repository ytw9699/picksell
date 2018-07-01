<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="categoryWrap">
		<div class="categoryTitle">
		</div>
		<div class="categoryList">
			<span><a href="/picksell/products/plus">모든상품</a></span>
			<span><a href="/picksell/products/plus?ca=1">전자제품</a></span>
			<span><a href="/picksell/products/plus?ca=2">패션/의류</a></span>
			<span><a href="/picksell/products/plus?ca=3">패션/잡화</a></span>
			<span><a href="/picksell/products/plus?ca=4">화장품/미용</a></span>
			<span><a href="/picksell/products/plus?ca=5">스포츠/레저</a></span>
			<span><a href="/picksell/products/plus?ca=6">유아동/출산</a></span>
			<span><a href="/picksell/products/plus?ca=7">완구/문구/취미</a></span>
			<span><a href="/picksell/products/plus?ca=8">도서/음반/DVD</a></span>
			<span><a href="/picksell/products/plus?ca=9">가구/인테리어</a></span>
			<span><a href="/picksell/products/plus?ca=10">생활/건강</a></span>
		</div>
	</div>
	<div class="orderMethodWrap">
		<span><a href="/picksell/products/plus?ca=${currentCategory }&od=0">최신순</a></span>
		<span><a href="/picksell/products/plus?ca=${currentCategory }&od=1">낮은가격순</a></span>
		<span><a href="/picksell/products/plus?ca=${currentCategory }&od=2">높은가격순</a></span>
	</div>
	<div class="contentWrap">
		<c:forEach var="product" items="${resultProductList }">
			<div class="productWrap">
				<div class="writerWrap">
					<span class="productSeller">${product.SELLER_ID }</span>
				</div>
				<div class="firstImgWrap">
					<img src="/picksell/resources/productUpload/${product.FIRST_IMG }" style="width: 200px;" />
				</div>
				<div class="infoWrap">
					<span class="productSubject">${product.SUBJECT }</span><br>
					<span class="productPrice">
					<fmt:formatNumber value="${product.PRICE }" pattern="#,###.##" /> 원
					</span>
				</div>
			
			</div>
		</c:forEach>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    padding-bottom: 25px;
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
    margin-top: 40px;
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

/* 컨텐츠 */
.contentWrap {
    margin-top: 30px;
}

.productWrap {
    display: inline-block;
    width: 23%;
    margin-left: 1%;
    margin-top: 60px;
}
.product_firstimg {
    width: 100%;
    max-height: 260px;
}
.firstImgWrap {
    height: 260px;
}
.writerWrap {
    height: 40px;
}
.profileWrap {
    width: 30px;
    display: inline-block;
    float: left;
}
img.profileImg {
    width: 100%;
    height: 100%;
    border-radius: 30px;
}
span.productSeller {
    color: #666666;
    line-height: 28px;
    margin-left: 10px;
}
span.productSubject {
    display: block;
    margin-bottom: 20px;
    min-height: 50px;
}
span.productPrice {
    font-weight: 600;
}
span.priceTEXT {
    font-size: 22px;
    font-weight: 600;
}

span.wonTEXT {
    font-size: 14px;
}
/* 페이징 */
.paging {
    margin-top: 40px;
    text-align: center;
}
span.currentPaging {
    width: 40px;
    height: 40px;
    display: inline-block;
    background-color: #7151fc;
    color: white;
    border-radius: 30px;
    font-size: 23px;
}
a.paging {
    width: 40px;
    height: 40px;
    display: inline-block;
    color: #666;
    border-radius: 21px;
    font-size: 23px;
}
/* 판매중인지 */
.productStatusWrap {
    position: absolute;
    width: 248.203px;
    background-color: white;
    opacity: 0.8;
    height: 260px;
}
span.productStatusTEXT {
    font-size: 25px;
    margin: 0 auto;
    margin-top: 30%;
    text-align: center;
    font-weight: 600;
    color: #840000;
    display: block;
    width: 40%;
    border: 2px solid #840000;
    border-radius: 6px;
}
span.sellerRating {
    position: absolute;
    z-index: 1;
    width: 75px;
    opacity: 0.5;
}
img.ratingImg {
    width: 100%;
}
.productHR {
    border: 1px solid #f1f1f1;
    margin-top: 50px;
}
span.hasNoProductInThisCategory {
    display: block;
    margin: 100px auto;
    width: 70%;
    font-size: 20px;
    text-align: center;
    box-sizing: border-box;
    color: #999;
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
				<span class="product_category active"><a href="/picksell/products/goods">모든상품</a></span>
				</c:when>
				<c:when test="${currentCategory != 0 }">
				<span class="product_category"><a href="/picksell/products/goods">모든상품</a></span>
				</c:when>
			</c:choose>
			
			<c:forEach var="category" items="${categoryList }" >
				<c:choose>
				<c:when test="${currentCategory == category.CATEGORY_NUM }">
					<span class="product_category active"><a href="/picksell/products/goods?ca=${category.CATEGORY_NUM }">${category.CATEGORY_NAME }</a></span>
				</c:when>
				<c:when test="${currentCategory != category.CATEGORY_NUM }">
					<span class="product_category"><a href="/picksell/products/goods?ca=${category.CATEGORY_NUM }">${category.CATEGORY_NAME }</a></span>
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
			<a href="/picksell/products/goods?ca=${currentCategory }&od=0">최신순</a>
		</li>
		<li class="orderMethodLI <c:if test="${orderMethod == 1 }">active</c:if>">
			<a href="/picksell/products/goods?ca=${currentCategory }&od=1">낮은가격순</a>
		</li>
		<li class="orderMethodLI <c:if test="${orderMethod == 2 }">active</c:if>">
			<a href="/picksell/products/goods?ca=${currentCategory }&od=2">높은가격순</a>
		</li>
		
	</ul>
	</div>
	<div class="contentWrap">
	
		<c:choose>
			<c:when test="${!empty resultProductList }" >
			<c:forEach var="product" items="${resultProductList }" varStatus="status">
				
				<div class="productWrap">
					<div class="writerWrap">
						<div class="profileWrap">
							<img src="/picksell/resources/img/basicProfile.png" class="profileImg"/>
						</div>
						<span class="productSeller">${product.SELLER_ID }</span>
						<%-- <span class="sellerRating">
								<c:choose>
									<c:when test="${product.SELL > 0 and product.SELL < 2}">
										<img src="/picksell/resources/img/icoGradeF.png" class="ratingImg"/>
									</c:when>
									<c:when test="${product.SELL > 2 and product.SELL < 4}">
										<img src="/picksell/resources/img/icoGradeS.png" class="ratingImg"/>
									</c:when>
									<c:when test="${product.SELL > 4 and product.SELL < 4}">
										<img src="/picksell/resources/img/icoGradeG.png" class="ratingImg"/>
									</c:when>
									<c:when test="${product.SELL > 6 and product.SELL < 8}">
										<img src="/picksell/resources/img/icoGradeP.png" class="ratingImg"/>
									</c:when>
									<c:when test="${product.SELL > 8}">
										<img src="/picksell/resources/img/icoGradeV.png" class="ratingImg"/>
									</c:when>
								</c:choose>
							</span> --%>
					</div>
					<div class="firstImgWrap">
							
						<a href="/picksell/products/detail/${product.CATEGORY_NUM }/${product.PRODUCT_NUM }">
						<!-- 만약 거래중이면 -->
						<c:if test="${product.DEAL_STATUS == 1 }">
							<div class="productStatusWrap">
								<span class="productStatusTEXT">거래중</span>
							</div>
						</c:if>
						<img src="/picksell/resources/productUpload/${product.FIRST_IMG }" onerror="this.src='/picksell/resources/img/imgready.gif'" class="product_firstimg" />
						</a>
					</div>
					<div class="infoWrap">
						
						<span class="productSubject">${product.SUBJECT }</span>
						
							
							<span class="priceTEXT">
							<fmt:formatNumber value="${product.PRICE }" pattern="#,###.##" />
							</span>
							<span class="wonTEXT">원</span>
					</div>
				
				</div>
				
				<c:if test="${status.index == 3 or status.index == 7 }">
					<hr class="productHR">
				</c:if>
			</c:forEach>
			<div class="paging">
			${pagingHtml}
			</div>
			</c:when>
			<c:when test="${empty resultProductList }">
				<span class="hasNoProductInThisCategory">
				등록된 상품이 없습니다!
				</span>
			</c:when>
		</c:choose>
	</div>
	<script>
	//일반상품이면판매중인지
	$(document).ready(function(){
		$('.productStatusWrap').width($('.productStatusWrap').parents('.firstImgWrap').width());
		$('.productStatusWrap').height($('.productStatusWrap').parents('.firstImgWrap').height());
	});
	</script>
</body>
</html>
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
    height: 50px;
    padding: 20px;
    margin-top: 40px;
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
.mainCategoryHasNoProduct{
    display: block;
    margin: 100px auto;
    width: 70%;
    font-size: 20px;
    text-align: center;
    box-sizing: border-box;
    color: #999; 
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
						<div class="profileWrap">
							<img src="/picksell/resources/img/basicProfile.png" class="profileImg"/>
						</div>
						<span class="productSeller">${product.SELLER_ID }</span>
					</div>
					<div class="firstImgWrap">
						<a href="/picksell/products/detail/${product.CATEGORY_NUM }/${product.PRODUCT_NUM }">
						<!-- 만약 거래중이면 -->
						<c:if test="${product.DEAL_STATUS == 1 }">
							<div class="productStatusWrap">
								<span class="productStatusTEXT">거래중</span>
							</div>
						</c:if>
						<img src="/picksell/resources/productUpload/${product.FIRST_IMG }" style="width: 200px;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
						</a>
					</div>
					<div class="infoWrap">
						<span class="productSubject">${product.SUBJECT }</span><br>
						<span class="priceTEXT">
							<fmt:formatNumber value="${product.PRICE }" pattern="#,###.##" />
						</span>
						<span class="wonTEXT">원</span>
					</div>
				
				</div>
			</c:forEach>
			<div class="paging">
			${pagingHtml}
			</div>
			</c:when>
			<c:when test="${empty resultProductList }">
				<span class="mainCategoryHasNoProduct">등록된 상품이 없습니다!</span>
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
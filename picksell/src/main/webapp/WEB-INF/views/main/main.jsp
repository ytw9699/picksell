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
    width: 24%;
}
/* 인기상품 */
.hotProductWrapper {
    background: url(/picksell/resources/img/mainhot_back.png) 27% 0% no-repeat;
    background-color: #f2f2f3;
    background-size: 33%;
    padding-bottom: 40px;
    margin-left: -13%;
    width: 126%;
}
span.hotProductTopTEXT {
    display: block;
    text-align: center;
    color: #4d4d4d;
    padding-top: 40px;
    font-size: 20px;
}
span.hotProductCenterTEXT {
    display: block;
    text-align: center;
    font-size: 37px;
    font-weight: 600;
}
.hotProductsBinder {
    width: 70%;
    margin: 0 auto;
}
a.hotProductANCHOR {
    display: block;
    text-align: right;
    margin-bottom: 30px;
    margin-right: 7%;
    color: #666;
}
a.hotProductANCHOR:hover {
    text-decoration: underline;
}
.hotProductWrap {
    width: 32%;
    display: inline-block;
    margin-right: 1%;
}
.firstImgWrap {
    width: 100%;
}
img.hotProductIMG {
    width: 100%;
}
.hotProductInfoWrap {
    background-color: white;
    padding-bottom: 10px;
}
.hotProductIndexWrap {
    /* display: inline-block; */
    /* padding: 14px; */
    box-sizing: border-box;
    color: #7151fc;
    font-size: 35px;
    float: left;
    margin-left: 17px;
}
.hotProductInformation {
    display: inline-block;
    margin-left: 20px;
}
span.productSubject {
    color: #333;
    font-size: 17px;
    display: block;
}
span.productPriceWon {
    color: #333;
    font-size: 20px;
}
span.productPriceTEXT {
    font-size: 14px;
    color: #777;
}

/* 새로등록된플러스상품 */
.newProductWrapper {
    margin-top: 50px;
}
span.newProductNewTEXT {
    color: #7151fc;
}
span.newProductTEXT {
    font-weight: 600;
    font-size: 22px;
    margin-left: 15px;
}
a.newProductANCHOR:hover {
    text-decoration: underline;
}
a.newProductANCHOR {
    display: block;
    text-align: right;
    color: #666;
    margin-right: 10%;
}
.newProductsBinder {
    width: 90%;
    margin: 0 auto;
}
.newProductWrap {
    width: 22%;
    display: inline-block;
    margin-right: 2%;
}
img.newProductIMG {
    width: 100%;
}
.newNomalProductWrapper {
    margin-top: 60px;
}
/* 픽셀로 팔아야 잘산다! */
.bodyBottomContentWrapper {
    width: 100%;
    border: 2px solid #d7d7d7;
    margin-top: 70px;
    margin-bottom: 70px;
    padding: 43px;
    height: 170px;
    box-sizing: border-box;
}
.bottomContents {
    display: inline-block;
    float: left;
}
span.bottomTopTEXT {
    color: #7b7b7b;
    display: block;
}
span.bottomCenterTEXT {
    display: block;
    color: #131913;
    font-weight: 600;
    margin-top: 10px;
    font-size: 35px;
}
input.bottomSellBtn {
    transition: 0.3s;
    cursor: pointer;
    border: 1px solid #7151fc;
    background-color: #7151fc;
    color: white;
    font-weight: 600;
    padding: 20px;
    font-size: 18px;
    margin-left: 20%;
    margin-top: 12px;
}
input.bottomSellBtn:hover {
	background-color: white;
	color: #7151fc;
}
</style>
</head>
<body>

<div class="hotProductWrapper">
	<span class="hotProductTopTEXT">내가 제일 잘나가</span>
	<span class="hotProductCenterTEXT">픽셀 플러스 인기상품</span>
	<a href="/picksell/hotPlusProduct" class="hotProductANCHOR">전체보기 ></a>
	
	<div class="hotProductsBinder">
	<c:forEach var="hotProduct" items="${hotProductList}" end="2" varStatus="status">
		<div class="hotProductWrap">
			<div class="firstImgWrap">
				<a href="/picksell/products/detail/${hotProduct.CATEGORY_NUM }/${hotProduct.PRODUCT_NUM }">
				<img src="/picksell/resources/productUpload/${hotProduct.FIRST_IMG }" class="hotProductIMG" onerror="this.src='/picksell/resources/img/imgready.gif'" />
				</a>
			</div>
			<div class="hotProductInfoWrap">
				<div class="hotProductIndexWrap">${status.index+1}</div>
				<div class="hotProductInformation">
					<span class="productSubject">${hotProduct.SUBJECT }</span>
					<span class="productPriceWon"><fmt:formatNumber value="${hotProduct.PRICE }" pattern="#,###.##" /></span>
					<span class="productPriceTEXT">원</span>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
</div>


<h3>픽셀 플러스<font color="red">BEST</font> 카테고리 <a href="/picksell/products/plus"><font color="red" size="2">전체보기</font></a></h3>
<c:forEach var="hotCategory" items="${hotCategoryList }" varStatus="status" end="3">
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

<div class="newProductWrapper">
	<div class="newProductTextBinder">
		<span class="newProductNewTEXT">NEW</span>
		<span class="newProductTEXT">새로 등록된 플러스 상품</span>
	</div>
	<a href="/picksell/products/plus" class="newProductANCHOR">전체보기 ></a>
	
	<div class="newProductsBinder">
		<c:forEach var="pulsProduct" items="${plusProductList }" end="3">
			<div class="newProductWrap">
			<div class="firstImgWrap">
				<a href="/picksell/products/detail/${pulsProduct.CATEGORY_NUM }/${pulsProduct.PRODUCT_NUM }">
				<img src="/picksell/resources/productUpload/${pulsProduct.FIRST_IMG }" class="newProductIMG"  onerror="this.src='/picksell/resources/img/imgready.gif'" />
				</a>
			</div>
			<div class="infoWrap">
				<span class="productSubject">${pulsProduct.SUBJECT }</span>
				<span class="productPrice">
				<fmt:formatNumber value="${pulsProduct.PRICE }" pattern="#,###.##" /> 원
				</span>
			</div>
		</div>
		</c:forEach>
	</div><!-- newProductsBinder end -->
</div><!-- newProductWrapper end -->


<div class="newNomalProductWrapper">
	<div class="newProductTextBinder">
		<span class="newProductNewTEXT">NEW</span>
		<span class="newProductTEXT">새로 등록된 일반 상품</span>
	</div>
	
	<a href="/picksell/products/goods" class="newProductANCHOR">전체보기 ></a>
	<div class="newProductsBinder">
		<c:forEach var="nomalProduct" items="${nomalProductList }" end="3">
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
		</div><!-- productWrap end -->
		</c:forEach>
	</div><!-- newProductsBinder end -->
</div><!-- newNomalProductWrapper end -->

<div class="bodyBottomContentWrapper">
	<div class="bottomContents">
		<span class="bottomTopTEXT">이벤트 당첨되었는데 안쓰는 물건, 자리만 차지하고 있는 쓸모없는 물건...</span>
		<span class="bottomCenterTEXT">픽셀로 팔아야 잘 산다!</span>
	</div>
	<input type="button" class="bottomSellBtn" value="픽셀로 물건 판매하기" onclick="location.href='/picksell/sell/howto'" />
</div>

</body>
</html>

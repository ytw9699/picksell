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
.subjectTd {
    width: 27%;
    font-size: 17px;
    text-align: center;
}
table.purchaseTABLE {
    width: 90%;
}
.tdtd {
    width: 12%;
    font-size: 17px;
    text-align: center;
}
.categoryList {
    width: 65%;
    padding-top: 25px;
    padding-bottom: 25px;
    display: inline-block;
    box-sizing: border-box;
    height: 71px;
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
.orderMethodWrap {
    height: 50px;
    margin-top: 40px;
    border-bottom: 2px solid #ececec;
        margin-bottom: 21px;
}
ul.orderMethodUL {
    margin: 0;
    padding: 0;
    height: 50px;
    line-height: 50px;
}

ul.orderMethodUL {
    margin: 0;
    padding: 0;
    height: 50px;
    line-height: 38px;
    margin-left: 11px;
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
<div class="categoryList">
<span class="product_category <c:if test="${param.HowToSell == '3'}">active</c:if>">
			<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=3">모든 상품</a>
</span>
<span class="product_category <c:if test="${param.HowToSell == '0'}">active</c:if>">
			<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=0">일반 안전 상품</a>
</span>
<span class="product_category <c:if test="${param.HowToSell == '1'}">active</c:if>">
		<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=1">일반 안전  + 직거래 상품</a>
</span>
<span class="product_category <c:if test="${param.HowToSell == '2'}">active</c:if>">
		<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=2">픽셀플러스 상품</a>
</span>
</div>

<div class="orderMethodWrap">
	<ul class="orderMethodUL">
			<li class="orderMethodLI <c:if test="${param.order == '0'}">active</c:if>">
				<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=0">최신등록순</a>
			</li>
	     <c:if test="${HowToSell == '2' || HowToSell == '3'}">
			<li class="orderMethodLI <c:if test="${param.order == '1'}">active</c:if>">
				<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=1">판매량순</a>
			</li>
		</c:if>
			<li class="orderMethodLI <c:if test="${param.order == '2'}">active</c:if>">
				<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=2">낮은가격순</a>
			</li>
			<li class="orderMethodLI <c:if test="${param.order == '3'}">active</c:if>">
				<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=3">높은가격순</a>
			</li>
	</ul>
	</div>
<div class="purchaseList">	
<table class="purchaseTABLE" cellpadding="0" cellspacing="0">
<c:forEach var="mainSearch" items="${mainSearchList}"> 
<tr>
	<td class="tdtd">
		<a href="/picksell/products/detail/${mainSearch.CATEGORY_NUM }/${mainSearch.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${mainSearch.FIRST_IMG }" style="width: 150px; margin: 1%;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
		</a>
	</td>
	
	<td class="subjectTd">${mainSearch.SUBJECT}</td>
	
	<td class="tdtd"><fmt:formatNumber value="${mainSearch.PRICE}" pattern="#,###.##" /> 원</td>
	
	<c:if test="${mainSearch.TOTAL != null}">
	<td class="tdtd">${mainSearch.TOTAL}개</td>
	</c:if>
	
	<td class="tdtd">
		<c:if test="${mainSearch.HOWTOSELL == '0'}">
		일반안전거래
		</c:if>
		<c:if test="${mainSearch.HOWTOSELL == '1'}">
		일반안전거래+직거래
		</c:if>
		<c:if test="${mainSearch.HOWTOSELL == '2'}">
		사업자안전거래
		</c:if>
	</td>
	
	<td class="tdtd">등록일 <fmt:formatDate value="${mainSearch.PRODUCT_REGDATE}" pattern="yy. MM. dd" /></td>
</tr>	
</c:forEach>
</table>
</div>
<div class="paging">
 ${pagingHtml}
</div>
</body>
</html>

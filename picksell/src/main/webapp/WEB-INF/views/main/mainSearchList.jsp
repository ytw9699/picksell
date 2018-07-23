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

</style>
</head>
<body>
<h4>
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=3">전체 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=0">일반 안전 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=1">일반 안전  + 직거래 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=2">픽셀플러스 상품</a>/
</h4>
<h4>
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}">최신등록순</a>/
<c:if test="${HowToSell == '2' || HowToSell == '3'}">
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=1">판매량순</a>/
</c:if>
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=2">낮은가격순</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=3">높은가격순</a>/
</h4> 

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

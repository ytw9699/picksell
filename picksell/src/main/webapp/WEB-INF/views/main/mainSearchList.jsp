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
</head>
<body>
<h4>
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}">전체 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=0">일반 안전 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=1">일반 안전  + 직거래 상품</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=2">픽셀플러스 상품</a>/
</h4>
<h4>
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}">최신등록순</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=1">판매량순</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=2">낮은가격순</a>/
<a href="/picksell/mainSearchList?searchKeyword=${searchKeyword}&HowToSell=${HowToSell}&order=3">높은가격순</a>/
</h4>
<table>
<tr>
<td>사진/</td>
<td>제목/</td>
<td>가격/</td>
<td>날짜/</td>
<td>판매량/</td>
</tr>
</table>
<c:forEach var="mainSearch" items="${mainSearchList}"> 
<table>
<tr>
	<td><a href="/picksell/products/detail/${mainSearch.CATEGORY_NUM }/${mainSearch.PRODUCT_NUM }">
		<img src="/picksell/resources/productUpload/${mainSearch.FIRST_IMG }" style="width: 200px;" />
		</a>
	</td>
	<td>${mainSearch.SUBJECT}/</td>
	<td><fmt:formatNumber value="${mainSearch.PRICE}" pattern="#,###.##" /> 원/</td>
	<td>${mainSearch.PRODUCT_REGDATE}/</td>
	<c:if test="${mainSearch.TOTAL != null}">
	<td>${mainSearch.TOTAL}개/</td>
	</c:if>
</tr>		
</table>
</c:forEach>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>최근 본 상품</title>
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
</style>
</head>
<body>
<h2>최근 본 상품</h2>
최근 본 상품을 기준으로 최대 50개까지 저장됩니다.

<table>
<c:if test="${fn:length(recentlist) > 0}">
<tr>
<td>사진</td>
<td>제목</td>
<td>가격</td>
<td>본 날짜</td>
<td><input type="button" value="전체 삭제" onclick="location.href='/picksell/mypage/deleteRecenPd'"/></td>
</tr> 
	<c:forEach var="recentProduct" items="${recentlist}">
	<tr>
		<td>
			<a href="/picksell/products/detail/${recentProduct.RECENT_CATEGORY_NUM }/${recentProduct.RECENT_PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${purchase.FIRST_IMG }" style="width: 200px;" />
			</a>
		</td>
		<td><a href="/picksell/products/detail/${recentProduct.RECENT_CATEGORY_NUM }/${recentProduct.RECENT_PRODUCT_NUM }">${recentProduct.SUBJECT }</a></td>
		<td><fmt:formatNumber value="${recentProduct.PRICE }" pattern="#,###.##" /> 원</td>
		<td><fmt:formatDate value="${recentProduct.RECENT_REGDATE}" pattern="yy. MM. dd. hh:mm" /></td>
		<td><input type="button" id="recentProductDelete" value="삭제" onclick="location.href='/picksell/mypage/EachdeleteRecenPd?RECENT_NUM=${recentProduct.RECENT_NUM }'" /></td>
	</tr> 													
	
	</c:forEach>
</c:if>
<c:if test="${fn:length(recentlist) < 1}">
<p>최근 본 상품이 없습니다.</p>
</c:if>
</table>
<div class="paging">
 ${pagingHtml}
</div>
</body>
</html>

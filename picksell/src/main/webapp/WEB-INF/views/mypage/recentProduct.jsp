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
.tdtd {
    width: 12%;
    font-size: 17px;
    text-align: center;
}
table.purchaseTABLE {
    width: 90%;
}
.next {
    width: 65%;
    margin: 0 auto;
    margin-left: 0%;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 6%;
    font-size: 14px;
}
.alldelete {
    width: 65%;
    margin: 0 auto;
    margin-left: 0%;
    border: none;
    color: white;
    background-color: #e80935;
    padding: 6%;
    font-size: 14px;
}
.subjectTd {
    width: 27%;
    font-size: 17px;
    text-align: center;
}
.tbodys{
width: 10%;
margin-top: 10%;
}
span.hasNoOrderList {
    display: block;
    /* border: 1px solid #999; */
    width: 30%;
    margin: 0 auto;
    margin-top: 50px;
    text-align: center;
    color: #999;
    font-size: 22px;
    padding-bottom: 11px;
}
.confirm-auth-box {
    color: #7151FC;
    border-bottom: 2px solid #ececec;
    padding: 15px 0 15px 20px;
    font-size: 26px;
    margin: 0;
    width: 25%;
}
</style>
</head>
<body>
<div class="confirm-auth-box">최근 본 상품</div>
최근 본 상품을 기준으로 최대 50개까지 저장됩니다.


<div class="purchaseList">	
<table class="purchaseTABLE" cellpadding="0" cellspacing="0">
<c:if test="${fn:length(recentlist) > 0}">
	<tr>
	<td class="tdtd"></td><td class="tdtd"></td><td class="tdtd"></td><td class="tdtd"></td><td class="tdtd"><input type="button" value="전체 삭제" class="alldelete" onclick="location.href='/picksell/mypage/deleteRecenPd'"/></td>
	</tr>
	<c:forEach var="recentProduct" items="${recentlist}"> 
	<tbody class="tbodys">
	<tr>
		<td class="tdtd">
			<a href="/picksell/products/detail/${recentProduct.RECENT_CATEGORY_NUM }/${recentProduct.RECENT_PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${purchase.FIRST_IMG }" style="width: 150px; margin: 1%;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
			</a>
		</td>
		<td class="subjectTd"><a href="/picksell/products/detail/${recentProduct.RECENT_CATEGORY_NUM }/${recentProduct.RECENT_PRODUCT_NUM }">${recentProduct.SUBJECT }</a></td>
		<td class="tdtd"><fmt:formatNumber value="${recentProduct.PRICE }" pattern="#,###.##" /> 원</td>
		<td class="tdtd">본 날짜 <fmt:formatDate value="${recentProduct.RECENT_REGDATE}" pattern="yy. MM. dd" /></td>
		<td class="tdtd"><input type="button" class="next" id="recentProductDelete" value="삭제" onclick="location.href='/picksell/mypage/EachdeleteRecenPd?RECENT_NUM=${recentProduct.RECENT_NUM }'" /></td>
	</tr>									
	</tbody>
	</c:forEach>
</c:if>
<c:if test="${fn:length(recentlist) < 1}">
<span class="hasNoOrderList">최근 본 상품이 없습니다</span>
</c:if>
</table>
</div>
<div class="paging">
 ${pagingHtml}
</div>
</body>
</html>

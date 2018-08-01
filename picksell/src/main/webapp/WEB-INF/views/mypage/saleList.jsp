<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매내역/배송조회</title>
<style>

.orderkind {
    background-color: white;
    color: #7151fc;
    border-radius: 0px;
    width: 15%;
    border: 1px solid #7151fc;
    line-height: 21px;
    display: inline-block;
    text-align: center;
    transition: 0.3s;
    height: 100px;
}
span.orderkind:hover {
    background-color: #7151fc;
    color: white;
}
.my__stat__num-font {
    color: #7151fc;
    font-size: 50px;
    line-height: 83px;
} 
.my__i-stat1 {
    font-size: 14px;
    line-height: 28px;
}

span.my__i-stat1.i-stat1-title {
    display: block;
    margin-bottom: 10px;
    margin-top: 7px;
}
span.my__i-stat1.i-stat1-number {
    font-size: 40px;
}

.test {
    border: 1px solid #cecece;
    padding: 10px;
    margin: 50px;
    width: 700px;
    height: 300px;
}
.test2 {
    background: #f9f9f9;
    border-bottom: 1px solid #e7e7e7;
    padding: 2px;
    line-height: 40px;
    width: 700px;
    height: 60px;
}
}
.ddd{
}
span.hasNoOrderList {
    display: block;
    /* border: 1px solid #999; */
    width: 22%;
    margin: 0 auto;
    margin-top: 50px;
    text-align: center;
    color: #999;
    font-size: 22px;
    padding-bottom: 11px;
}
#ddd {
    margin-top: 13px;
    border: 1px solid #cecece;
    padding: 50px;
    height: 110px;
    width: 360px;
}
.test3 {
    padding: 2px;
    line-height: 60px;
    width: 700px;
    height: 60px;
    font-size: 1.2rem;
}
.test4 {
    padding: 2px;
    line-height: 60px;
    width: 700px;
    height: 60px;
    font-size: 1.2rem;
    position: relative;
    left:380px;
}
.test5 {
	color: #7151fc;
    margin-top: 13px;
    border: 1px solid #cecece;
    padding: 12px;
    height: 186px;
    font-size: 1rem;
    line-height: 180px;
    width: 210px;
    position: relative;
    left: 467px;
    bottom: 226px;
}
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

<div class="orderWrapper">
 <a href="/picksell/mypage/saleList">
	<span class="orderkind">
		<span class="my__i-stat1 i-stat1-title">전체보기</span>
		<span class="my__i-stat1 i-stat1-number">${saleCount.five}</span>개
	</span>
 </a>

<a href="/picksell/mypage/saleList?status=0">
	<span class="orderkind" >
		<span class="my__i-stat1 i-stat1-title">입금대기</span>
		<span class="my__i-stat1 i-stat1-number">${saleCount.zero}</span>개
	</span>
</a>

<a href="/picksell/mypage/saleList?status=1">
	<span class="orderkind" >
		<span class="my__i-stat1 i-stat1-title">입금완료 및 배송대기중</span>
		<span class="my__i-stat1 i-stat1-number">${saleCount.one}</span>개
	</span>
</a>

<a href="/picksell/mypage/saleList?status=2">
<span class="orderkind" >
	<span class="my__i-stat1 i-stat1-title">배송중 및 인수확인 대기</span>
	<span class="my__i-stat1 i-stat1-number">${saleCount.two}</span>개
</span>
</a>

<a href="/picksell/mypage/saleList?status=3">
	<span class="orderkind" >
		<span class="my__i-stat1 i-stat1-title">인수확인 및 거래완료</span>
		<span class="my__i-stat1 i-stat1-number">${saleCount.three}</span>개
	</span>
</a>

<a href="/picksell/mypage/saleList?status=44">
	<span class="orderkind" >
		<span class="my__i-stat1 i-stat1-title">결제취소</span>
		<span class="my__i-stat1 i-stat1-number">${saleCount.fourfour}</span>개
	</span>
</a>
</div>

<c:if test="${fn:length(saleList) > 0}">
<c:forEach var="ps_order" items="${saleList}" varStatus="saleListStatus">
<div class="test">
<div class="test2">
<span class="test3">주문일 <fmt:formatDate value="${ps_order.STEP1_DATE}" pattern="yy. MM. dd. hh:mm" /></span>
<span class="test4"><a href="/picksell/mypage/saleDetail/${ps_order.ORDER_NUM }">상세보기 > </a></span>
</div>
<div id="ddd">
<c:forEach var="joinMap" items="${saleSubList[saleListStatus.index]}">
<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
<img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 100px; onerror="this.src='/picksell/resources/img/imgready.gif'" />
 ${joinMap.SUBJECT }
</a>
 /<fmt:formatNumber value="${joinMap.PRICE }" pattern="#,###.##" /> 원
 /${joinMap.ORDER_QUANTITY}개
 <br>
</c:forEach>
</div>
<div class="test5">
<c:if test="${ps_order.STATUS == '0'}">
		입금대기중
		</c:if>
		<c:if test="${ps_order.STATUS == '1'}">
		입금 완료 및 배송 대기중
		</c:if>
		<c:if test="${ps_order.STATUS == '2'}">
		배송 및 인수확인 대기중
		</c:if>
		<c:if test="${ps_order.STATUS == '3'}">
		인수확인 및 거래완료
		</c:if>
		<c:if test="${ps_order.STATUS == '44'}">
		결제취소
		</c:if>
</div>
</div>
</c:forEach>
</c:if>
<c:if test="${fn:length(saleList) < 1}">
<span class="hasNoOrderList">내역이 없습니다</span>
</c:if>
<div class="paging">
${pagingHtml}
</div>
</body>
</html>



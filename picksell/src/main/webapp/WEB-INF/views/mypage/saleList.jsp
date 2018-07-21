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
    background-color: #7151fc;
    color: white;
    border-radius: 0px;
    width: 180px;
    height: 120px;
    line-height: 21px;
    display: inline-block;
    text-align: center;
    margin: -1px;
}
.my__stat__num-font {
    color: #fff;
    font-size: 50px;
    line-height: 83px;
}
.my__i-stat1 {
    font-size: 17px;
    line-height: 28px;
}
</style>
</head>
<body>

<div>
<a href="/picksell/mypage/saleList">
<span class="orderkind"><div class="my__i-stat1">전체보기</div>
<span class="my__stat__num-font">${saleCount.five}</span>개</span></a>

<a href="/picksell/mypage/saleList?status=0">
<span class="orderkind" ><div class="my__i-stat1">입금대기</div>
<span class="my__stat__num-font">${saleCount.zero}</span>개</span></a>

<a href="/picksell/mypage/saleList?status=1">
<span class="orderkind" ><div class="my__i-stat1">입금완료 및 배송대기중</div>
<span class="my__stat__num-font">${saleCount.one}</span>개</span></a>

<a href="/picksell/mypage/saleList?status=2">
<span class="orderkind" ><div class="my__i-stat1">배송중 및 인수확인 대기</div>
<span class="my__stat__num-font">${saleCount.two}</span>개</span></a>

<a href="/picksell/mypage/saleList?status=3">
<span class="orderkind"><div class="my__i-stat1">인수확인 및 거래완료</div>
<span class="my__stat__num-font">${saleCount.three}</span>개</span></a>

<a href="/picksell/mypage/saleList?status=44">
<span class="orderkind" ><div class="my__i-stat1">결제취소 및 반품</div>
<span class="my__stat__num-font">${saleCount.fourfour}</span>개</span></a>

</div>

<c:if test="${fn:length(saleList) > 0}">
<c:forEach var="ps_order" items="${saleList}" varStatus="saleListStatus">
    <br><h3>주문일:<fmt:formatDate value="${ps_order.STEP1_DATE}" pattern="yy년 MM월 dd일 hh:mm" />
	<a href="/picksell/mypage/saleDetail/${ps_order.ORDER_NUM }">
		<font color = "red">-상세보기</font>
		</a></h3>
    	<c:if test="${ps_order.STATUS == '0'}">
		거래상태:입금대기중
		</c:if>
		<c:if test="${ps_order.STATUS == '1'}">
		거래상태:입금 완료 및 배송 대기중
		</c:if>
		<c:if test="${ps_order.STATUS == '2'}">
		거래상태:배송 및 인수확인 대기
		</c:if>
		<c:if test="${ps_order.STATUS == '3'}">
		거래상태:인수확인 및 거래완료
		</c:if>
		<c:if test="${ps_order.STATUS == '44'}">
		거래상태:결제취소
		</c:if>
		<br>
		<br>
<c:forEach var="joinMap" items="${saleSubList[saleListStatus.index]}">
<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
<img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 200px;" />
 ${joinMap.SUBJECT }
</a>
 /<fmt:formatNumber value="${joinMap.PRICE }" pattern="#,###.##" /> 원
 /${joinMap.ORDER_QUANTITY}개
 <br>
</c:forEach>
</c:forEach>

	<%-- <c:forEach var="order" items="${saleList}">
	<tr>
		<br>${order.ORDER_NUM}</br>
		<br>
			<a href="/picksell/mypage/orderDetail/${order.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${order.FIRST_IMG }" style="width: 200px;" />
			</a>
		</br>
		<br><a href="/picksell/mypage/orderDetail/${order.PRODUCT_NUM }">${order.SUBJECT }</a></br>
		<br><fmt:formatNumber value="${order.PRICE }" pattern="#,###.##" /> 원</br>
		
	</tr>
	</c:forEach> --%>
</c:if>
<c:if test="${fn:length(saleList) < 1}">
<p>내역이 없습니다</p>
</c:if>
<div class="paging">
			${pagingHtml} 페이지
</div>
</body>
</html>

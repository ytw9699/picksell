<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!-- 수정 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문내역/배송조회</title>
<style>
</style>
</head>
<body>
<table>
<a href="/picksell/mypage/orderList">
전체보기/
</a>
<a href="/picksell/mypage/orderList?status=0">
입금대기/
</a>
<a href="/picksell/mypage/orderList?status=1">
입금완료 및 배송대기중/
</a>
<a href="/picksell/mypage/orderList?status=2">
배송 및 인수확인 대기/
</a>
<a href="/picksell/mypage/orderList?status=3">
인수확인 및 거래완료/
</a>
<a href="/picksell/mypage/orderList?status=44">
결제취소/
</a>
<c:if test="${fn:length(orderList) > 0}">
<c:forEach var="ps_order" items="${orderList}" varStatus="orderListStatus">
    <br><h3>주문일:<fmt:formatDate value="${ps_order.STEP1_DATE}" pattern="yyyy년 MM월 dd일 hh:mm:ss" />
	<a href="/picksell/mypage/orderDetail/${ps_order.ORDER_NUM }">
		<font color = "red">주문 내역 상세보기</font>
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
<c:forEach var="joinMap" items="${orderSubList[orderListStatus.index]}">
<a href="/picksell/products/detail/${joinMap.CATEGORY_NUM }/${joinMap.PRODUCT_NUM }">
<img src="/picksell/resources/productUpload/${joinMap.FIRST_IMG }" style="width: 200px;" />
 /${joinMap.SUBJECT }
</a>
 /${joinMap.PRICE }원
 /갯수: ${joinMap.ORDER_QUANTITY}개
 <br>
</c:forEach>

</c:forEach>

	<%-- <c:forEach var="order" items="${orderList}">
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
<c:if test="${fn:length(orderList) < 1}">
<p>내역이 없습니다</p>
</c:if>
<div class="paging">
			${pagingHtml} 페이지
</div>
</table>
</body>
</html>

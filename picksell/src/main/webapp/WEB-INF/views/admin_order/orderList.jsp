<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오더 리스트</title>
</head>
<body>
<table>

	<thead>
		<tr role="row">
			<th style="width: 9%; text-align:center;">번호</th>
			<th style="width: 9%; text-align:center;">구매자</th>
			<th style="width: 9%; text-align:center;">배송상태</th>
			<th style="width: 9%; text-align:center;">총 가격</th>										
			<th style="width: 9%; text-align:center;">배송지</th>
			<th style="width: 9%; text-align:center;">계좌</th>
			<th style="width: 9%; text-align:center;">입금주</th>
			<th style="width: 9%; text-align:center;">은행명</th>
			<th style="width: 9%; text-align:center;">주문번호</th>
			<th style="width: 9%; text-align:center;">택배사</th>
			<th style="width: 10%; text-align:center;">송장번호</th>
		</tr>
	</thead>

	<div class="orderList">
 		<c:forEach var="orderList" items="${orderList}" varStatus="stat">
 			<tr class="orderListContents" role="row">
 				<td style="text-align:center;vertical-align:middle;">${orderList.order_num}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.buyer_id}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.status}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.total_price}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.destination}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.account}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.account_name}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.bank}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.purchase_num}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.delivery_company}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.invoice_num}</td>
 				<br/>
 			</tr>
 		</c:forEach>
 	</div>
<table/> 	
 	<!--  등록된 상품이 없을때 -->
	<c:if test="${fn:length(orderList) le 0}">
		<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
	</c:if> 


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오더 리스트</title>

<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>

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
	
	<div class="paging">
		${pagingHtml}
	</div>
	
	<div class="row">
		<div style="text-align:center;">
			<div id="dataTables-example_filter" class="dataTables_filter">
				<form action=""> 
					<select class="form-control" name="searchNum" id="searchNum">
						<option value="0">구매자</option>
						<option value="1">상태</option>
						<option value="2">택배사</option>
					</select>
					<input class="form-control" type="text" name="isSearch" id="isSearch"/>
					<span>
						<button type="submit" class="btn btn-default">검색</button>
					</span>
				</form>
			</div>							
		</div>				
	</div>

</body>
</html>
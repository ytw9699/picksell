<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오더 리스트</title>

<style type="text/css">

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
.button1 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
}

.button1:hover {
    background-color: #008CBA;
    color: white;
}

.fa-check {
    color: green;
}

.fa-remove {
    color: red;
}

.main{ 
 	 margin-left: 160px;  
 	} 

table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}


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

<div class="main">
<div style="overflow-x:auto;">
<table>

	<thead>
		<tr role="row">
			<th style="text-align:center;">번호</th>
			<th style="text-align:center;">구매자</th>
			<th style="text-align:center;">배송상태</th>
			<th style="text-align:center;">총 가격</th>										
			<th style="text-align:center;">배송지</th>
<!-- 			<th style="text-align:center;">계좌</th> -->
<!-- 			<th style="text-align:center;">입금주</th> -->
<!-- 			<th style="text-align:center;">은행명</th> -->
			<th style="text-align:center;">주문번호</th>
<!-- 			<th style="text-align:center;">택배사</th> -->
<!-- 			<th style="text-align:center;">송장번호</th> -->
			<th style="text-align:center;" >입금시각</th>
			<th style="text-align:center;">입금확인</th>
			<th style="text-align:center;">배송시각</th>
			<th style="text-align:center;">배송확인</th>
			<th style="text-align:center;">인수시각</th>
			<th style="text-align:center;">인수확인</th>
			<th style="text-align:center;">상세보기</th>
		</tr>
	</thead>

	<div class="orderList">
 		<c:forEach var="orderList" items="${orderList}" varStatus="stat">
 			<tr class="orderListContents" role="row">
 				<td style="text-align:center;vertical-align:middle;">${orderList.order_num}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.buyer_id}</td>
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${orderList.status eq 0}">
					입금대기
					</c:if>
					<c:if test="${orderList.status eq 1}">
					입금완료 및 배송대기중
					</c:if>
					<c:if test="${orderList.status eq 2}">
					배송 및 인수확인 대기
					</c:if>
					<c:if test="${orderList.status eq 3}">
					인수확인 및 거래완료 
					</c:if>
					<c:if test="${orderList.status eq 4}">
					결제취소
					</c:if>
 				</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.total_price}</td>
 				<td style="text-align:center;vertical-align:middle;">${orderList.destination}</td>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.account}</td> --%>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.account_name}</td> --%>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.bank}</td> --%>
 				<td style="text-align:center;vertical-align:middle;">${orderList.purchase_num}</td>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.delivery_company}</td> --%>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.invoice_num}</td> --%>
 				
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${empty orderList.step2_date}">
					<i class="fa fa-remove"></i>
					</c:if>
					<c:if test="${not empty orderList.step2_date}">
					<i class="fa fa-check"></i>
					</c:if>
 				</td>
 				<td style="text-align:center;vertical-align:middle;">
<%--  				<c:url var="status1" value="/admin_order/confirmProc" > --%>
<%-- 					<c:param name="order_num" value="${orderList.order_num}" />							 --%>
<%-- 				</c:url> --%>
				 <a href="/picksell/admin_order/confirmProc?order_num=${orderList.order_num}"><input type="button" value="입금완료"></a>
<%-- 				 <a href="${status1}"><input type="button" value="입금완료"></a> --%>

 				</td>
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${empty orderList.step3_date}">
					<i class="fa fa-remove"></i>
					</c:if>
					<c:if test="${not empty orderList.step3_date}">
					<i class="fa fa-check"></i>
					</c:if>
 				</td>
 				<td style="text-align:center;vertical-align:middle;">
 				<c:url var="status2" value="/admin_order/deliveryProc" >
					<c:param name="order_num" value="${orderList.order_num}" />							
				</c:url>
				 <a href="${status2}"><input type="button" value="배송중"></a>
 				</td>
 				
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${empty orderList.step4_date}">
					<i class="fa fa-remove"></i>
					</c:if>
					<c:if test="${not empty orderList.step4_date}">
					<i class="fa fa-check"></i>
					</c:if>
 				</td>
 				<td style="text-align:center;vertical-align:middle;">
 				<c:url var="status3" value="/admin_order/orderTerminate" >
					<c:param name="order_num" value="${orderList.order_num}" />							
				</c:url>
				 <a href="${status3}"><input type="button" value="인수확인"></a>
 				</td>
 				
 				<td style="text-align:center;vertical-align:middle;">

					<a href="#"><button class="button button1">상세보기</button></a>
<!--  				<a href="#" class="button button1"><input type="button" value="상세보기"></a> -->
 				</td>
 			</tr>
 			
 		</c:forEach>
 	</div>
</table> 
</div>	
 	<!--  등록된 상품이 없을때 -->
	<c:if test="${empty orderList}">
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
</div>
</body>
</html>
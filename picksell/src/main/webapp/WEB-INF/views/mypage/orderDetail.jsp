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
<title>주문조회 디테일 </title>
<style>
</style>
</head>
<body>
주문조회 디테일 입니다
<table>

	<tr>
		<td>사진</td>
		<td>제목</td>
		
		<td>주문번호</td>
		<td>주문일</td>
		<td>거래상태</td>
		<td>총결제금액</td>
		<td>배송지</td>
		<td>계좌번호</td>
		<td>예금주</td>
		<td>은행명</td>
		<td>택배사</td>
		<td>송장번호</td>
	</tr>
	<tr>
		<td>
			<a href="/picksell/products/detail/${orderDetail.CATEGORY_NUM }/${orderDetail.PRODUCT_NUM }/1">
				<img src="/picksell/resources/productUpload/${orderDetail.FIRST_IMG }" style="width: 200px;" />
			</a>
		</td>
			<a href="/picksell/products/detail/${orderDetail.CATEGORY_NUM }/${orderDetail.PRODUCT_NUM }/1">
				<td>${orderDetail.SUBJECT}</td>
			</a>
		<td>${orderDetail.ORDER_NUM}</td>
		
		<c:if test="${orderDetail.STATUS == '0'}">
		<td>입금대기중</td>
		</c:if>
		<c:if test="${orderDetail.STATUS == '1'}">
		<td>입금 완료 및 배송 대기중</td>
		</c:if>
		<c:if test="${orderDetail.STATUS == '2'}">
		<td>배송 및 인수확인 대기</td>
		</c:if>
		<c:if test="${orderDetail.STATUS == '3'}">
		<td>인수확인 및 거래완료</td>
		</c:if>
		<c:if test="${orderDetail.STATUS == '44'}">
		<td>결제취소</td>
		</c:if>
		<td><fmt:formatNumber value="${orderDetail.TOTAL_PRICE }" pattern="#,###.##" /> 원</td>
		<td>${orderDetail.DESTINATION}</td>
		<td>${orderDetail.ACCOUNT}</td>
		<td>${orderDetail.ACCOUNT_NAME}</td>
		<td>${orderDetail.BANK}</td>
		<td>${orderDetail.DELIVERY_COMPANY}</td>
		<td>${orderDetail.INVOICE_NUM}</td>
	</tr>

</table>
</body>
</html>

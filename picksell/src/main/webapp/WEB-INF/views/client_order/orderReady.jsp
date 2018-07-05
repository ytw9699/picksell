<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

</style>
</head>
<body>
<form action="/picksell/purchase/order" method="post">
	<input type="hidden" name="total_price" value="${totalSum + 2500  }" />
	<div class="contentWrap">
	<div class="orderInfoWrap">
		<table border="1">
			<tr>
				<td colspan="2"><h5>주문하기</h5></td>
			</tr>
			<tr>
				<td colspan="2">배송정보</td>
			</tr>
			<tr>
				<td colspan="2">
					<span>이름</span><br>
					<input type="text" />
				</td>
			</tr>
			<tr>
				<td>
					<span>전화번호</span><br>
					<input type="text" />
				</td>
				<td>
					<span>이메일</span><br>
					<input type="text" />
				</td>
			</tr>
			<tr>
				<td>
					<span>배송지</span><br>
					<input type="text" name="destination" />
				</td>
			</tr>
			
			<tr>
				<td colspan="2">결제정보</td>
			</tr>
			<tr>
				<td colspan="2">
				<span>은행사</span>
				<input type="text" name="bank" />
				</td>
			</tr>
			<tr>
				<td>
					예금주<br>
					<input type="text" name="account_name" />
				</td>
				<td>
					계좌번호<br>
					<input type="text" name="account" />
				</td>
			</tr>
		</table>
	</div>
	<div class="paymentInfoWrap">
		<table border="1">
			<tr>
				<td colspan="2">
				결제상품
				</td>
			</tr>
			
			<c:forEach var="product" items="${resultList }" varStatus="status">
				<input type="hidden" name="o_list[${status.index }].product_num" value="${product.product_num }" />
				<input type="hidden" name="o_list[${status.index }].order_quantity" value="${product.orderSum }" />
				<input type="hidden" name="o_list[${status.index }].seller_id" value="${product.seller_id }" />
				<tr>
					<td>
						<img src="/picksell/resources/productUpload/${product.product_img }" width="200" />
					</td>
					<td>
						<strong>${product.product_subject }</strong><br>
						<fmt:formatNumber value="${product.product_currentPrice }" pattern="#,###.##" /> 원
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td>상품금액</td>
				<td>${totalSum }</td>
			</tr>
			<tr>
				<td>배송료</td>
				<td>2500 원</td>
			</tr>
			
			<tr>
				<td>결제하실 금액</td>
				<td>
				<fmt:formatNumber value="${totalSum + 2500 }" pattern="#,###.##" /> 원
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				<input type="submit" value="주문하기" />
				</td>
			</tr>
		</table>
	</div>
</div>
</form>
</body>
</html>
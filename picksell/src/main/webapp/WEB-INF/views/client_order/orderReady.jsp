<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.orderInfoWrap {
    display: inline-block;
    width: 68%;
    border: 1px solid #d8d8d8;
    box-sizing: border-box;
    border-radius: 5px;
}
table.ordertable {
    width: 100%;
}
.paymentInfoWrap {
    float: right;
    width: 30%;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
}
table.paytable {
    width: 100%;
}
td.tableHeader.topHeader {
    border-bottom: 1px solid #d8d8d8;
    font-size: 25px;
    color: #333333;
    padding: 20px;
}


td.subHeader {
    padding: 20px;
    color: #333;
    font-size: 20px;
}
span.product_subjectTEXT {
    display: block;
    font-size: 20px;
    font-weight: 600;
}
td.product_imgTD {
    width: 40%;
    padding: 10px;
}
td.product_noticeTEXT {
    color: #333;
    font-size: 18px;
    padding: 10px;
    padding-left: 20px;
}
td.product_valueTEXT {
    color: #333;
    font-size: 18px;
    padding: 10px;
    padding-right: 35px;
    text-align: right;
}
td.product_totalTEXT {
    color: #e31c1c;
    font-size: 18px;
    padding: 10px;
    padding-left: 20px;
    width: 45%;
}
td.product_total_valueTEXT {
    color: #e31c1c;
    font-size: 18px;
    padding: 10px;
    padding-right: 35px;
    text-align: right;
}
td.orderBtnTD {
    text-align: center;
}
input.orderSubmitBtn {
    border: none;
    background-color: #7151fc;
    color: white;
    padding: 15px;
    font-size: 18px;
    width: 100%;
    cursor: pointer;
}
input.orderSubmitBtn:hover{
	background-color: #6542fc;
}
img.product_img {
    width: 100%;
}
span.orderInfoTEXT {
    display: block;
    color: #1f1f1f;
    font-size: 16px;
    margin-bottom: 8px;
}
input.orderInfoINPUT {
    border: 1px solid #dbdbdb;
    padding: 8px;
    border-radius: 5px;
    font-size: 14px;
    width: 250px;
}

table td {
    padding: 20px;
}

</style>
</head>
<body>
<form action="/picksell/purchase/order" method="post">
	<input type="hidden" name="total_price" value="${totalSum + 2500  }" />
	<div class="contentWrap">
	<div class="orderInfoWrap">
		<table class="ordertable" cellpadding="0" cellspacing="0" >
			<tr>
			
				<td class="tableHeader topHeader" colspan="2">주문하기</td>
			</tr>
			<tr>
				<td class="subHeader" colspan="2">배송정보</td>
			</tr>
			<tr>
				<td colspan="2">
					<span class="orderInfoTEXT">이름</span>      
					<input class="orderInfoINPUT" type="text" value="${sessionScope.sessionName }" disabled="disabled"  />
				</td>
			</tr>
			<tr>
				<td>
					<span class="orderInfoTEXT">전화번호</span>
					<input class="orderInfoINPUT" type="text" name="buyer_phone" placeholder="- 없이 입력해주세요" />
				</td>
				<td>
					<span class="orderInfoTEXT">이메일</span>
					<input class="orderInfoINPUT" type="text" name="buyer_email" />
				</td>
			</tr>
			<tr>
				<td>
					<span class="orderInfoTEXT">배송지</span>
					<input class="orderInfoINPUT" type="text" name="destination" />
				</td>
			</tr>
			
			<tr>
				<td class="subHeader" colspan="2">결제정보</td>
			</tr>
			<tr>
				<td colspan="2">
				<span class="orderInfoTEXT">은행사</span>
				<input class="orderInfoINPUT" type="text" name="bank" />
				</td>
			</tr>
			<tr>
				<td>
					<span class="orderInfoTEXT">예금주</span>
					<input class="orderInfoINPUT" type="text" name="account_name" />
				</td>
				<td>
					<span class="orderInfoTEXT">계좌번호</span>
					<input class="orderInfoINPUT" type="text" name="account" placeholder="- 없이 입력해주세요" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span class="orderInfoTEXT">배송시 주의사항</span>
					<input class="orderInfoINPUT" type="text" name="precautions" />
				</td>
			</tr>
		</table>
	</div>
	<div class="paymentInfoWrap">
		<table class="paytable" cellpadding="0" cellspacing="0">
			<tr>
				<td class="subHeader" colspan="2">결제상품</td>
			</tr>
			
			<c:forEach var="product" items="${resultList }" varStatus="status">
				<input type="hidden" name="o_list[${status.index }].product_num" value="${product.product_num }" />
				<input type="hidden" name="o_list[${status.index }].order_quantity" value="${product.orderSum }" />
				<input type="hidden" name="o_list[${status.index }].seller_id" value="${product.seller_id }" />
				<input type="hidden" name="o_list[${status.index }].product_howtosell" value="${product.product_howtosell }" />
				<input type="hidden" name="buyer_id" value="${sessionScope.sessionId }" /> <!-- by 태원 -->
				<tr>
					<td class="product_imgTD">
						<img class="product_img" src="/picksell/resources/productUpload/${product.product_img }" onerror="this.src='/picksell/resources/img/imgready.gif'" />
					</td>
					<td class="product_info">
						<span class="product_subjectTEXT">${product.product_subject }</span>
						<span class="product_priceTEXT">
						<fmt:formatNumber value="${product.product_currentPrice }" pattern="#,###.##" /> 원
						</span>
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td class="product_noticeTEXT">상품금액</td>
				<td class="product_valueTEXT">
				<fmt:formatNumber value="${totalSum }" pattern="#,###.##" /> 원
				</td>
			</tr>
			<tr>
				<td class="product_noticeTEXT deliveryTEXT">배송료</td>
				<td class="product_valueTEXT">2,500 원</td>
			</tr>
			
			<tr>
				<td class="product_totalTEXT">결제하실 금액</td>
				<td class="product_total_valueTEXT">
				<fmt:formatNumber value="${totalSum + 2500 }" pattern="#,###.##" /> 원
				</td>
			</tr>
			
			<tr>
				<td class="orderBtnTD" colspan="2">
				<input class="orderSubmitBtn" type="submit" value="주문하기" />
				</td>
			</tr>
		</table>
	</div>
</div>
</form>
</body>
</html>
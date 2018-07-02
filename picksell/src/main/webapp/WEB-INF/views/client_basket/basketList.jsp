<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<script>
	function subQuantity(targetBasketNum,keyNumber){
		if(Number(document.getElementById('hid_quantity'+keyNumber).value - 1) < 1){
			alert('더이상 수량을 차감할 수 없습니다');
			return false;
		}else{
			fetch("/picksell/cart/subQuantity/"+targetBasketNum).then(function(response){
				response.text().then(function(text){
					if(response.status == '200'){
						alert('차감되었어요!');
						var uppoint = Number(document.getElementById('hid_quantity'+keyNumber).value) - 1;
						var priceInfo = Number(document.getElementById('hid_price'+keyNumber).value);
						var multiResult = uppoint * priceInfo;
						
						document.getElementById('hid_quantity'+keyNumber).value = uppoint;
						document.getElementById('product_quantity'+keyNumber).innerHTML = uppoint;
					
						document.getElementById('subtotal'+keyNumber).innerHTML = multiResult;
					}
				})
			})
		}
	}
	function addQuantity(targetBasketNum,keyNumber){
		if(Number(document.getElementById('hid_quantity'+keyNumber).value) == Number(document.getElementById('hid_stock'+keyNumber).value)){
			alert('최대수량입니다!');
			return false;
		}else{
			fetch('/picksell/cart/addQuantity/'+targetBasketNum).then(function(response){
				response.text().then(function(text){
					if(response.status == '200'){
						alert('상승!');
						var uppoint = Number(document.getElementById('hid_quantity'+keyNumber).value) + 1;
						var priceInfo = Number(document.getElementById('hid_price'+keyNumber).value);
						var multiResult = uppoint * priceInfo;

						document.getElementById('hid_quantity'+keyNumber).value = uppoint;
						document.getElementById('product_quantity'+keyNumber).innerHTML = uppoint;
						
						document.getElementById('subtotal'+keyNumber).innerHTML = multiResult;
					}
				})
			})
		}
	}
</script>
	<div class="textTopWrapper">
		<span>장바구니</span> <span>${listSize }</span>
	</div>
	<table border="1">
		<tr>
			<td colspan="3">상품 정보</td>
			<td>수량</td>
			<td colspan="2">상품금액</td>
		</tr>
		<c:forEach var="list" items="${resultList }" varStatus="indexStatus">
			<input type="hidden" id="hid_stock${indexStatus.index }" value="${list.STOCK }" />
			<input type="hidden" id="hid_quantity${indexStatus.index }" value="${list.PRODUCT_QUANTITY }" />
			<input type="hidden" id="hid_price${indexStatus.index }" value="${list.PRICE }" />
			<tr>
				<td>체크박스</td>
				<td><img src="/picksell/resources/productUpload/${list.FIRST_IMG }" style="width: 200px;"/></td>
				<td>
					<span>${list.SUBJECT }</span><br/>
					<span>${list.PRICE }</span>
				</td>
				<td>
					<input type="button" value="마이너스" onclick="subQuantity(${list.BASKET_NUM},${indexStatus.index})" />
					<span id="product_quantity${indexStatus.index }">${list.PRODUCT_QUANTITY }</span>
					<input type="button" value="플러스" onclick="addQuantity(${list.BASKET_NUM},${indexStatus.index })" />
				</td>
				<td>
					<span id="subtotal${indexStatus.index }">${list.PRICE * list.PRODUCT_QUANTITY }</span>
				</td>
				<td><a href="#">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
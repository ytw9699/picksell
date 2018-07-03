<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>


</head>
<body>
<script>

 	/* function wow(){
		var allData = "test1=1&test2=2";
		$.ajax({
			type : "POST",
			url : "/picksell/ajax/wow",
			dataType : 'json',
			data : allData,
			success : function(data){
				alert(data.wow);
			}
		});
	}  */

	//전체 가격 
	var total = Number(0);

	function sumfunc(addvalue){
		total += Number(addvalue);
		document.getElementById('sumValue').innerHTML = total;
	}
	function subfunc(subvalue){
		total -= Number(subvalue);
		document.getElementById('sumValue').innerHTML = total;
	}
	function basketChecking(checkTarget, keyNumber){
		if(checkTarget.checked){
			//체크되있을때 디스에이블 풀러야댐
			sumfunc(Number(document.getElementById('hid_currentPrice'+keyNumber).value));
		}else if(!checkTarget.checked){
			//체크해제일때 디스에이블 걸어야댐
			subfunc(Number(document.getElementById('hid_currentPrice'+keyNumber).value));
		}
	}
	
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
					
						document.getElementById('hid_currentPrice'+keyNumber).value = multiResult;
						document.getElementById('subtotal'+keyNumber).innerHTML = multiResult;
					
						if(document.getElementById('baketCheck'+keyNumber).checked){
							subfunc(document.getElementById('hid_price'+keyNumber).value);
						}
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
						
						document.getElementById('hid_currentPrice'+keyNumber).value = multiResult;
						document.getElementById('subtotal'+keyNumber).innerHTML = multiResult;
					
						if(document.getElementById('baketCheck'+keyNumber).checked){
							sumfunc(priceInfo);
							
							document.getElementById('프로필을감싸는div').innerHTML = text;
						}
					}
				})
			})
		}
	}
</script>

	<!-- <input type="button" value="에이젝스 버튼" id="btn" onclick="wow()" /> -->
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
			<input type="hidden" id="hid_currentPrice${indexStatus.index }" value="${list.PRICE * list.PRODUCT_QUANTITY }" />
			<tr>
				<td><input type="checkbox" onclick="basketChecking(this, ${indexStatus.index})" id="baketCheck${indexStatus.index }" /></td>
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
	<input type="button" value="전체삭제" />
	<div class="summaryInfoWrap">
		
		<span class="sumText">총 합계</span>
		<span class="sumValue" id="sumValue">0</span>
		<input type="button" value="구매하기" />
	</div>
</body>
</html>
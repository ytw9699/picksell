<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
span.basketTEXT {
    font-size: 25px;
}

span.basketTotalTEXT {
    color: #7151fc;
    font-size: 22px;
    margin-left: 10px;
}
/* 테이블 */
table.basketTable {
    width: 100%;
    margin-top: 50px;
    margin-bottom: 50px;
}
td {
    border-bottom: 2px solid #ececec;
}

span.product_subjectTEXT {
    display: block;
    font-size: 15px;
}

span.product_priceTEXT {
    font-size: 22px;
    margin-top: 10px;
}

td.tableTitle {
    text-align: center;
    color: #666666;
    background-color: #f8f8f8;
    font-size: 14px;
    border-top: 1px solid #ececec;
    box-sizing: border-box;
    padding: 10px;
}
td.tableTitle.title1 {
    width: 20%;
}

td.tableTitle.title2 {
    width: 20%;
}

td.product_deleteTD {
    text-align: right;
}

td.product_priceTD {
    text-align: right;
    font-size: 20px;
}
span.subtotal_wonTEXT {
    font-size: 15px;
}
td.product_quanTD {
    text-align: center;
    padding: 40px;
}
td.product_checkTD {
    width: 5%;
    text-align: center;
}

td.product_imgTD {
    width: 20%;
    text-align: center;
    box-sizing: border-box;
    padding: 8px;
}
img.product_img {
    width: 80%;
}
a.deleteA {
    color: #999999;
    height: 50px;
    width: 40px;
    line-height: 80px;
    background: url(/picksell/resources/img/cancel2.png) 50% 30% no-repeat;
    background-size: 15px;
    display: block;
    font-size: 15px;
    text-align: center;
    margin: 0 auto;
}
input.subbtn {
    float: left;
    width: 35px;
    height: 35px;
    border-radius: 33px;
    background: url(/picksell/resources/img/sub.png) 50% 50% no-repeat;
    background-size: 20px;
    border: 1px solid #ececec;
}
input.addbtn {
    float: left;
    width: 35px;
    height: 35px;
    border-radius: 33px;
    background: url(/picksell/resources/img/add.png) 50% 50% no-repeat;
    background-size: 20px;
    border: 1px solid #ececec;
}
.proquan {
    float: left;
    font-size: 22px;
    color: #726e6e;
    margin: 0 20px;
}	
a.deleteAll {
    float: left;
    border: 1px solid #c2c2c2;
    color: #666666;
    font-size: 14px;
    padding: 12px;
    width: 100px;
    text-align: center;
}
/* 최종금액 */
.summaryInfoWrap {
    float: right;
    width: 320px;
}
span.sumText {
    float: left;
    font-size: 23px;
    line-height: 52px;
}
span.sumtotal_wonTEXT {
    color: #7151fc;
    font-size: 30px;
    float: right;
}
span.sumValue {
    color: #7151fc;
    font-size: 50px;
    float: right;
    line-height: 33px;
}
input.disab{
}
input.abl {
    display: block;
    border: none;
    background-color: #7151fc;
    color: white;
    font-size: 20px;
    padding: 17px;
    margin-top: 82px;
    width: 320px;
    cursor: pointer;
}
input.abl:hover{
	background-color: #6542fc;
}
input.disab {
    display: block;
    border: none;
    background-color: #999999;
    color: white;
    font-size: 20px;
    padding: 17px;
    margin-top: 82px;
    width: 320px;
}
.hole {
    height: 200px;
}
.textTopWrapper {
    margin-top: 40px;
}
td.hasNoMyBasketProducts {
    text-align: center;
    padding: 70px 0;
    font-size: 20px;
    color: #999;
}
</style>
</head>
<body>
<script>

	//전체 가격 
	var total = Number(0);

	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	function sumfunc(addvalue){
		total += Number(addvalue);
		
		document.getElementById('hid_sumValue').value = total;
		document.getElementById('sumValue').innerHTML = addComma(total);
		
		document.getElementById('order_submit').disabled = false;
		document.getElementById('order_submit').classList.remove('disab');
		document.getElementById('order_submit').classList.add('abl');
	}
	function subfunc(subvalue){
		total -= Number(subvalue);
		
		document.getElementById('hid_sumValue').value = total;
		document.getElementById('sumValue').innerHTML = addComma(total);
		
		if(total == 0){
			document.getElementById('order_submit').disabled = true;
			document.getElementById('order_submit').classList.remove('abl');
			document.getElementById('order_submit').classList.add('disab');
		}
		
	}
	function basketChecking(checkTarget, keyNumber){
		if(checkTarget.checked){
			//체크되있을때 디스에이블 풀러야댐
			sumfunc(Number(document.getElementById('hid_currentPrice'+keyNumber).value));
			document.getElementById('hid_product_num'+keyNumber).disabled = false;
			document.getElementById('hid_product_subject'+keyNumber).disabled = false;
			document.getElementById('hid_product_img'+keyNumber).disabled = false;
			document.getElementById('hid_price'+keyNumber).disabled = false;
			document.getElementById('hid_currentPrice'+keyNumber).disabled = false;
			document.getElementById('hid_quantity'+keyNumber).disabled = false;
			document.getElementById('hid_seller'+keyNumber).disabled = false;
		}else if(!checkTarget.checked){
			//체크해제일때 디스에이블 걸어야댐
			subfunc(Number(document.getElementById('hid_currentPrice'+keyNumber).value));
			document.getElementById('hid_product_num'+keyNumber).disabled = true;
			document.getElementById('hid_product_subject'+keyNumber).disabled = true;
			document.getElementById('hid_product_img'+keyNumber).disabled = true;
			document.getElementById('hid_price'+keyNumber).disabled = true;
			document.getElementById('hid_currentPrice'+keyNumber).disabled = true;
			document.getElementById('hid_quantity'+keyNumber).disabled = true;
			document.getElementById('hid_seller'+keyNumber).disabled = true;
		
			
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
						//alert('차감되었어요!');
						var uppoint = Number(document.getElementById('hid_quantity'+keyNumber).value) - 1;
						var priceInfo = Number(document.getElementById('hid_price'+keyNumber).value);
						var multiResult = uppoint * priceInfo;
						
						document.getElementById('hid_quantity'+keyNumber).value = uppoint;
						document.getElementById('product_quantity'+keyNumber).innerHTML = uppoint;
					
						document.getElementById('hid_currentPrice'+keyNumber).value = multiResult;
						document.getElementById('subtotal'+keyNumber).innerHTML = addComma(multiResult);
					
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
						//alert('상승!');
						var uppoint = Number(document.getElementById('hid_quantity'+keyNumber).value) + 1;
						var priceInfo = Number(document.getElementById('hid_price'+keyNumber).value);
						var multiResult = uppoint * priceInfo;

						document.getElementById('hid_quantity'+keyNumber).value = uppoint;
						document.getElementById('product_quantity'+keyNumber).innerHTML = uppoint;
						
						document.getElementById('hid_currentPrice'+keyNumber).value = multiResult;
						document.getElementById('subtotal'+keyNumber).innerHTML = addComma(multiResult);
					
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
	<form action="/picksell/purchase/batchOrder" method="post">
	<div class="textTopWrapper">
		<span class="basketTEXT">장바구니</span> <span class="basketTotalTEXT">${listSize }</span>
	</div>
	<table class="basketTable" cellpadding="0" cellspacing="0">
		<tr>
			<td class="tableTitle" colspan="3">상품 정보</td>
			<td class="tableTitle title1">수량</td>
			<td class="tableTitle title2" colspan="2">상품금액</td>
		</tr>
		
		<c:choose>
		<c:when test="${empty resultList }">
			<tr>
				<td colspan="6" class="hasNoMyBasketProducts">장바구니에 담은 상품이 없습니다</td>
			</tr>
		</c:when>
		<c:when test="${!empty resultList }">
		<!-- 장바구니 시작 -->
		<c:forEach var="list" items="${resultList }" varStatus="indexStatus">
			<input type="hidden" id="hid_product_subject${indexStatus.index }" name="p_list[${indexStatus.index }].product_subject" value="${list.SUBJECT }" disabled="disabled" />
			<input type="hidden" id="hid_product_num${indexStatus.index }" name="p_list[${indexStatus.index }].product_num" value="${list.PRODUCT_NUM }" disabled="disabled" />
			<input type="hidden" id="hid_product_img${indexStatus.index }" name="p_list[${indexStatus.index }].product_img" value="${list.FIRST_IMG }" disabled="disabled" />
			<input type="hidden" id="hid_price${indexStatus.index }" name="p_list[${indexStatus.index }].product_price" value="${list.PRICE }" disabled="disabled" />
			<input type="hidden" id="hid_currentPrice${indexStatus.index }" name="p_list[${indexStatus.index }].product_currentPrice" value="${list.PRICE * list.PRODUCT_QUANTITY }" disabled="disabled" />
			<input type="hidden" id="hid_quantity${indexStatus.index }" name="p_list[${indexStatus.index }].orderSum" value="${list.PRODUCT_QUANTITY }" disabled="disabled" />
			<input type="hidden" id="hid_seller${indexStatus.index }" name="p_list[${indexStatus.index }].seller_id" value="${list.SELLER_ID }" disabled="disabled" />
			<input type="hidden" id="hid_stock${indexStatus.index }" value="${list.STOCK }" />
			
			
			<tr>
				<td class="product_checkTD"><input type="checkbox" onclick="basketChecking(this, ${indexStatus.index})" id="baketCheck${indexStatus.index }" /></td>
				<td class="product_imgTD">
					<a href="/picksell/products/detail/${list.CATEGORY_NUM}/${list.PRODUCT_NUM}">
					<img src="/picksell/resources/productUpload/${list.FIRST_IMG }" class="product_img" onerror="this.src='/picksell/resources/img/imgready.gif'"/>
					</a>
				</td>
				
				<td class="product_infoTD">
					<span class="product_subjectTEXT">${list.SUBJECT }</span>
					
					<span class="product_priceTEXT"><fmt:formatNumber value="${list.PRICE }" pattern="#,###.##" /></span>
					<span class="product_wonTEXT">원</span>
				</td>
				<td class="product_quanTD">
					<input type="button" class="subbtn" value="" onclick="subQuantity(${list.BASKET_NUM},${indexStatus.index})" />
					<span class="proquan" id="product_quantity${indexStatus.index }">${list.PRODUCT_QUANTITY }</span>
					<input type="button" class="addbtn" value="" onclick="addQuantity(${list.BASKET_NUM},${indexStatus.index })" />
				</td>
				<td class="product_priceTD">
					<span id="subtotal${indexStatus.index }">
					<fmt:formatNumber value="${list.PRICE * list.PRODUCT_QUANTITY }" pattern="#,###.##" />
					</span>
					<span class="subtotal_wonTEXT">원</span>
				</td>
				<td class="product_deleteTD"><a href="/picksell/cart/delete/${list.BASKET_NUM }" class="deleteA">삭제</a></td>
			</tr>
		</c:forEach><!-- foreach End -->
		</c:when>
		</c:choose>
	</table>
	<a href="/picksell/cart/deleteAll" class="deleteAll">전체삭제</a>
	
	<div class="summaryInfoWrap">
		<span class="sumText">총 합계</span>
		<input type="hidden" id="hid_sumValue" name="totalSum" value="0" />
		<span class="sumtotal_wonTEXT">원</span>
		<span class="sumValue" id="sumValue">0</span>
		<input type="submit" class="disab" value="구매하기" id="order_submit" disabled="disabled" />
	</div>
	<div class="hole"></div>
	</form>
</body>
</html>
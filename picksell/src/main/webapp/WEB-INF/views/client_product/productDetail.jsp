<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/picksell/resources/clientcss/productDetail.css" type="text/css" />
</head>
<body>

<script>
	//알람입력
	function alarmInsert(ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND){
	var allData = "ALARM_TARGET="+ALARM_TARGET+"&ALARM_VARIABLE1="+ALARM_VARIABLE1+"&ALARM_VARIABLE2="+ALARM_VARIABLE2+"&ALARM_WRITER="+ALARM_WRITER+"&ALARM_KIND="+ALARM_KIND;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmInsert",
				dataType : 'json',
				data : allData,
				success : function(data){
					alert("알람입력완료");
				}
			});	
	}
	//구매요청
	function purchaseApply(SELLER_ID, category_num, product_num, sessionId){
		fetch('/picksell/products/purchseRequest/${product_num}/${sessionScope.sessionId}').then(function(response){
			response.text().then(function(text){
				if(response.status == '200'){
					alert('구매신청이 완료되었습니다! \n판매자의 수락까지 기다려주세요');
					var inner = "<input type='button' value='구매신청 취소하기' onclick='purchaseCancel()' />";
					document.getElementById('purchaseWrap').innerHTML = inner;	
					alarmInsert(SELLER_ID, category_num, product_num, sessionId, "3");
				}
			})
		})
	}
	//구매요청 취소
	function purchaseCancel(SELLER_ID, category_num, product_num, sessionId){
		fetch('/picksell/products/purchseRequestCancel/${product_num}/${sessionScope.sessionId}').then(function(response){
			response.text().then(function(text){
				if(response.status == '200'){
					alert('구매신청이 취소되었습니다!');
					var inner = "<input type='button' value='구매신청하기' onclick='purchaseApply()' />";
					document.getElementById('purchaseWrap').innerHTML = inner;
					alarmInsert(SELLER_ID, category_num, product_num, sessionId, "7");
				}
			})
		})
	}
	//장바구니담기
	function gotoBasket(){
		location.href='/picksell/cart';
	}
	function intoBasket(){
		fetch('/picksell/cart/into/${product_num}/${sessionScope.sessionId}').then(function(response){
			response.text().then(function(text){
				if(response.status == '200'){
					alert('장바구니에 담았습니다!');
					var inner = "<input type='button' class='basket_go' value='장바구니로가기' onclick='gotoBasket();' />";
					document.getElementById('basketWrap').innerHTML = inner;
				}
			})
		})
	}
	//(판매자가)구매신청 수락
	function purchaseApprove(eventElement, purchaseNumber, buyer, category_num, product_num, sessionId){
		var params = "pn=${product_num}&purnum="+purchaseNumber+"&buyer="+buyer;
		$.ajax({
			type : "POST",
			url : "/picksell/products/purchaseApproveProc",
			dataType : 'json',
			data : params,
			success : function(data){
				
				//만약에 수락이 정상적으로 이루어져서 임의로 만든 resultCode 가 'success' 를 담았다면,
				if(data.resultCode == 'success'){
					alarmInsert(buyer, category_num, product_num,sessionId,"2");
					alert(data.resultMsg);
					$(eventElement).parents('td').html('<input type="button" value="수락취소" onclick="purchaseApproveCancel(this,'+data.purchase_num+','+data.buyerID+');" />');
				//만약에 수락이 중복되어 임의로 만든 resultCode 가 'fail' 를 담았다면,
				}else if(data.resultCode == 'fail'){
					alert(data.resultMsg);
				}
				
				//document.location.href='/picksell/products/detail/${category_num}/${product_num}';
				
				
			}
		});
	}

	//(판매자가)구매신청 수락 취소
	function purchaseApproveCancel(eventElement, purchaseNumber, buyer, category_num, product_num, sessionId){

		var params = "pn=${product_num}&purnum="+purchaseNumber+"&buyer="+buyer;
		$.ajax({
			type : "POST",
			url : "/picksell/products/purchaseApproveCancelProc",
			dataType : 'json',
			data : params,
			success : function(data){
				
				//만약에 수락취소가 정상적으로 이루어져서 임의로 만든 resultCode 가 'success' 를 담았다면,
				if(data.resultCode == 'success'){
					alert(data.resultMsg);
          alarmInsert(buyer, category_num, product_num,sessionId,"8");
					$(eventElement).parents('td').html('<input type="button" value="수락" onclick="purchaseApprove(this,'+purchaseNumber+','+buyer+','+category_num+','+product_num+','+sessionId+');" />');
				//만약에 수락취소가 중복되어 임의로 만든 resultCode 가 'fail' 를 담았다면,
				}else if(data.resultCode == 'fail'){
					alert(data.resultMsg);
				}

			}
		});
	}
	
</script>

<!-- 모달div background -->
<div class="hiddenBackGround" onclick="closeCommentForm()"></div>
<!-- 문의댓글 모달div -->
<div class="hiddenCommentForm">
	<div class="formTop">
		<span class="cancel"><a href="#" onclick="closeCommentForm()">X</a></span>
	</div>
	<div class="formBody">
		<form action="/picksell/products/commentProc" method="post" id="commentForm">
			<input type="hidden" name="product_num" value="${product_num }" />
			<input type="hidden" name="currentPage" value="${currentPage }" />
			<input type="hidden" name="category_num" value="${category_num }" />
			<input type="hidden" name="comment_writer" value="상품문의작성자" />
			<input type="hidden" name="step_num" value="0" />
			<input type="text" name="comment_content" />
			<input type="submit" value="작성" />
		</form>
	</div>
</div><!-- hiddenCommentForm end -->

<!-- 문의리스트 모달div where isMyProducts = true 일때 -->
<div class="hiddenPurchaseListForm">
	<div class="purchaseList">
		<c:if test="${isMyProducts == 'yes' }">
			<table>
				<tr>
					<td>구매요청 아이디</td>
					<td>신청날짜</td>
					<td colspan="2">신청상태</td>
				</tr>
			<c:forEach var="sellerPurList" items="${sellerPurList }">
				<tr>
					<td>${sellerPurList.BUYER_ID }</td>
					<td>${sellerPurList.REGDATE }</td>
					
					<c:choose>
						<c:when test="${sellerPurList.STATUS == 0 }">
						<td>요청대기중</td>
						</c:when>
						<c:when test="${sellerPurList.STATUS == 1 }">
						<td>수락상태</td>
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${sellerPurList.STATUS == 0 }">
							<td><input type="button" value="수락" onclick="purchaseApprove(this,'${sellerPurList.PURCHASE_NUM}','${sellerPurList.BUYER_ID }','${category_num}','${product_num}','${sessionId}');" /></td>
						</c:when>
						<c:when test="${sellerPurList.STATUS == 1 }">
							<td><input type="button" value="수락취소" onclick="purchaseApproveCancel(this, '${sellerPurList.PURCHASE_NUM}','${sellerPurList.BUYER_ID }','${category_num}','${product_num}','${sessionId}');" /></td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
			</table>
		</c:if>
	</div>
</div><!-- hiddenPurchaseListForm end -->

	<!-- 컨텐츠 시작 -->
	<div class="contentWrap">
	<form action="/picksell/purchase/order/single" method="post">
	
	<div class="categoryMoveWrap">
		<c:if test="${resultObject.HOWTOSELL != 2 }">
			<a class="link_wholeList" href="/picksell/products/goods">전체목록</a>
			<span class="letterGT">></span>
			<a class="link_productList" href="/picksell/products/goods?ca=${resultObject.CATEGORY_NUM }">${resultObject.CATEGORY_NAME }</a>
		</c:if>
		<c:if test="${resultObject.HOWTOSELL == 2 }">
			<a class="link_wholeList" href="/picksell/products/plus">전체목록</a>
			<span class="letterGT">></span>
			<a class="link_productList" href="/picksell/products/plus?ca=${resultObject.CATEGORY_NUM }">${resultObject.CATEGORY_NAME }</a>
		</c:if>
	</div>
		
		<!-- 상품판매정보 시작 -->
		<div class="seller_info">
			<img src="/picksell/resources/img/imgready.gif" class="sellerProfileImg" />
		</div>
		<div class="product_info">
			<span class="sellerId">${resultObject.SELLER_ID }</span>
			<span class="product_info_subject">${resultObject.SUBJECT }</span>
			<span class="product_info_number">상품번호: ${resultObject.PRODUCT_NUM } / [${resultObject.CATEGORY_NAME }]</span>
			<p class="product_phr">
			<span class="product_info_priceTEXT">판매가</span>
			<span id="currentPriceText" class="product_info_priceVALUE"><fmt:formatNumber value="${resultObject.PRICE }" pattern="#,###.##" /></span>
			<span class="product_info_wonTEXT">원</span>
			
			<!-- 폼데이터부분 -->
			<input type="hidden" name="totalSum" id="currentPrice" value="${resultObject.PRICE }" />
			<input type="hidden" name="p_list[0].orderSum" id="currentOrderSum" value="1" />
			<input type="hidden" name="p_list[0].product_price" value="${resultObject.PRICE }" />
			<input type="hidden" name="p_list[0].seller_id" value="${resultObject.SELLER_ID }" />
			<input type="hidden" name="p_list[0].product_img" value="${resultObject.FIRST_IMG }" />
			<input type="hidden" name="p_list[0].product_subject" value="${resultObject.SUBJECT }" />
			<input type="hidden" name="p_list[0].product_num" value="${resultObject.PRODUCT_NUM }" />
			
			<!-- 플러스판매일경우 수량체크 -->
			<c:if test="${resultObject.HOWTOSELL == 2 }">
			
			<div class="product_info_quanWrap">
	 			<span class="product_info_quanTEXT">수량</span>
	 			<input type="button" class="subQuanBtn" value="" id="subBtn" onclick="subOrder()" disabled="disabled"/>
	 			<span class="product_info_quanVALUE" id="currentOrderView">1</span>
	 			<input type="button" class="addQuanBtn" value="" id="addBtn" onclick="addOrder();" />
			</div>
			
			</c:if>
			
			<!-- 버튼시작 -->
			<div class="button_wrap">
			<c:if test="${sessionScope.sessionId != null }">
			<!-- 장바구니버튼 -->
			<div class="basketWrap" id="basketWrap">
				<c:choose>
					<c:when test="${resultObject.HOWTOSELL != 2 }">
						<input type="button" class="basket_disabled" value="장바구니" disabled="disabled" />
					</c:when>
					<c:when test="${resultObject.HOWTOSELL == 2 and alreadyBasket == false }">
						<input type="button" class="basket_abled" value="장바구니" onclick="intoBasket();" />
					</c:when>
					<c:when test="${resultObject.HOWTOSELL == 2 and alreadyBasket == true }">
						<input type="button" class="basket_go" value="장바구니로가기" onclick="location.href='/picksell/cart'" />
					</c:when>
				</c:choose>
			</div>
			
			<!-- 구매신청하기버튼 -->
			
				<c:choose>
					<c:when test="${resultObject.DEAL_STATUS == 0 and resultObject.HOWTOSELL != 2 and alreadyPurchase == false and isMyProducts == 'no' }">
						<div class="purchaseWrap" id="purchaseWrap">
						<input type="button" class="purchase_apply" value="구매신청하기" onclick="purchaseApply('${resultObject.SELLER_ID}','${category_num}','${product_num}','${sessionId}');" />
						</div>
					</c:when>
					<c:when test="${isApprovedPC == 'yes' and alreadyPurchase == true }">
						<div class="purchaseWrap" id="purchaseWrap">
						<input type="submit" class="purchase_go" value="구매하기" />
						</div>
					</c:when>
					<c:when test="${alreadyPurchase == true }">
						<div class="purchaseWrap" id="purchaseWrap">
						<input type="button" class="purchase_cancel" value="구매신청 취소하기" onclick="purchaseCancel('${resultObject.SELLER_ID}','${category_num}','${product_num}','${sessionId}');" />
						</div>
					</c:when>
					<c:when test="${isMyProducts == 'yes' }">
						<div class="purchaseWrap" id="purchaseWrap">
						<input type="button" class="purchase_confirm" value="구매신청 확인하기" onclick="openPurchaseList();" />
						</div>
					</c:when>
				</c:choose>
			
			
			<!-- 구매하기 + 구매수락일때를 생각해야함 -->
			<c:choose>
				<c:when test="${resultObject.HOWTOSELL == 2 }">
					<input type="submit" class="purchase_go" value="구매하기" />
				</c:when>
			</c:choose>
			
			</c:if><!-- 세션조건 끝 -->
		</div>
		</div>
		
		<div class="product_detail">
			<span class="product_contentTEXT">상품 정보</span>
			<div class="product_content">
			${resultObject.CONTENT }
			</div>
		</div>
		<div class="delivery_info">
			<span class="product_contentTEXT">배송 정보</span>
			<span class="deliveryTEXT">1. 판매자가 제품을 발송하면 택배사, 송장번호를 안내해드립니다.</span>
			<span class="deliveryTEXT">2. 결제후 3일 이내에 판매자가 제품을 발송하지 않으면 거래가 자동 취소됩니다.</span>
			<span class="deliveryTEXT">3. 제품인수 후 3일 이내에 구매자가 인수확인하지 않으면 자동 인수확인처리 됩니다.</span>
		</div>
		<div class="commentWrap">
			<span class="product_contentTEXT">상품 문의</span><span class="commentSumTEXT">[개수]</span>
			<input type="button" value="상품 문의하기" onclick="openCommentForm()" />
			<div class="commentListWrap">
				<c:choose>
					<c:when test="${empty resultCommentList }">
						등록된 상품문의가 없습니다
						<p>
						내가쓴 상품문의는 판매자외의 다른사람이 볼 수 없습니다!
					</c:when>
					<c:when test="${!empty resultCommentList }">
						<c:forEach var="comment" items="${resultCommentList }">
							<p>${comment.COMMENT_WRITER } .. ${comment.COMMENT_REGDATE } .. ${comment.COMMENT_CONTENT }
						</c:forEach>
					</c:when>
				</c:choose>
				
				
			</div><!-- commentListWrap end -->
		</div><!-- commentWrap end -->
	</form><!-- form end -->
	</div><!-- contentWrap end -->
<script>
	function openCommentForm(){
		$(".hiddenBackGround").show();
		$(".hiddenCommentForm").show();
	}
	function closeCommentForm(){
		$(".hiddenBackGround").hide();
		$(".hiddenCommentForm").hide();
		
		$(".hiddenPurchaseListForm").hide();
	}
	function openPurchaseList(){
		$(".hiddenPurchaseListForm").show();
		$(".hiddenBackGround").show();
	}

	var product_stock = Number('${resultObject.STOCK}');
	var product_price = Number('${resultObject.PRICE}');
	var current_price = Number(document.getElementById('currentPrice').value);
	var current_price_ele = document.getElementById('currentPrice');
	var current_order_sum = Number(document.getElementById('currentOrderSum').value);
	var current_order_sum_ele = document.getElementById('currentOrderSum');
	var current_order_view = document.getElementById('currentOrderView');
	var current_price_view = document.getElementById('currentPriceText');
	var subBtn_ele = document.getElementById('subBtn');
	
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
	function addOrder(){
		if((current_order_sum + 1) > product_stock){
			alert('최대 수량입니다');
			return false;
		}else{
			subBtn_ele.disabled = false;
			//현재 주문+1 처리
			current_order_sum += 1;
			current_order_sum_ele.value = current_order_sum;
			current_order_view.innerHTML = current_order_sum;
			
			//가격 주문* 처리
			current_price = product_price * current_order_sum;
			current_price_ele.value = current_price;
			current_price_view.innerHTML = addComma(current_price);
		}
	}
	function subOrder(){
			//현재 주문-1 처리
			current_order_sum -= 1;
			current_order_sum_ele.value = current_order_sum;
			current_order_view.innerHTML = current_order_sum;
			
			//가격 주문* 처리
			current_price = product_price * current_order_sum;
			current_price_ele.value = current_price;
			current_price_view.innerHTML = addComma(current_price);
		
			if(current_order_sum == 1)
				subBtn_ele.disabled = true;
	}
	
</script>

</body>
</html>
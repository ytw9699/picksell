<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.hiddenBackGround{
    width: 100%;
    background-color: #262626;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    opacity: 0.7;
    display: none;
}
.hiddenCommentForm{
	display: none;
	width: 300px;
    background-color: white;
    position: fixed;
    top: 0;
    left: 0;
    height: 100px;
}

</style>

</head>
<body>
<script>
	function applyFetch(){ //패치 테스트용
		fetch('/picksell/fetchTest').then(function(response){
			response.text().then(function(text){
				//document.querySelector('body').innerHTML = text;
				//document.getElementById('fetchResult').innerHTML = text;
				if(response.status == '200'){
					alert('fetch!');
				}
			})
		})
	}
	//구매요청
	function purchaseApply(){
		fetch('/picksell/products/purchseRequest/${product_num}/${sessionScope.sessionId}').then(function(response){
			response.text().then(function(text){
				if(response.status == '200'){
					alert('구매신청이 완료되었습니다! \n판매자의 수락까지 기다려주세요');
					var inner = "<input type='button' value='구매신청 취소하기' onclick='purchaseCancel()' />";
					document.getElementById('purchaseWrap').innerHTML = inner;		
				}
			})
		})
	}
	//구매요청 취소
	function purchaseCancel(){
		fetch('/picksell/products/purchseRequestCancel/${product_num}/${sessionScope.sessionId}').then(function(response){
			response.text().then(function(text){
				if(response.status == '200'){
					alert('구매신청이 취소되었습니다!');
					var inner = "<input type='button' value='구매신청하기' onclick='purchaseApply()' />";
					document.getElementById('purchaseWrap').innerHTML = inner;
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
					var inner = "<input type='button' value='장바구니로가기' onclick='gotoBasket();' />";
					document.getElementById('basketWrap').innerHTML = inner;
				}
			})
		})
	}
	
	
	
</script>
<div class="hiddenBackGround" onclick="closeCommentForm()"></div>
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
</div>
	<div class="contentWrap">
	
	<%-- <c:if test="${resultObject.HOWTOSELL != 2 }">
		<p><a href="/picksell/products/goods?p=${currentPage }">전체목록</a>
		<p><a href="/picksell/products/goods?ca=">카테고리 목록</a>
	</c:if> --%>
	<%-- <c:if test="">
		<p><a href="">전체목록</a>
		<p><a href="">카테고리 목록</a>
	</c:if> --%>
	
		<div class="seller_info">
			<span>${resultObject.SELLER_ID }</span>
		</div>
		<div class="product_info">
			<span>상품번호: ${resultObject.PRODUCT_NUM }</span>
			<p>
			<span>가격: <fmt:formatNumber value="${resultObject.PRICE }" pattern="#,###.##" /> 원</span>
		</div>
		<div class="button_wrap">
			<!-- 장바구니버튼 -->
			<div class="basketWrap" id="basketWrap">
				<c:choose>
					<c:when test="${resultObject.HOWTOSELL != 2 }">
						<input type="button" value="장바구니" disabled="disabled" />
					</c:when>
					<c:when test="${resultObject.HOWTOSELL == 2 and alreadyBasket == false }">
						<input type="button" value="장바구니" onclick="intoBasket();" />
					</c:when>
					<c:when test="${resultObject.HOWTOSELL == 2 and alreadyBasket == true }">
						<input type="button" value="장바구니로가기" onclick="location.href='/picksell/cart'" />
					</c:when>
				</c:choose>
			</div>
			<!-- 구매신청하기버튼 -->
			<div class="purchaseWrap" id="purchaseWrap">
				<c:choose>
					<c:when test="${resultObject.DEAL_STATUS == 0 and resultObject.HOWTOSELL != 2 and alreadyPurchase == false }">
						<input type="button" value="구매신청하기" onclick="purchaseApply();" />
					</c:when>
					<c:when test="${alreadyPurchase == true }">
						<input type="button" value="구매신청 취소하기" onclick="purchaseCancel();" />
					</c:when>
				</c:choose>
			</div>
			
			<!-- 구매하기 + 구매수락일때를 생각해야함 -->
			<c:choose>
				<c:when test="${resultObject.HOWTOSELL == 2 }">
					<input type="button" value="구매하기" />
				</c:when>
			</c:choose>
			
			
		</div>
		<div class="product_detail">
			${resultObject.CONTENT }
		</div>
		<div class="delivery_info">
		<p>1. 판매자가 제품을 발송하면 택배사, 송장번호를 안내해드립니다.
		<p>2. 결제후 3일 이내에 판매자가 제품을 발송하지 않으면 거래가 자동 취소됩니다.
		<p>3. 제품인수 후 3일 이내에 구매자가 인수확인하지 않으면 자동 인수확인처리 됩니다.
		</div>
		<div class="commentWrap">
			<span>상품문의 [개수]</span><input type="button" value="상품 문의하기" onclick="openCommentForm()" />
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
				
				
			</div>
		</div>
	</div>
<script>
	function openCommentForm(){
		$(".hiddenBackGround").show();
		$(".hiddenCommentForm").show();
	}
	
	function closeCommentForm(){
		$(".hiddenBackGround").hide();
		$(".hiddenCommentForm").hide();
	}
		
</script>

</body>
</html>
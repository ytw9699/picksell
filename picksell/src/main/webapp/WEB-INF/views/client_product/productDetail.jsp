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
<div class="hiddenBackGround" onclick="closeCommentForm()"></div>
<div class="hiddenCommentForm">
	<div class="formTop">
		<span class="cancel"><a href="#" onclick="closeCommentForm()">X</a></span>
	</div>
	<div class="formBody">
		
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
			<input type="button" value="장바구니" />
			<input type="button" value="구매하기" />
			<input type="button" value="구매신청하기" />
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
				등록된 상품문의가 없습니다
				<p>
				내가쓴 상품문의는 판매자외의 다른사람이 볼 수 없습니다!
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
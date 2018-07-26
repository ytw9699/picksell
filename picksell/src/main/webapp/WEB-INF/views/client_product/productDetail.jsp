<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/picksell/resources/clientcss/productDetail.css" type="text/css" />
</head>
<body>

<script>
	
	//일반상품이면판매중인지
	$(document).ready(function(){
		
		var thisHowToSell = '${resultObject.DEAL_STATUS}';
		if(thisHowToSell == '1'){
			$('.status_on').width($('.status_on').parents('.product_info').width());
			$('.status_on').height($('.status_on').parents('.product_info').height());
			$('.status_on').show();
		}
		
		var isBlind = '${resultObject.BOARD_STATUS}';
		if(isBlind == '1'){
			$('.blindProcessBackGround').show();
			$('.blindProcessForm').show();
			$('.blindProcessBackGround').offset({top:$('.bodyWrap').offset().top})
			$('.blindProcessBackGround').height($('.bodyWrap').height());
		}
	});

	//알람입력
	function alarmInsert(ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND){
	var allData = "ALARM_TARGET="+ALARM_TARGET+"&ALARM_VARIABLE1="+ALARM_VARIABLE1+"&ALARM_VARIABLE2="+ALARM_VARIABLE2+"&ALARM_WRITER="+ALARM_WRITER+"&ALARM_KIND="+ALARM_KIND;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmInsert",
				dataType : 'json',
				data : allData,
				success : function(data){
					//alert("알람입력완료");
				}
			});	
	}
	//구매요청
	function purchaseApply(SELLER_ID, category_num, product_num, sessionId){
		fetch('/picksell/products/purchseRequest/${product_num}/${sessionScope.sessionId}').then(function(response){
			response.text().then(function(text){
				if(response.status == '200'){
					alert('구매신청이 완료되었습니다! \n판매자의 수락까지 기다려주세요');
					var inner = "<input type='button' class='purchase_cancel' value='구매신청 취소하기' onclick=purchaseCancel('"+SELLER_ID+"','"+category_num+"','"+product_num+"','"+sessionId+"'); />";
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
					var inner = "<input type='button' class='purchase_apply' value='구매신청하기' onclick=purchaseApply('"+SELLER_ID+"','"+category_num+"','"+product_num+"','"+sessionId+"'); />";
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
		var target = eventElement;
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
					var recreatingHTML = "<span class='purchaseStatusTEXT'>수락상태</span><input type='button' class='purchaseXbtn' value='수락취소' onclick=purchaseApproveCancel(this,"+purchaseNumber+",'"+buyer+"',"+category_num+","+product_num+",'"+sessionId+"'); />";
					$(eventElement).parents('td').html(recreatingHTML);
					//$(target).parents('tr').children('.purchaseStatusTEXT').html("111");
					//alert($(target).parents().find('.purchaseStatusTEXT').html());
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
		var target = eventElement;
		//alert($(a).val());
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
					var recreatingHTML = "<span class='purchaseStatusTEXT'>요청대기중</span><input type='button' class='purchaseObtn' value='수락' onclick=purchaseApprove(this,"+purchaseNumber+",'"+buyer+"',"+category_num+","+product_num+",'"+sessionId+"'); />";
          			$(eventElement).parents('td').html(recreatingHTML);
          			//$(target).parents('tr').children('.purchaseStatusTEXT').html("222");
          			//alert($(eventElement).parents('td').parents('tr').find('.purchaseStatus').html());
				//만약에 수락취소가 중복되어 임의로 만든 resultCode 가 'fail' 를 담았다면,
				}else if(data.resultCode == 'fail'){
					alert(data.resultMsg);
				}

			}
		});
	}
	
</script>
<!-- 블라인드처리div -->
<div class="blindProcessBackGround"></div>
<div class="blindProcessForm">
	<span class="blindTEXT">관리자에 의해 블라인드 처리된 판매글입니다</span>
	<input type="button" class="historyBTN" value="뒤로가기" onclick="javascript:history.back();" />
</div>
<!-- 모달div background -->
<div class="hiddenBackGround" onclick="closeCommentForm()"></div>
<!-- 문의댓글 모달div -->
<div class="hiddenCommentForm">
	<div class="formTop">
		<span class="cancel"><a href="#" class="closeAnchor" onclick="closeCommentForm()"></a></span>
	</div>
	<div class="formBody">
		<form action="/picksell/products/commentProc" method="post" id="commentForm">
			<input type="hidden" name="product_num" value="${product_num }" />
			<input type="hidden" name="currentPage" value="${currentPage }" />
			<input type="hidden" name="category_num" value="${category_num }" />
			<input type="hidden" name="comment_writer" value="${sessionScope.sessionId }" />
			<input type="hidden" name="step_num" value="0" />
			<input type="hidden" name="seller_id" value="${resultObject.SELLER_ID }" />
			<textarea name="comment_content" class="comment_content" placeholder="상품문의를 작성하세요. 판매자 외에는 볼 수 없습니다."></textarea>
			<!-- <input type="text" name="comment_content" /> -->
			<input type="submit" class="commentSUBMIT" value="작성" />
		</form>
	</div>
</div><!-- hiddenCommentForm end -->

<!-- 문의댓글리플 모달div -->
<div class="hiddenReCommentForm">
	<div class="formTop">
		<span class="cancel"><a href="#" class="closeAnchor" onclick="closeCommentForm()"></a></span>
	</div>
	<div class="formBody">
		<form action="/picksell/products/recommentProc" method="post" id="commentForm">
			<input type="hidden" name="product_num" value="${product_num }" />
			<input type="hidden" name="currentPage" value="${currentPage }" />
			<input type="hidden" name="category_num" value="${category_num }" />
			<input type="hidden" name="comment_writer" value="${sessionScope.sessionId }" />
			<input type="hidden" name="step_num" value="0" />
			<input type="hidden" name="owner" value="0" id="owner" />
			<input type="hidden" name="group_num" value="0" id="group_num" />
			<textarea name="comment_content" class="comment_content" placeholder="상품문의를 작성하세요. 판매자 외에는 볼 수 없습니다."></textarea>
			<!-- <input type="text" name="comment_content" /> -->
			<input type="submit" class="commentSUBMIT" value="작성" />
		</form>
	</div>
</div><!-- hiddenCommentForm end -->

<!-- 문의리스트 모달div where isMyProducts = true 일때 -->
<div class="hiddenPurchaseListForm">
	<div class="purchaseList">
		<c:if test="${isMyProducts == 'yes' }">
			<span class="purchaseHeaderTEXT">구매신청 리스트</span>
			<span class="purchaseHeaderSubTEXT">* 구매신청 수락 후 구매가 진행됩니다</span>
			<table class="purchaseTABLE" cellpadding="0" cellspacing="0">
				<tr>
					<td class="purchaseHeader">구매요청 아이디</td>
					<td class="purchaseHeader">신청날짜</td>
					<td class="purchaseHeader">신청상태</td>
				</tr>
			<c:forEach var="sellerPurList" items="${sellerPurList }">
				<tr>
					<td class="purchaseContent">${sellerPurList.BUYER_ID }</td>
					<td class="purchaseContent">${sellerPurList.REGDATE }</td>
					
					<%-- <c:choose>
						<c:when test="${sellerPurList.STATUS == 0 }">
						<td class="purchaseContent purchaseStatus">
							<span class="purchaseStatusTEXT">요청대기중</span>
						</td>
						</c:when>
						<c:when test="${sellerPurList.STATUS == 1 }">
						<td class="purchaseContent purchaseStatus">
							<span class="purchaseStatusTEXT">수락상태</span></td>
						</c:when>
					</c:choose> --%>
					
					<c:choose>
						<c:when test="${sellerPurList.STATUS == 0 }">
							<td class="purchaseContent">
							<span class="purchaseStatusTEXT">요청대기중</span>
							<input type="button" class="purchaseObtn" value="수락" onclick="purchaseApprove(this,'${sellerPurList.PURCHASE_NUM}','${sellerPurList.BUYER_ID }','${category_num}','${product_num}','${sessionId}');" /></td>
						</c:when>
						<c:when test="${sellerPurList.STATUS == 1 }">
							<td class="purchaseContent">
							<span class="purchaseStatusTEXT">수락상태</span>
							<input type="button" class="purchaseXbtn" value="수락취소" onclick="purchaseApproveCancel(this, '${sellerPurList.PURCHASE_NUM}','${sellerPurList.BUYER_ID }','${category_num}','${product_num}','${sessionId}');" /></td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
			</table>
		</c:if>
	</div>
</div><!-- hiddenPurchaseListForm end -->

<div id="hiddenSingoForm" class="hiddenSingoForm">
	<form action="/picksell/products/singoProc" method="post">
	<input type="hidden" name="singo_writer" value="${sessionScope.sessionId }" />
	<input type="hidden" name="singoee" value="${resultObject.SELLER_ID }" />
	<input type="hidden" name="product_num" value="${resultObject.PRODUCT_NUM }" />
	<input type="hidden" name="category_num" value="${resultObject.CATEGORY_NUM }" />
	<span class="singoHeaderTEXT">신고하기</span>
	<span class="singoSubHeaderTEXT">* 허위신고는 사이트 이용에 불이익이 있을 수 있습니다</span>
	<table class="singoTABLE" cellpadding="0" cellspacing="0">
		<tr>
			<td class="singoHeadTD">신고자</td>
			<td class="singoBodyTD">${sessionScope.sessionId }</td>
		</tr>
		<tr>
			<td class="singoHeadTD">신고대상자</td>
			<td class="singoBodyTD">${resultObject.SELLER_ID }</td>
		</tr>
		<tr>
			<td class="singoReasonTD">신고사유</td>
			<td class="singoTextareaTD">
			<textarea name="singo_content" class="singoTA"></textarea>
			</td>
		</tr>
	</table>
	<input type="submit" class="singoSUBMIT" value="신고하기" />
	</form>
</div>
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
			<img src="/picksell/resources/productUpload/${resultObject.FIRST_IMG }" onerror="this.src='/picksell/resources/img/imgready.gif'" class="sellerProfileImg" />
		</div>
		<div class="product_info">
			<!-- 이미판매중입니다 레이아웃 -->
			<div class="status_on">
				<span class="status_onTEXT">※ 현재 거래중인 제품입니다</span>
			</div>
			
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
			<input type="hidden" name="p_list[0].product_howtosell" value="${resultObject.HOWTOSELL }" />
			
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
					<c:when test="${resultObject.HOWTOSELL == 2 and alreadyBasket == false and resultObject.SELLER_ID != sessionScope.sessionId }">
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
					<c:when test="${isMyProducts == 'yes' and resultObject.HOWTOSELL != 2 }">
						<div class="purchaseWrap" id="purchaseWrap">
						<input type="button" class="purchase_confirm" value="구매신청 확인하기" onclick="openPurchaseList();" />
						</div>
					</c:when>
				</c:choose>
			
			
			<!-- 구매하기 + 구매수락일때를 생각해야함 -->
			<c:choose>
				<c:when test="${resultObject.HOWTOSELL == 2 and resultObject.SELLER_ID != sessionScope.sessionId }">
					<input type="submit" class="purchase_go" value="구매하기" />
				</c:when>
			</c:choose>
			
			</c:if><!-- 세션조건 끝 -->
		</div>
			<input type="button" id="singoOPEN" class="singoOPEN" value="신고하기" onclick="singoAccessing();" />
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
			<span class="product_contentTEXT">상품 문의</span><span class="commentSumTEXT">${fn:length(resultCommentList) }</span>
			<c:if test="${sessionScope.sessionId != null }">
			<input type="button" class="commentBTN" value="상품 문의하기" onclick="openCommentForm()" />
			</c:if>
			<div class="commentListWrap">
				<c:choose>
					<c:when test="${empty resultCommentList }">
						<c:if test="${sessionScope.sessionId != null }">
							<span class="hasNoCommentTEXT">상품문의를 작성하세요</span>
							<span class="hasNoCommentTEXT">내가쓴 상품문의는 판매자외의 다른사람이 볼 수 없습니다!</span>
						</c:if>
						<c:if test="${sessionScope.sessionId == null }">
							<span class="hasNoCommentTEXT">로그인 후에 상품문의를 작성할 수 있습니다</span>
						</c:if>
					</c:when>
					<c:when test="${!empty resultCommentList }">
						<c:forEach var="comment" items="${resultCommentList }">
							<div class="commenttWrapper <c:if test="${comment.STEP_NUM > 0 }">repleWrap</c:if>">
								<span class="commentWriter">${comment.COMMENT_WRITER }</span>
								<!-- 판매자의 댓글이면 별도의 span 표시 -->
								<c:if test="${comment.COMMENT_WRITER == resultObject.SELLER_ID}">
									<span class="commentOfSeller">판매자</span>
								</c:if>
								<c:if test="${sessionScope.sessionId == comment.COMMENT_WRITER }">
									<input type="button" class="deleteCommentBTN" onclick="deleteProductComment('${comment.COMMENT_NUM }','${comment.GROUP_NUM }','${comment.STEP_NUM }','${resultObject.CATEGORY_NUM }','${resultObject.PRODUCT_NUM }')" />
								</c:if>
								<span class="commentRegdate">
								<fmt:formatDate value="${comment.COMMENT_REGDATE }" pattern="YY.MM.dd" />
								</span>
								<span class="commentReBtnWrap">
									<c:if test="${comment.STEP_NUM == 0 and comment.COMMENT_WRITER != resultObject.SELLER_ID }">
										<input type="button" class="replyBTN" value="답변달기" onclick="openRecommentForm('${comment.GROUP_NUM}','${comment.COMMENT_WRITER }');" />
									</c:if>
								</span>
								<div class="commentContentWrap">
								${comment.COMMENT_CONTENT } 
								</div>
							</div>
							
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
		$(".hiddenReCommentForm").hide();
		$(".hiddenPurchaseListForm").hide();
		$(".hiddenSingoForm").hide();
	}
	function openPurchaseList(){
		$(".hiddenPurchaseListForm").show();
		$(".hiddenBackGround").show();
	}
	function openSingoForm(){
		$(".hiddenSingoForm").show();
		$(".hiddenBackGround").show();
	}
	function openRecommentForm(group_num, owner){
		$(".hiddenBackGround").show();
		$(".hiddenReCommentForm").show();
		$('#group_num').val(group_num);
		$('#owner').val(owner);
		
	}
	
	
	function singoAccessing(){
		var param = "singoee=${resultObject.SELLER_ID}&pn=${resultObject.PRODUCT_NUM }";
		$.ajax({
			type : "GET",
			url : "/picksell/products/isAbledSingo",
			dataType : 'json',
			data : param,
			success : function(data){
				if(data.statusCode == '0'){
					alert(data.msg);
				}else if(data.statusCode == '1'){
					alert(data.msg);
				}else if(data.statusCode == '2'){
					openSingoForm();
				}
			}
		});	
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
	
	function deleteProductComment(cn, gn, sn, category, product){
		var params = "?cn="+cn+"&gn="+gn+"&sn="+sn+"&category="+category+"&product="+product;
		
		if(confirm("상품문의를 삭제하시겠습니까?\n원글의경우 답변까지 삭제됩니다")){
			location.href="/picksell/products/deleteCommentProc"+params;
		}else{
			return;
		}
	}
</script>

</body>
</html>
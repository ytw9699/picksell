<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매글 관리</title>
<style>
</style>
</head>
<body>
<script>

function pulsStock(PRODUCT_NUM , index){
var allData = "PRODUCT_NUM="+PRODUCT_NUM;
		$.ajax({
			type : "GET",
			url : "/picksell/mypage/pulsStock",
			dataType : 'text',
			data : allData,
			success : function(data){
		var uppoint = Number(document.getElementById('currentStock'+index).innerHTML) + 1;
		document.getElementById('currentStock'+index).innerHTML = uppoint;
		alert("재고가 1개 증가되었습니다");
			}
		/* error : function(){
			alert("에러");
		} */
		});	
}
function minusStock(PRODUCT_NUM, index){
	var allData = "PRODUCT_NUM="+PRODUCT_NUM;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/minusStock",
				dataType : 'json',
				data : allData,
				success : function(data){
	var uppoint = Number(document.getElementById('currentStock'+index).innerHTML) - 1;
	document.getElementById('currentStock'+index).innerHTML = uppoint;
	alert("재고가 1개 감소되었습니다");
				}
			});	
}
</script>
<h4>
<a href="/picksell/mypage/sellList">모든 종류의 글</a>/
<a href="/picksell/mypage/sellList?HowToSell=0">중고 안전 상품글</a>/
<a href="/picksell/mypage/sellList?HowToSell=1">중고 안전 상품+직거래글</a>/
<a href="/picksell/mypage/sellList?HowToSell=2">픽셀플러스 상품글</a>/
</h4>
<h4>
<a href="/picksell/mypage/sellList?HowToSell=${HowToSell}">모든 상태의 글</a>/
<a href="/picksell/mypage/sellList?HowToSell=${HowToSell}&deal_status=0">판매중 글</a>/
<a href="/picksell/mypage/sellList?HowToSell=${HowToSell}&deal_status=1">거래중 글</a>/
<a href="/picksell/mypage/sellList?HowToSell=${HowToSell}&deal_status=2">종료된 글</a>/
	
</h4>
<table>
<c:if test="${fn:length(sellList) > 0}">
	<tr>
		<td>판매 종류</td>
		<td>판매 상태</td>
		<td>카테고리</td>
		<td>사진</td>
		<td>제목</td>
		<td>가격</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>재고수량</td>
	</tr>

<c:forEach var="list" items="${sellList}" varStatus="Index">
	<tr>
		<td>
		<c:if test="${list.HOWTOSELL == '0'}">
			중고 안전 거래 상품
		</c:if>
		<c:if test="${list.HOWTOSELL == '1'}">
			중고 안전거래+직거래 상품
		</c:if>
		<c:if test="${list.HOWTOSELL == '2'}">
			픽셀플러스 상품
		</c:if>
		</td>
		
		<td>
		<c:if test="${list.DEAL_STATUS == '0'}">
			판매중
		</c:if>
		<c:if test="${list.DEAL_STATUS == '1'}">
			거래중
		</c:if>
		<c:if test="${list.DEAL_STATUS == '2'}">
			판매종료
		</c:if>
		</td>
		
		<td>
		<c:if test="${list.CATEGORY_NUM == 1}">
		전자제품
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 2}">
		패션/의류
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 3}">
		패션/잡화
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 4}">
		화장품/미용
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 5}">
		스포츠/레저
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 6}">
		유아동/출산
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 7}">
		완구/문구/취미
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 8}">
		도서/음반/DVD
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 9}">
		가구/인테리어
		</c:if>
		<c:if test="${list.CATEGORY_NUM == 10}">
		생활/건강
		</c:if>
		</td>
		
		<td>
			<a href="/picksell/products/detail/${list.CATEGORY_NUM }/${list.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${list.FIRST_IMG }" style="width: 200px;" />
			</a>
		</td>
		<td><a href="/picksell/products/detail/${list.CATEGORY_NUM }/${list.PRODUCT_NUM }">${list.SUBJECT }</a></td>
		<td><fmt:formatNumber value="${list.PRICE }" pattern="#,###.##" /> 원</td>
		<td><fmt:formatDate value="${list.PRODUCT_REGDATE}" pattern="yy년 MM월 dd일 hh:mm" /></td>
		<td>&nbsp;&nbsp;${list.HITCOUNT }</td>
	<td>
	<input type="button" id="minusStock" value="-" onclick="minusStock(${list.PRODUCT_NUM},${Index.index})" />
	    <span id="currentStock${Index.index}">${list.STOCK }</span>
	<input type="button" id="pulsStock" value="+" onclick="pulsStock(${list.PRODUCT_NUM},${Index.index})" />
	</td>
	</tr>
</c:forEach>
</c:if>
	<c:if test="${fn:length(sellList) < 1}">
	<p>세션 아이디에 해당하는 판매 상품이 없습니다</p>
	</c:if>
</table>
	<div class="paging">
	 ${pagingHtml} 페이지
	</div>
</body>
</html>

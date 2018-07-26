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
input.subQuanBtn {
    width: 25px;
    height: 25px;
    border-radius: 33px;
    background: url(/picksell/resources/img/sub.png) 50% 50% no-repeat;
    background-size: 20px;
    border: 1px solid #ececec;
}
input.addQuanBtn {
    width: 25px;
    height: 25px;
    border-radius: 33px;
    background: url(/picksell/resources/img/add.png) 50% 50% no-repeat;
    background-size: 20px;
    border: 1px solid #ececec;
}
.proquan {
    font-size: 17px;
    color: #726e6e;
    margin: 0px 7px;
}
.paging {
    margin-top: 40px;
    text-align: center;
}
span.currentPaging {
    width: 40px;
    height: 40px;
    display: inline-block;
    background-color: #7151fc;
    color: white;
    border-radius: 30px;
    font-size: 23px;
}
a.paging {
    width: 40px;
    height: 40px;
    display: inline-block;
    color: #666;
    border-radius: 21px;
    font-size: 23px;
}
table.purchaseTABLE {
    width: 99%; 
}
.subjectTd {
    width: 13%;
    font-size: 17px;
    text-align: center;
}
.tdtd {
    width: 5%;
    font-size: 17px;
    text-align: center;
}
.purchaseList {
    width: 110%;
}
   
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
<div class="purchaseList">
<table class="purchaseTABLE" cellpadding="0" cellspacing="0">
<c:if test="${fn:length(sellList) > 0}">
<c:forEach var="list" items="${sellList}" varStatus="Index">
	<tr>
		<td class="tdtd">
			<a href="/picksell/products/detail/${list.CATEGORY_NUM }/${list.PRODUCT_NUM }">
			<img src="/picksell/resources/productUpload/${list.FIRST_IMG }" style="width: 90%; margin: 1%;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
			</a>
		</td>
		
		<td class="subjectTd"><a href="/picksell/products/detail/${list.CATEGORY_NUM }/${list.PRODUCT_NUM }">${list.SUBJECT }</a></td>
		
		
		<td class="tdtd"><fmt:formatNumber value="${list.PRICE }" pattern="#,###.##" /> 원</td>
		
		<td class="tdtd">
			<c:if test="${list.HOWTOSELL == '0'}">
				중고 안전 거래
			</c:if>
			<c:if test="${list.HOWTOSELL == '1'}">
				중고 안전거래+직거래
			</c:if>
			<c:if test="${list.HOWTOSELL == '2'}">
				픽셀플러스
			</c:if>
		</td>
		
		<td class="tdtd">
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
		
		<td class="tdtd">
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
		
		<td class="tdtd">조회수<br> ${list.HITCOUNT }</td>
	<td class="tdtd">재고량<br>
	<input type="button" id="minusStock" class="subQuanBtn" onclick="minusStock(${list.PRODUCT_NUM},${Index.index})" />
	    <span class="proquan" id="currentStock${Index.index}">${list.STOCK }</span>
	<input type="button" id="pulsStock" class="addQuanBtn" onclick="pulsStock(${list.PRODUCT_NUM},${Index.index})" />
	</td>
	<td class="tdtd">등록일<br><fmt:formatDate value="${list.PRODUCT_REGDATE}" pattern="yy. MM. dd." /></td>
	</tr>
</c:forEach>
</c:if>
	<c:if test="${fn:length(sellList) < 1}">
	<p>판매 상품이 없습니다</p>
	</c:if>
</table>
</div>
	<div class="paging">
	 ${pagingHtml}
	</div>
</body>
</html>

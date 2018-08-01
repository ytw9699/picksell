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
    width: 100%;
}
span.hasNoOrderList {
    display: block;
    /* border: 1px solid #999; */
    width: 22%;
    margin: 0 auto;
    margin-top: 50px;
    text-align: center;
    color: #999;
    font-size: 22px;
    padding-bottom: 11px;
}
.categoryList {
    width: 70%;
    padding-top: 25px;
    padding-bottom: 25px;
    display: inline-block;
    box-sizing: border-box;
    /* border: 1px solid #ececec; */
    height: 71px;
}

span.product_category > a {
    border: 1px solid #dbdbdb;
    padding: 8px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 19px;
    float: left;
    margin-left: 15px;
    margin-bottom: 11px;
}
span.product_category.active > a {
    background-color: #7151fc;
    border: 1px solid #7151fc;
}
.product_category:hover > a{
	border: 1px solid #7151fc;
	color: #7151fc;
}
span.product_category a {
    color: #b5b5b5;
    font-size: 15px;
}


span.product_category.active a {
    color: white;
}
.orderMethodWrap {
    height: 50px;
    margin-top: 40px;
    border-bottom: 2px solid #ececec;
        margin-bottom: 21px;
}
ul.orderMethodUL {
    margin: 0;
    padding: 0;
    height: 50px;
    line-height: 50px;
}

ul.orderMethodUL {
    margin: 0;
    padding: 0;
    height: 50px;
    line-height: 38px;
    margin-left: 11px;
}

li.orderMethodLI > a {
    float: left;
    width: 100px;
    text-align: center;
    font-size: 15px;
    color: #9f9f9f;
}
li.orderMethodLI.active > a {
    color: #7151fc;
    border-bottom: 2px solid #7151fc;
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

<div class="categoryList">
		<span class="product_category <c:if test="${param.HowToSell == '3'}">active</c:if>">
			<a href="/picksell/mypage/sellList?HowToSell=3&deal_status=3">모든 상품</a>
		</span>
		<span class="product_category <c:if test="${param.HowToSell == '0'}">active</c:if>">
			<a href="/picksell/mypage/sellList?HowToSell=0&deal_status=3">중고 안전 상품</a>
		</span>
		<span class="product_category <c:if test="${param.HowToSell == '1'}">active</c:if>">
			<a href="/picksell/mypage/sellList?HowToSell=1&deal_status=3">중고 안전 상품+직거래</a>
		</span>
		<span class="product_category <c:if test="${param.HowToSell == '2'}">active</c:if>">
			<a href="/picksell/mypage/sellList?HowToSell=2&deal_status=3">픽셀플러스 상품</a>
		</span>
</div>

<div class="orderMethodWrap">
	<ul class="orderMethodUL">
		<li class="orderMethodLI <c:if test="${param.deal_status == '3'}">active</c:if>">
			<a href="/picksell/mypage/sellList?HowToSell=${HowToSell}&deal_status=3">모든 글</a>
		</li>
		<li class="orderMethodLI <c:if test="${param.deal_status == '0'}">active</c:if>">
			<a href="/picksell/mypage/sellList?HowToSell=${HowToSell}&deal_status=0">판매중 글</a>
		</li>
		<li class="orderMethodLI <c:if test="${param.deal_status == '1'}">active</c:if>">
			<a href="/picksell/mypage/sellList?HowToSell=${HowToSell}&deal_status=1">거래중 글</a>
		</li>
			<li class="orderMethodLI <c:if test="${param.deal_status == '2'}">active</c:if>">
			<a href="/picksell/mypage/sellList?HowToSell=${HowToSell}&deal_status=2">종료된 글</a>
		</li>
	</ul>
	</div>
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
	<span class="hasNoOrderList">판매 상품이 없습니다</span>
	</c:if>
</table>
</div>
	<div class="paging">
	 ${pagingHtml}
	</div>
</body>
</html>

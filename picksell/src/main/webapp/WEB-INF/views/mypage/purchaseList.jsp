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
<title>구매내역</title>
<style>
table.purchaseTABLE {
    width: 105%; 
}
.confirm-auth-box {
    color: #7151FC;
    border-bottom: 2px solid #ececec;
    padding: 15px 0 15px 20px;
    font-size: 26px;
    margin: 0;
        margin-bottom: 21px;
    width: 25%;
}
.next {
    width: 80%;
    margin: 0 auto;
    margin-left: 0%;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 8%;
    font-size: 14px;
}
.subjectTd {
    width: 16%;
    font-size: 17px;
    text-align: center;
}
.tdtd {
    width: 12%;
    font-size: 17px;
    text-align: center;
}
.tbodys{
width: 10%;
margin-top: 10%;
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
</style>
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
					//alert("알람입력완료");
				}
			});	
	}
	function deletePurchaseList(PURCHASE_NUM, SELLER_ID, CATEGORY_NUM, PRODUCT_NUM, BUYER_ID){
		var allData = "PURCHASE_NUM="+PURCHASE_NUM;
				$.ajax({
					type : "GET",
					url : "/picksell/mypage/deletePurchaseList",
					dataType : 'json',
					data : allData,
					success : function(data){
						alarmInsert(SELLER_ID, CATEGORY_NUM, PRODUCT_NUM, BUYER_ID, "7");
						location.reload();
					}
				});	
	}
	
</script>
<div class="confirm-auth-box">중고 구매 요청 리스트</div>

<div class="purchaseList">	
<table class="purchaseTABLE" cellpadding="0" cellspacing="0">
<c:if test="${fn:length(purchaseList) > 0}">
	<c:forEach var="purchase" items="${purchaseList}" varStatus="status">
	<tbody class="tbodys">
	<tr>
		<td class="tdtd">
			<a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }">
<img src="/picksell/resources/productUpload/${purchase.FIRST_IMG }" style="width: 90%; margin: 1%;" onerror="this.src='/picksell/resources/img/imgready.gif'" />
			</a>
		</td>
		<td class="subjectTd"><a href="/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }">${purchase.SUBJECT }</a></td>
		<td class="tdtd"><fmt:formatNumber value="${purchase.PRICE }" pattern="#,###.##" /> 원</td>
		<td class="tdtd">요청일 <fmt:formatDate value="${purchase.REGDATE}" pattern="yy. MM. dd" /></td>
		<c:if test="${purchase.STATUS == '0'}">
		<td class="tdtd">수락 대기중</td>
		</c:if>
		<c:if test="${purchase.STATUS == '1'}">
		<td class="tdtd">수락 완료</td>
		</c:if>																	
		<td class="tdtd">판매자 ${purchase.SELLER_ID }</td>
		<td class="tdtd"><input type="button" value="요청 취소" class="next" id ="cancel" onclick="deletePurchaseList('${purchase.PURCHASE_NUM }','${purchase.SELLER_ID }','${purchase.CATEGORY_NUM }','${purchase.PRODUCT_NUM }','${purchase.BUYER_ID}');" /></td>
		<td class="tdtd"><input type="button" value="구매" class="next" id ="purchase${status.index+1}" disabled="disabled" onclick="location.href = '/picksell/products/detail/${purchase.CATEGORY_NUM }/${purchase.PRODUCT_NUM }'"/></td>
	</tr> 
	</tbody>
	<c:if test="${purchase.STATUS == '1'}">
<script>
	document.getElementById("purchase"+${status.index+1}).disabled = false;
</script>
	</c:if>
	<c:if test="${purchase.STATUS == '0'}">
<script>
	document.getElementById("purchase"+${status.index+1}).style="background-color: gray";
</script>
	</c:if>
	</c:forEach>
</c:if>
</table>
</div>
<c:if test="${fn:length(purchaseList) < 1}">
<span class="hasNoOrderList">내역이 없습니다</span>
</c:if>
</body>
</html>

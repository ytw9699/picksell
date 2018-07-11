<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.contentWrap {
    width: 80%;
    margin: 0 auto;
}

span.topTEXT {
    display: block;
    color: #7151fc;
    font-size: 22px;
    margin-top: 50px;
    text-align: center;
}
span.bottomTEXT {
    display: block;
    font-size: 15px;
    color: #666;
    text-align: center;
    margin-top: 15px;
}
table.payinfoTABLE {
    margin-top: 50px;
    border-top: 2px solid #d7dbe1;
    width: 100%;
}
td.infoTEXT {
    background-color: #ecedf0;
    color: #6f84b4;
    padding: 10px;
    width: 20%;
}
td.valueTEXT {
    color: #484747;
    padding-left: 20px;
}
span.subvalueTEXT {
    display: block;
    font-size: 13px;
}
ul.orderSuccessUL {
    padding: 0;
    margin: 0;
    padding-left: 3%;
    list-style: disc;
    display: block;
    margin-top: 10px;
}
li.orderSuccessLI {
    color: #a1a6b4;
    font-size: 14px;
    margin-bottom: 5px;
}
input.confirm {
    border: none;
    color: white;
    background-color: #68aefd;
    font-size: 18px;
    padding: 15px;
    width: 60%;
    margin: 0 auto;
    display: block;
    margin-top: 70px;
}

td.valueTEXT.total_priceTEXT {
    color: #7151fc;
    font-weight: 600;
}
td.infoTEXT.timetableTD {
    height: 60px;
}

</style>
</head>
<body>
<c:set var="deadline" value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 3) %>"/>
	<div class="contentWrap">
		<span class="topTEXT">무통장 입금 결제를 신청하였습니다</span>
		<span class="bottomTEXT">아래 계좌번호로 입금하시면 결제가 완료됩니다</span>
		
		<table class="payinfoTABLE" cellpadding="0" cellspacing="0">
			<tr>
				<td class="infoTEXT">입금은행</td>
				<td class="valueTEXT">신한은행</td>
			</tr>
			<tr>
				<td class="infoTEXT">계좌번호</td>
				<td class="valueTEXT">26190155852908</td>
			</tr>
			<tr>
				<td class="infoTEXT">입금액</td>
				<td class="valueTEXT total_priceTEXT">
				<fmt:formatNumber value="${total_price }" pattern="#,###.##" />원
				</td>
			</tr>
			<tr>
				<td class="infoTEXT">예금주명</td>
				<td class="valueTEXT">PICKSELL</td>
			</tr>
			<tr>
				<td class="infoTEXT timetableTD">입금 유효기간</td>
				<td class="valueTEXT">
				<fmt:formatDate value="${deadline }" type="DATE" pattern="yyyy년 MM월 dd일"/>
				<span class="subvalueTEXT">(입금 유효기간 경과 시 계좌번호는 자동 폐기됩니다.)</span>
				</td>
			</tr>
		</table>
		
		<ul class="orderSuccessUL">
			<li class="orderSuccessLI">은행창구, ATM 및 CD기를 통한 입금만 가능합니다.</li>
			<li class="orderSuccessLI">신청하신 은행과 다른 은행의 ATM기에서는 입금되지 않습니다.</li>
			<li class="orderSuccessLI">은행을 변경하시려면 은행지점/ATM입금 신청을 취소하여 주시기 바랍니다.</li>
			<li class="orderSuccessLI">현금영수증은 결제 완료 후 신청하실 수 있습니다.</li>
		</ul>
		
		<input class="confirm" type="button" value="확인" onclick="location.href='/picksell/main'" />
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>마이페이지 초안</title>
<style>
.mypage {
    border-top: 1px solid #dadada;
    padding: 10px;
    box-sizing: border-box;
    width: 170px;
    color: #666;
}
.myWrapper {
    border-left: 1px solid #dadada;
    border-right: 1px solid #dadada;
    border-bottom: 1px solid #dadada;
}
.mypage:hover > a, .mypage:hover {
    color: #7151fc;
}
.mypage a {
    color: #666;
}
</style>
</head>
<body>
<div class="myWrapper">
<div class="mypage">마이페이지</div>
<div class="mypage"><a href="/picksell/mypage/memberCheck">회원정보 확인/수정</a></div>
<div class="mypage"><a href="/picksell/mypage/orderList">주문 내역/배송 조회</a></div>
<div class="mypage"><a href="/picksell/mypage/saleList">판매 내역/배송 조회</a></div>
<div class="mypage"><a href="/picksell/mypage/sellList?HowToSell=3&deal_status=3">판매글 조회</a></div>
<div class="mypage"><a href="/picksell/mypage/purchaseList">중고구매 요청 리스트</a></div>
<div class="mypage"><a href="/picksell/mypage/secondSellList">중고판매 요청 리스트</a></div>
<div class="mypage"><a href="/picksell/mypage/recentProduct">최근 본 상품</a></div>
<div class="mypage"><a href="/picksell/mypage/alarmSelect">알림 조회</a></div>
</div>
</body>
</html>
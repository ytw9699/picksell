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
</head>
<body>
<p>마이페이지</p>
<p><a href="/picksell/mypage/memberCheck">회원정보 확인/수정</a></p>
<p><a href="/picksell/mypage/purchaseList/0">일반구매 신청 리스트</a></p>
<p><a href="/picksell/mypage/sellList">판매글 관리</a></p>
<p><a href="/picksell/mypage/saleList">판매 내역/배송 조회</a></p>
<p><a href="/picksell/mypage/orderList">주문 내역/배송 조회</a></p>
<p><a href="/picksell/mypage/memberCheck" onclick="alert('개발중');">알림 설정</a></p>
</body>
</html>

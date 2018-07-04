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
<p><a href="/picksell/mypage/modify">마이페이지</a></p>
<p><a href="/picksell/mypage/modify">내정보</a></p>
<p><a href="/picksell/mypage/sellList/0">판매내역</a></p>
<p><a href="/picksell/mypage/purchaseList/0">구매신청리스트</a></p>
<p><a href="/picksell/mypage/orderList">배송 및 주문 조회</a></p>
<p><a href="/picksell/mypage/modify" onclick="alert('공사중');">알림설정</a></p>
</body>
</html>

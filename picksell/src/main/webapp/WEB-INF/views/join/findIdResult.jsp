<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title></title>
<style>
</style>
</head>
<body>
<h3>
<div>아이디찾기 결과</div>
<c:if test="${findIdResult == null}">
	아이디가 없습니다
</c:if>

<c:if test="${findIdResult != null}">
	<p>아이디는 ${findIdResult}입니다</p>
</c:if>
<p><a href="/picksell/loginForm" >로그인 </a></p>
<p><a href="/picksell/resetPasswordForm" >비밀번호 찾기 </a></p>
</h3>
</body>
</html>
















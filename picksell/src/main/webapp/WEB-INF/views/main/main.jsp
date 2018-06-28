<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
</head>

<body>

<center>

	picksell 메인
	<br/>
	<c:if test="${sessionId == null}">
		 로그인을 해주시기 바랍니다.
		 <br/>
		<input type="button" value="Login" onClick="javascript:location.href='/picksell/loginForm'"/>
	</c:if>
	
	<c:if test="${sessionId != null}">
	아이디 ${sessionId} 
	<br/>
	<input type="button" value="LogOut" onClick="javascript:location.href='/picksell/logout'"/>	 
	</c:if>
	 
</center>

</body>
</html>

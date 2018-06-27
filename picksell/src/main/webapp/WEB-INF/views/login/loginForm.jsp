<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
<center>
	로그인 하기
	<form method="post">
		<p>아이디 <input type="text" name="userId" />
		<p>비밀번호 <input type="password" name="userPw" />
		<p><input type="submit" value="로그인" />
		<P>계정을 잊어버리셨나요?</P>
	</form>
</center>
</body>
</html>
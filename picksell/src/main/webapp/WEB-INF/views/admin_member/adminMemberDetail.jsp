<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 회원 상세보기</title>
</head>
<body>
<table>
<tr><a href="">아이디 : ${map.ID }</a></tr>
<tr>이름 : ${map.NAME }</tr>
<tr>이메일 : ${map.EMAIL }</tr>
<tr>주소 : ${map.ADDRESS }</tr>
<tr>
권한 : <c:choose>
	 <c:when test="${ '99' eq map.KIND}">
	 <td>관리자</td>
	 </c:when>
	 <c:when test="${ '0' eq map.KIND }" >
	 <td>개인회원</td>
	 </c:when>
	 <c:when test="${ '1' eq map.KIND }" >
	 <td>사업자 회원</td>
	</c:when>
	</c:choose>
	</tr>
<tr>이 회원 주문내역 상세보기</tr>
<tr>이 회원 판매내역 상세보기</tr>
<tr>
</table>
</body>
</html>
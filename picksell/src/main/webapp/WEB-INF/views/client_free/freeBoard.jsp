<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
무료나눔 게시판 

<table>
	<tr>
		<th style="text-align:center;">글번호</th>
		<th style="text-align:center;">제목</th>
		<th style="text-align:center;">기부자</th>
		<th style="text-align:center;">작성시간</th>
		<th style="text-align:center;">조회수</th>
	</tr>
</table>
	<c:forEach var="freeItemList" items="${mp}" varStatus="stat">
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_NUM}</td>
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_SUBJECT}</td>
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_WRITER}</td>
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_REGDATE}</td>
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_HITCOUNT}</td>
	</c:forEach>
	
<!--  등록된 상품이 없을때 -->
<c:if test="${empty mp}">
	<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
</c:if> 

<input type="button" value="글쓰기" onclick="javascript:location.href='free_board/writeForm'">

</body>
</html>
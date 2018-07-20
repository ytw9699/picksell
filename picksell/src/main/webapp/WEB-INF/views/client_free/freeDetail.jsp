<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/picksell/free_board/list">
    <input type="submit" value="목록보기" />
</form>
<!-- 수정 삭제는 기부자 이름과 세션아이딕 값이 같을 때 보인다.  -->

<c:if test="${map.FB_WRITER == sessionScope.sessionId}">
<form action="#">
    <input type="submit" value="수정하기" />
</form>
<form action="#">
    <input type="submit" value="삭제하기" />
</form><br/>
</c:if>
무료나눔 게시글 상세보기 <br/><br/><br/>
글 번호 : ${map.FB_NUM}<br/>
글 제목 : ${map.FB_SUBJECT}<br/>
작성자 : ${map.FB_WRITER}<br/>
작성 일시 :${map.FB_REGDATE} <br/>
내용 : ${map.FB_CONTENT}<br/>
조회수 : ${map.FB_HITCOUNT}<br/>
<br/>


</body>
</html>
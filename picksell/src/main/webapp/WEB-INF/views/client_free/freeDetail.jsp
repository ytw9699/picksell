<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
무료나눔 게시글 상세보기 <br/>
글 번호 : ${map.FB_NUM}<br/>
글 제목 : ${map.FB_SUBJECT}<br/>
작성자 : ${map.FB_WRITER}<br/>
작성 일시 :${map.FB_REGDATE} <br/>
내용 : ${map.FB_CONTENT}<br/>
조회수 : ${map.FB_HITCOUNT}<br/>
<br/>
</body>
</html>
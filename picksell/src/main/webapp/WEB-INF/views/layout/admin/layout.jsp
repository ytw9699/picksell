<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@font-face{font-family:'Cute'; src:url('/picksell/resources/admincss/font/THE_Oegyeinseolmyeongseo.ttf')}
body, table, div, p {font-family:'Cute';}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<tiles:insertAttribute name="menu" />
	<div style="float:left;padding:10px;width:20%"></div>
	<tiles:insertAttribute name="body" />
	
</body>
</html>
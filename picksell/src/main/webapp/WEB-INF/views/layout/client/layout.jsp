<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/picksell/resources/img/pavicon_ps.png" rel="icon" type="image/x-icon" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>PICKSELL</title>
<style>
body{margin:0;}
.headerWrap{width:100%;}
.bodyWrap {width: 80%;margin: 0 auto;/* display: inline-block; */}
.footerWrap {width: 80%;margin: 0 auto;}
</style>
</head>
<body>
	<div class="headerWrap">
		<tiles:insertAttribute name="header"/><!-- // header -->
	</div>
	<div class="bodyWrap">
		<tiles:insertAttribute name="body"/><!-- // container -->
	</div>
	<div class="footerWrap">
		<tiles:insertAttribute name="footer"/><!-- // footer -->
	</div>
</body>
</html>
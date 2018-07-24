<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/picksell/resources/img/pavicon_ps.png" rel="icon" type="image/x-icon" />
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>PICKSELL</title>
<style>
@font-face{font-family:'NotoSansBold'; src:url('/picksell/resources/clientcss/font/NotoSansCJKkr-Bold.otf')}
@font-face{font-family:'NotoSansLight'; src:url('/picksell/resources/clientcss/font/NotoSansCJKkr-DemiLight.otf')}
body, table, div, p {font-family:'NotoSansLight';}
body{margin:0;}
.headerWrap{width:100%;}
.bodyWrap {width: 80%;margin: 0 auto;/* display: inline-block; */}
.footerWrap {
    border-top: 2px solid #dbdbdb;
    width: 80%;
    margin: 0 auto;
    margin-top: 2%;
    margin-bottom: 2%;
    padding-top: 2%;
}
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
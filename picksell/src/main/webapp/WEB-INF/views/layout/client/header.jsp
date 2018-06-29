<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
ul{list-style: none;}
#mypage_menuBox{position:absolute; display:none;}
#menuBox-header{width:138px;}
#menuBox-body {width:200px; height:100px;border:1px solid black;background-color: white;}

.headerTop {height: 60px;}
span.headerTop_menu {
    float: right;
    /* margin: 30px; */
    margin-right: 15%;
}
.headerCenter {width: 80%;margin: 0 auto;}
.searchWrap {
    display: inline-block;
    border: 2px solid #7151fc;
    margin-left: 15%;
}
.mainLogoWrap {
    display: inline-block;
    float: left;
}
img.mainLogo {
    width: 180px;
    margin-top: 10px;
}
input.searchINPUT {
    border: none;
    padding: 10px;
    font-size: 17px;
}
.headerBottom {width: 100%;border-top: 1px solid #dbdbdb;border-bottom: 1px solid #dbdbdb;}
ul.bottomUL {
    width: 80%;
    margin: 0 auto;
    height: 60px;
    padding: 0;
}
li.headerCategory {
    float: left;
    height: 60px;
    line-height: 60px;
    padding-right: 30px;
}
.totalCategory {
    border-left: 1px solid #dbdbdb;
    border-right: 1px solid #dbdbdb;
    width: 130px;
    text-align: center;
}

</style>
</head>
<script>
	$(document).ready(function() {
		$('#linkOfMypage').mouseenter(function() {
			var height = $(this).height();
			var top = $(this).offset().top;
			//get the left and find the center value
			var left = $(this).offset().left + ($(this).width() / 2) - ($('#mypage_menuBox').width() / 2);
			$('#menuBox-header').height(height);
			$('#mypage_menuBox').show();
			$('#mypage_menuBox').css({'top':top, 'left':left});
		});
		$('#mypage_menuBox').mouseleave(function () {
				//$('#shareit-field').val('');
				$(this).hide();
		});
	});
</script>
<body>
<div class="headerTop">

	<span class="headerTop_menu">
		<a href="#" id="linkOfMypage">마이페이지▼</a>|<a href="#">로그아웃</a>|<a href="#">장바구니</a>
	</span>
</div>
<div class="headerCenter">
	<div class="mainLogoWrap">
		<a href="#">
		<img src="/picksell/resources/img/main_logo.png" class="mainLogo" />
		</a>
	</div>
	<div class="searchWrap">
		<input type="text" placeholder="상품명으로 검색해보세요" class="searchINPUT" />
		<input type="submit" value="돋보기모양" class="searchSUBMIT" />
	</div>
</div>
<div class="headerBottom">
	<ul class="bottomUL">
		<li class="headerCategory totalCategory"><a href="#">전체카테고리</a></li>
		<li class="headerCategory"><a href="#">픽셀 플러스</a></li>
		<li class="headerCategory"><a href="#">인기상품</a></li>
		<li class="headerCategory"><a href="#">일반상품</a></li>
		<li class="headerCategory"><a href="#">무료나눔</a></li>
	</ul>
</div>
<div id="mypage_menuBox">
	<div id="menuBox-header"></div>
	<div id="menuBox-body"></div>
</div>

<p>

</body>
</html>
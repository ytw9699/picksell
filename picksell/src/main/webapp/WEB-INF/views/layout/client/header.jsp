<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
ul{list-style: none;}
a:link { color: black; text-decoration: none;} 
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}
.headerTop_menu, .headerTop_menu a {color: #666;font-size: 13px;}

/* 마이페이지 메뉴 */

#mypage_menuBox {position: absolute;display: none;}
#menuBox-header {height: 32px;width: 20px;}
#menuBox-body {
    width: 120px;
    border: 1px solid #c2c2c2;
    background-color: white;
    padding: 13px;
    margin-left: 12px;
}
.menuBox-link {
    display: block;
    margin-bottom: 3px;
    color: #666;
    font-size: 13px;
}
.menuBox-link a:hover{
	text-decoration: underline;
}

/* 메인카테고리 메뉴 */
#maincategory_menuBox{position:absolute; display:none; z-index: 1;}
#maincategory-header{height: 32px;}
#maincategory-body {
    width: 190px;
    border: 1px solid #c2c2c2;
    background-color: white;
    /* padding: 13px; */
    /* margin-left: -1px; */
}

span.menuBox-link a {
    color: #666;
}
a.menu_el {
    margin: 0px 8px;
}
a.menu_el:hover {
	text-decoration: underline;
}

.headerTop {height: 60px;}
span.headerTop_menu {
    float: right;
    /* margin: 30px; */
    margin-right: 15%;
    margin-top: 8px;
}
.headerCenter {width: 80%;margin: 0 auto;}
.searchWrap {
    display: inline-block;
    border: 2px solid #7151fc;
    margin-left: 15%;
    width: 35%;
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
    font-size: 14px;
    width: 80%;
}
.headerBottom {
    width: 100%;
    margin-top: 40px;
    border-top: 1px solid #dbdbdb;
    border-bottom: 1px solid #dbdbdb;
}

ul.bottomUL {
    width: 80%;
    margin: 0 auto;
    height: 50px;
    padding: 0;
}
li.headerCategory {
    float: left;
    height: 50px;
    line-height: 50px;
    text-align: center;
    padding: 0 30px;
    font-size: 15px;
    color: #333333;
    cursor: pointer;
}
.totalCategory {
    border-left: 1px solid #dbdbdb;
    border-right: 1px solid #dbdbdb;
    width: 130px;
    text-align: center;
}
a.menuLink {
    display: block;
    width: 100%;
    height: 100%;
    
}
.menuCategory .active{
	color: #7151fc;
    border-bottom: 2px solid #7151fc;
}
a.menuLink:hover {
	color: #7151fc;
    border-bottom: 2px solid #7151fc;
}
a.sellLink{
	display: block;
    width: 100%;
    height: 100%;
    color: #7151fc;
}
span#myBasketSum {
    background-color: #7151fc;
    color: white;
    border-radius: 30px;
    width: 23px;
    height: 23px;
    line-height: 21px;
    display: inline-block;
    text-align: center;
}
.totalCategoryText {
    background: url(/picksell/resources/img/maincategory_nohover.png) 2% 53% no-repeat;
    width: 100%;
    height: 50px;
    display: block;
}

#maincategory-body {
    /* width: 128px; */
    border: 1px solid #c2c2c2;
    background-color: white;
    /* padding: 13px; */
    /* margin-left: -1px; */
}

ul.mainCategoryUL {
    width: 190px;
    margin: 0;
    padding: 0;
}

li.mainCategoryLI {
    color: #333;
    padding: 12px;
    cursor: pointer;
}

li.mainCategoryLI:hover {
    background-color: #7151fc;
    color: white;
}

.searchSUBMIT {
    background: url(/picksell/resources/img/main_searchcon.png) 50% 50% no-repeat;
    width: 35px;
    height: 35px;
    border: none;
    float: right;
    margin-right: 10px;
}
#myAlarm { 
    background-color: #e80935;
    color: white;
    border-radius: 30px;
    width: 23px;
    height: 23px;
    line-height: 21px;
    display: inline-block;
    text-align: center;
}

/* 알람박스 */
.bigsq {
    background-color: #999999;
    width: 50px;
    height: 10px;
    padding: 5px;
    margin-left: 80px;
    border-radius: 23px;
    transition: 0.3s;
    display: inline-block;
}
.smallsq {
    width: 30px;
    height: 30px;
    background-color: #efefef;
    display: inline-block;
    margin-top: -10px;
    margin-left: -15px;
    border-radius: 35px;
    transition: 0.3s;
    border: none;
    outline: none;
}
#myAlarm_listBox {position: absolute; display: none; }
#myAlarm-header {height: 32px;width: 20px;}
#myAlarm-body {
    width: 200px;
    border: 1px solid #c2c2c2;
    background-color: white;
    padding: 13px;
    margin-left: 12px;
}
span.alarm-setTEXT {
    float: left;
    font-size: 15px;
    color: #666;
}
.alarm-set {
    height: 40px;
    padding-top: 10px;
    border-bottom: 1px solid #dedede;
}
</style>
</head>
<script>
//알람을 위한 전역변수
var al_status = 0;
var al_status_initialization = '${sessionScope.sessionAlarm}';

//스위치 css무빙부분
function moving(){
	var allData = "currentAlarm=${sessionScope.sessionAlarm}";
	$.ajax({
		type: "GET",
		url: "/picksell/alarmChange",
		data: allData,
		dataType: 'json',
		success: function(data){
			//alert('알람테스트');
		}
	});	
	/* $.ajax({
		type : "POST",
		url : "/picksell/cart/countingMyBasket",
		dataType : 'json',
		//data : allData,
		success : function(data){
			//alert(data.currentCounting);
			document.getElementById('myBasketSum').innerHTML = data.currentCounting;
		}
	});		 */
	if(al_status == 0){
		$('#smallsq').css('margin-left',25);
		$('#smallsq').css('background-color', '#4285f4');
		$('#bigsq').css('background-color', '#b3cefb');
		al_status = 1;
	}else{
		$('#smallsq').css('margin-left', -15);
		$('#smallsq').css('background-color', '#efefef');
		$('#bigsq').css('background-color', '#999999');
		al_status = 0;
	}
}

	$(document).ready(function() {
		
		/* 전체카테고리hover 박스 */
		$('.totalCategory').click(function(){
			$(this).css({'background-color':'#7151fc','color':'white'});
			$('.totalCategoryText').css('background','url(/picksell/resources/img/maincategory_hover.png) 2% 53% no-repeat');
		
			var height = $(this).height();
			var top = $(this).offset().top;
			//get the left and find the center value
			var left = $(this).offset().left + ($(this).width() / 2) - ($('#maincategory_menuBox').width() / 2) + 31;
			$('#maincategory-header').height(height);
			$('#maincategory_menuBox').show();
			$('#maincategory_menuBox').css({'top':top, 'left':left});
		});
		$('#maincategory_menuBox').mouseleave(function (){
			$('.totalCategoryText').css('background','url(/picksell/resources/img/maincategory_nohover.png) 2% 53% no-repeat');
			$('.totalCategory').css({'background-color':'white','color':'#333'});
			$(this).hide();
		})
		
		/* 마이페이지hover 박스 */
		$('#linkOfMypage').mouseenter(function() {
			var height = $(this).height();
			var top = $(this).offset().top * 3;
			//get the left and find the center value
			var left = $(this).offset().left + ($(this).width() / 2) - ($('#mypage_menuBox').width() / 2);
			$('#menuBox-header').height(height - 10);
			$('#mypage_menuBox').show();
			$('#mypage_menuBox').css({'top':top, 'left':left});
		});
		$('#mypage_menuBox').mouseleave(function () {
				$(this).hide();
		});
		
		/* 알람hover 박스 */
		$('#linkOfAlarm').mouseenter(function() {
			var height = $(this).height();
			var top = $(this).offset().top * 3;
			//get the left and find the center value
			var left = $(this).offset().left + ($(this).width() / 2) - ($('#myAlarm_listBox').width() / 2);
			$('#myAlarm-header').height(height - 10);
			$('#myAlarm_listBox').show();
			$('#myAlarm_listBox').css({'top':top, 'left':left});
		});
		$('#myAlarm_listBox').mouseleave(function () {
				$(this).hide();
		});
		
		//var allData = "test1=1&test2=2";
		$.ajax({
			type : "POST",
			url : "/picksell/cart/countingMyBasket",
			dataType : 'json',
			//data : allData,
			success : function(data){
				//alert(data.currentCounting);
				document.getElementById('myBasketSum').innerHTML = data.currentCounting;
			}
		});	
		
		
		//알람스위치 초기화부분
		//var al_status = 0;
		//var al_status_initialization = '${sessionScope.sessionAlarm}';
		if(al_status_initialization == 'ON'){
			//alert('현재 알람상태는 on');
			$('#smallsq').css('margin-left',25);
			$('#smallsq').css('background-color', '#4285f4');
			$('#bigsq').css('background-color', '#b3cefb');
			al_status = 1;
		} 
	});
</script>
<body>


<div class="headerTop">
  <span class="headerTop_menu">
	<c:if test="${sessionId != null}">
	<a href="#" id="linkOfMypage" class="menu_el">마이페이지 ▼</a>|<a href="/picksell/logout" class="menu_el">로그아웃</a>
		
	</c:if>
	<c:if test="${sessionId == null}">
	|<a href="/picksell/loginForm" class="menu_el">로그인</a>
	</c:if> 
	|<a href="/picksell/cart" class="menu_el">장바구니</a>
	<span class="myBasketSum" id="myBasketSum">0</span>
	<c:if test="${sessionId != null}">
	|<a href="/picksell/mypage/alarmSelect" id="linkOfAlarm" class="menu_el">알림
	<span class="myAlarm" id="myAlarm">0</span></a>
	</c:if> 
	<c:if test="${sessionKind == '99'}">
	|<a href="/picksell/admin/main" class="menu_el">관리자</a>
	</c:if> 
   </span>

</div>
<div class="headerCenter">
	<div class="mainLogoWrap">
		<a href="/picksell/main">
		<img src="/picksell/resources/img/main_logo2.gif" class="mainLogo" />
		</a>
	</div>
	<div class="searchWrap">
		<form action="/picksell/mainSearchList" method="GET">
			<input type="text" name="searchKeyword" placeholder="상품명으로 검색해보세요" class="searchINPUT" />
			<input type="hidden" name="HowToSell" value="3"/>
			<input type="submit" value="" class="searchSUBMIT" />
		</form>
	</div>
</div>
<div class="headerBottom">
	<ul class="bottomUL">
		<li class="headerCategory totalCategory">
		
		<span class="totalCategoryText">전체카테고리</span>
		
		</li>
		<li class="headerCategory menuCategory"><a href="/picksell/products/plus" class="menuLink <c:if test="${forwardingListKind == '0' }">active</c:if>">픽셀 플러스</a></li>
		<li class="headerCategory menuCategory"><a href="/picksell/hotPlusProduct" class="menuLink <c:if test="${forwardingListKind == '1' }">active</c:if>">인기상품</a></li>
		<li class="headerCategory menuCategory"><a href="/picksell/products/goods" class="menuLink <c:if test="${forwardingListKind == '2' }">active</c:if>">일반상품</a></li>
		<li class="headerCategory menuCategory"><a href="#" class="menuLink">무료나눔</a></li>
		<li class="headerCategory menuCategory" style="float: right;"><a href="/picksell/sell/howto" class="sellLink">물건 판매하기</a></li>
	</ul>
</div>
<div id="mypage_menuBox">
	<div id="menuBox-header" class="menuheader"></div>
	<div id="menuBox-body">
		<span class="menuBox-link"><a href="/picksell/mypage/memberCheck">개인정보확인/수정</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/purchaseList/0">중고구매 신청리스트</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/sellList">판매글 조회</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/saleList">판매 내역/배송 조회</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/orderList">주문 내역/배송 조회</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/recentProduct">최근 본 상품</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/alarmSelect">알림 내용 및 설정</a></span>
	</div>
</div>

<div id="maincategory_menuBox">
	<div id="maincategory-header"></div>
	<div id="maincategory-body">
		<ul class="mainCategoryUL">
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=1'">전자제품</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=2'">패션/의류</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=3'">패션/잡화</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=4'">화장품/미용</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=5'">스포츠/레저</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=6'">유아동/출산</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=7'">완구/문구/취미</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=8'">도서/음반/DVD</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=9'">가구/인테리어</li>
			<li class="mainCategoryLI" onclick="location.href='/picksell/products?ca=10'">생활/건강</li>
		</ul>
	</div>
</div>

<div id="myAlarm_listBox">
	<div id="myAlarm-header"></div>
	<div id="myAlarm-body">
		<div class="alarm-set">
			<span class="alarm-setTEXT">알람설정</span>
			<div id="bigsq" class="bigsq">
			<input type="button" id="smallsq" class="smallsq" onclick="moving();" />
			</div>
		</div>
		알람상태 ${sessionScope.sessionAlarm }
	</div>
</div>

<p>
</body>

</html>
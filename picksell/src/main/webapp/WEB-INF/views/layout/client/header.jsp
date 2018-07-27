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

::-webkit-scrollbar{width: 15px;}
::-webkit-scrollbar-track {background-color: white;}
::-webkit-scrollbar-thumb {background-color: #baaaff;border-radius: 20px;}
::-webkit-scrollbar-thumb:hover {background: #977fff;}
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
    outline: none;
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
    margin-left: 20px;
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
#myAlarm_listBox {position: absolute; display: none; z-index: 1; }
#myAlarm-header {height: 32px;width: 20px;}
#myAlarm-body {
    width: 360px;
   	max-height: 190px;
    border: 1px solid #c2c2c2;
    background-color: white;
    padding: 13px;
    margin-left: 12px;
    overflow-y: scroll;
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
span.myAlarmTEXT {
    transition: 0.1s;
    display: block;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    margin-top: 5px;
}
span.myAlarmTEXT:hover{
color: #7151fc
}
span.myAlarmNoTEXT {
    text-align: center;
    display: block;
    margin-top: 10px;
    font-size: 15px;
    color: #333;
}
</style>
</head>
<script>
//알람 css를 위한 전역변수
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

//알람 읽고 처리부분
function alarmReadOfHead(ALARM_NUM, kind, var1, var2){
	var allData = "ALARM_NUM="+ALARM_NUM;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmRead",
				dataType : 'json',
				data : allData,
				success : function(data){
					if(kind == '0' || kind == '1' || kind == '2' || kind == '3' || kind == '4' || kind == '7' || kind == '8'){
						location.href='/picksell/products/detail/'+var1+'/'+var2;
					}
					if(kind == '4' || kind == '5' || kind == '6' || kind == '10' || kind == '11'){
						location.href='/picksell/mypage/orderDetail/'+var1;
					}
					if(kind == '12' || kind == '13' || kind == '14' || kind == '15' || kind == '16' || kind == '17' || kind == '18'){
						//location.href='/picksell/mypage/orderDetail/'+var1;
						location.reload();
					}
						//alert('주문상세보기');
						
				}
			});	
}


	$(document).ready(function() {
		
		var sessions = '${sessionScope.sessionId}';
		
		/* if(sessions == '')
			alert('no'); */
		
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
		if(al_status_initialization == 'ON'){
			//alert('현재 알람상태는 on');
			$('#smallsq').css('margin-left',25);
			$('#smallsq').css('background-color', '#4285f4');
			$('#bigsq').css('background-color', '#b3cefb');
			al_status = 1;
		} 
		
		//알람리스트
		if(sessions != ''){
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/headerAlarmList",
				dataType : 'json',
				success : function(data){
					
					var htmlstr = '';
					
					if(data.length > 0){
						$.each(data, function(key, value){
							
							if(value.ALARM_KIND == 0)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 님이 상품문의 답글을 작성했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 1)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 님이 상품문의를 작성했습니다 -"+value.ALARM_REGDATE+"</span>";
							//kind2 > 나의글에 구매신청한경우
							if(value.ALARM_KIND == 2)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 님께서 구매신청을 수락했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 3)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 님께서 구매신청을 하셨습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 4)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_VARIABLE2+" 주문에 대한 배송이 시작되었습니다 -"+value.ALARM_REGDATE+"</span>";
							//if(value.ALARM_KIND == 5)
								//htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_VARIABLE2+" 주문에 대한 배송이 시작되었습니다</span>";
							if(value.ALARM_KIND == 6)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 님께서 인수확인 하셨습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 7)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 님께서 구매신청을 취소했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 8)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 판매자가 구매수락을 취소했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 9)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 구매자가 주문신청을 했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 10)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_VARIABLE2+" 주문을 취소했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 11)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_VARIABLE2+" 주문을 취소했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 12)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_WRITER+" 구매자가 입금을 완료했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 13)
								htmlstr += "<span class='myAlarmTEXT' onclick='alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+","+value.ALARM_VARIABLE1+","+value.ALARM_VARIABLE2+")'>"+value.ALARM_VARIABLE2+" 사유로 게시글이 블라인드처리되었습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 14)
								htmlstr += "<span class='myAlarmTEXT' onclick=alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+",'"+value.ALARM_VARIABLE1+"','"+value.ALARM_VARIABLE2+"')>관리자가 회원님의 계정상태를 변경했습니다 -"+value.ALARM_REGDATE+"</span>";	
							if(value.ALARM_KIND == 15)
								htmlstr += "<span class='myAlarmTEXT' onclick=alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+",'"+value.ALARM_VARIABLE1+"','"+value.ALARM_VARIABLE2+"')>관리자가 입금확인처리 했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 16)
								htmlstr += "<span class='myAlarmTEXT' onclick=alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+",'"+value.ALARM_VARIABLE1+"','"+value.ALARM_VARIABLE2+"')>관리자가 인수확인처리 했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 17)
								htmlstr += "<span class='myAlarmTEXT' onclick=alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+",'"+value.ALARM_VARIABLE1+"','"+value.ALARM_VARIABLE2+"')>관리자가 배송을 시작했습니다 -"+value.ALARM_REGDATE+"</span>";
							if(value.ALARM_KIND == 18)
								htmlstr += "<span class='myAlarmTEXT' onclick=alarmReadOfHead("+value.ALARM_NUM+","+value.ALARM_KIND+",'"+value.ALARM_VARIABLE1+"','"+value.ALARM_VARIABLE2+"')>무료나눔게시판의 댓글이 작성되었습니다 -"+value.ALARM_REGDATE+"</span>";
						});
						$('.alarm-list').html(htmlstr);
					}
					if(data.length == 0){
						$('.alarm-list').html("<span class='myAlarmNoTEXT'>새로운 알람이 없습니다</span>");
					}
				} // success f end
			});// ajax end
		}// alarm if end
		
		if(sessions != ''){
			$.ajax({
				type : "POST",
				url : "/picksell/mypage/alarmCount",
				dataType : 'json',
				//data : allData,
				success : function(data){
					//alert(data.alarmSum);
					var isONOFF = '${sessionScope.sessionAlarm}';
					if(isONOFF == 'ON'){
						document.getElementById('myAlarm').innerHTML = data.alarmSum;
					}else if(isONOFF == 'OFF'){
						document.getElementById('myAlarm').innerHTML = "0";
					}
				}
			});	
		}// alarm count end
		
	}); //on ready end
	
	
	
	
	
</script>
<body>


<div class="headerTop">
  <span class="headerTop_menu">
  	<c:if test="${sessionId != null}">
  	${sessionId} |
  	</c:if>
	<c:if test="${sessionId != null}">
	<a href="#" id="linkOfMypage" class="menu_el">마이페이지 ▼</a>|<a href="/picksell/logout" class="menu_el">로그아웃</a>
		
	</c:if>
	<c:if test="${sessionId == null}">
	|<a href="/picksell/loginForm" class="menu_el">로그인</a>
	</c:if> 
	|<a href="/picksell/cart" class="menu_el">장바구니</a>
	<span class="myBasketSum" id="myBasketSum"></span>
	<c:if test="${sessionId != null}">
	|<a href="/picksell/mypage/alarmSelect" id="linkOfAlarm" class="menu_el">알림</a>
	<span class="myAlarm" id="myAlarm"></span>
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
			<input type="hidden" name="order" value="0"/>
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
		<li class="headerCategory menuCategory"><a href="/picksell/free_board/list" class="menuLink">무료나눔</a></li>
		<li class="headerCategory menuCategory" style="float: right;"><a href="/picksell/sell/howto" class="sellLink">물건 판매하기</a></li>
	</ul>
</div>
<div id="mypage_menuBox">
	<div id="menuBox-header" class="menuheader"></div>
	<div id="menuBox-body">
		<span class="menuBox-link"><a href="/picksell/mypage/memberCheck">회원정보 확인/수정</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/orderList">주문 내역/배송 조회</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/saleList">판매 내역/배송 조회</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/sellList?HowToSell=3&deal_status=3">판매글 조회</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/purchaseList">중고구매 요청 리스트</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/secondSellList">중고판매 요청 리스트</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/recentProduct">최근 본 상품</a></span>
		<span class="menuBox-link"><a href="/picksell/mypage/alarmSelect">알림 조회</a></span>
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
		<div class="alarm-list">
			
		</div>
	</div>
</div>
</body>

</html>
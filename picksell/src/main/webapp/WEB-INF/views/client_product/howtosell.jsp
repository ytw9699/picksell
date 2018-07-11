<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.howtoTopWrap {
    text-align: center;
    margin-top: 50px;
}

span.howtoText1 {
    font-weight: 600;
    display: block;
    font-size: 33px;
}

span.howtoText2 {
    display: block;
    margin-top: 15px;
    color: #666666;
}
.howtoTopWrap {
    text-align: center;
    margin-top: 50px;
}
.howtoselectWrap {
    display: inline-block;
    width: 33%;
}
.selectImgWrap {
    width: 27%;
    margin: 0 auto;
}
img.selectImg {
    width: 100%;
}
.howtoCenterWrap {
    margin-top: 60px;
    margin-bottom: 100px;
    background: url(/picksell/resources/img/howtosellback.png) 50% 29% no-repeat;
}
span.howtoTEXT {
    display: block;
    text-align: center;
    color: #7151fc;
    font-weight: 600;
    margin-top: 30px;
    font-size: 22px;
}
span.howtosubTEXT {
    display: block;
    text-align: center;
    color: #999999;
    font-size: 13px;
    margin-top: 8px;
}
input.sellBtn {
    width: 100px;
    padding: 15px;
    font-size: 15px;
    color: white;
    background-color: #7151fc;
    display: block;
    text-align: center;
    margin: 0 auto;
    margin-top: 50px;
    border: none;
}
input.sellBtn.disableBtn {
    background-color: #b3b1b1;
}
</style>
</head>
<body>
	<div class="howtoTopWrap">
		<span class="howtoText1">
		먼저, 판매 방법을 선택하세요.
		</span>
		<span class="howtoText2">
		픽셀의 모든 거래는 안전거래입니다!
		</span>
	</div>
	<div class="howtoCenterWrap">
		<div class="howtoselectWrap">
			<div class="selectImgWrap">
				<img src="/picksell/resources/img/howtosell1.png" class="selectImg" />
			</div>
			<span class="howtoTEXT">일반 안전거래</span>
			<span class="howtosubTEXT">안전거래만 가능합니다</span>
			
			<input type="button" value="판매하기" class="sellBtn <c:if test="${sessionScope.sessionKind == 1 }">disableBtn</c:if>" onclick="location.href='/picksell/sell/0'" <c:if test="${sessionScope.sessionKind == 1 }">disabled="disabled"</c:if> />
		</div>
		<div class="howtoselectWrap">
			<div class="selectImgWrap">
				<img src="/picksell/resources/img/howtosell2.png" class="selectImg" />
			</div>
			<span class="howtoTEXT">일반+쿨거래</span>
			<span class="howtosubTEXT">안전거래와 직거래가 가능합니다</span>
			
			<input type="button" value="판매하기" class="sellBtn <c:if test="${sessionScope.sessionKind == 1 }">disableBtn</c:if>" onclick="location.href='/picksell/sell/1'" <c:if test="${sessionScope.sessionKind == 1 }">disabled="disabled"</c:if> />
		</div>
		<div class="howtoselectWrap">
			<div class="selectImgWrap">
				<img src="/picksell/resources/img/howtosell3.png" class="selectImg" />
			</div>
			<span class="howtoTEXT">사업자 안전거래</span>
			<span class="howtosubTEXT">사업자를 위한 안전거래입니다</span>
			
			<input type="button" value="판매하기" class="sellBtn <c:if test="${sessionScope.sessionKind != 1 }">disableBtn</c:if>" onclick="location.href='/picksell/sellPlus'" <c:if test="${sessionScope.sessionKind != 1 }">disabled="disabled"</c:if> />
		</div>
	</div>
</body>
</html>
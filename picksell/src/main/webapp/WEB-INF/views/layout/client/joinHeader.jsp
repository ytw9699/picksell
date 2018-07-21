<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.reg-navb-signin {
    display: inline-block;
    color: #999999;
    font-size: 12px;
    line-height: 14px;
    padding-top: 3px;
}
.reg-navb-signin-highligted {
    display: inline-block;
    color: #7151FC;
    font-size: 14px;
    line-height: 16px;
    padding: 2px 20px 0 5px;
}
.reg-navb {
    border-bottom: 1px solid #c2c2c2;
    height: 17px;
    padding: 20px 30px;
}
.reg-navb-logo {
	width: 80%;
	margin: 0 auto;
    display: inline-block;
    float: left;
}
.reg-navb-logo img {
    width: 92px;
    height: 21px;
}
.reg-navb-right {
    float: right;
    line-height: 16px;
}
a {
    cursor: pointer;
    color: inherit;
    text-decoration: none;
    background: transparent;
}
</style>
</head>
<body>
<div class="reg-navb">
<a class="reg-navb-logo" href="/picksell/main">
<img src="/picksell/resources/img/main_logo2.gif">
</a>
<div class="reg-navb-right">
<a href="/picksell/loginForm">
<div class="reg-navb-signin">이미 회원이신가요?</div>
<div class="reg-navb-signin-highligted">로그인하기</div>
</a>
</div>
</div>
</body>
</html>
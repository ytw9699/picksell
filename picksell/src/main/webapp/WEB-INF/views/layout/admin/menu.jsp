<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

.sidenav {
    height: 100%;
    width: 200px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    padding-top: 20px;
}

.sidenav a {
    padding: 10px 8px 1px 16px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    margin-top: 0px;
}

.sidenav a:hover {
    color: #f1f1f1;
    text-decoration: underline;
}
#logoInput {
   padding-left: 7px;
   padding-bottom : 20px;
   border-bottom : 1.5px solid #770000;
   height: 43px;
}



</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="sidenav">
 
  <div id="logoInput">
  <a href="/picksell/main/"><img src="/picksell/resources/img/main_logo.png" width="150px" height="25px"></a>
  </div>
 
  <a href="/picksell/admin/main">메인메뉴</a>
  <a href="/picksell/admin/member/list">계정관리</a>
  <a href="/picksell/admin_products/list">판매관리</a>
  <a href="/picksell/admin_order/list">주문관리</a>
  <a href="/picksell/admin_singo/list">신고관리</a>
</div>
</body>
</html>
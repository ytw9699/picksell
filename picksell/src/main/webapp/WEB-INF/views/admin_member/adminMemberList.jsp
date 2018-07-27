<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.main{
	 margin-left: 200px; 
}
.reverse{
	background: Red;
	color : White;
}
.searchBar{
	width : 400px;
	height: 50px;
	border-style: solid;
	border-color : #7151fc;
	padding-top: 10px;
    padding-left: 50px;
    margin-top : 10px;
}
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}

table.adminMemeberList{
 border-collaspe : separate;
 boarder-spacing : 1px;
 text-align: center;
 line-height : 1.5;
 margin: 10px 5px;

}
table.adminMemeberList th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #337ab7;
   
}
table.adminMemeberList td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #fff;
}
button{
  background: #337ab7;
  color:#fff;
  border:none;
  position:relative;
  height:22px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#337ab7;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #337ab7;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
<head>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script>
   $(document).ready(function(){
	   $('button').bind({
		  mouseenter : function() {$(this).addClass('reverse');},
		  mouseleave : function() {$(this).removeClass('reverse');} 
	   });
   	});
  
</script>
<link rel="stylesheet" type="text/css" href="/admincss/admin.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member계정</title>
</head>
<body>
<!-- 
	세션 아이디 , 권한 확인 부분
 -->

<div class="main">

<div class="searchBar">
<form action="/picksell/admin/member/search" method="POST">
<select name="searchNum">
		<option value="0">이름</option>
		<option value="1">ID</option>	
</select>
<input type="text" name="isSearch" id="memberSearch" placeholder="회원검색" />
<button type="submit">Search</button>
</form>
</div>
<h1 style="margin-left:8px;min-width: 1024px;">회원 목록</h1>
<c:choose>
<c:when test="${ 0 lt searchCount }">
<h3 style="maring-left:8px;min-width: 1024px;">검색 결과는 ${searchCount }건 입니다.</h3>
</c:when>
<c:when test="${ 0 lt a }">
<h3 style="margin-left:8px;min-width: 1024px;">전체 회원 수는 <font size="5px" color="red">${a}</font>명 입니다.</h3>
</c:when>
</c:choose>
<table  class="adminMemeberList">
   <thead>
 	<tr>
 		<th scope="cols">번호</th>
 		<th scope="cols">ID</th>
 		<th scope="cols">이름</th>
 		<th scope="cols">프로필이미지</th>
 		<th scope="cols">이메일</th>
 		<th scope="cols">권한</th>
 	</tr>
</thead>
<tbody>

<c:forEach var="memberslist" items="${memberslist}" varStatus="i" >
    <tr>  
     <td>${startNumber + i.index}</td>
   	 <td><a href="/picksell/admin/member/info/${memberslist.id}">${memberslist.id}</a></td>
	 <td>${memberslist.name }</td>
	 <c:choose>
	 <c:when test="${memberslist.profile_img != '' || memberslist.profile_img ne null }">
	 <td><img src="/picksell/resources/profileImgUpload/${memberslist.profile_img }" style="width:32px; height:30px;"/></td>
	 </c:when>
	 <c:when test="${memberslist.profile_img eq null }">
	  <td><img src="/picksell/resources/img/katalkprofile.png" style="width:32px; height:30px;"/></td>
	 </c:when>
	 </c:choose>
	 <td>${memberslist.email }</td>
     <c:choose>
	 <c:when test="${ '99' eq memberslist.kind }">
	 <td><img src="/picksell/resources/img/admin.png" style="width: 25px; height :25px;" /></td>
	 </c:when>
	 <c:when test="${ '0' eq memberslist.kind }" >
	 <td><img src="/picksell/resources/img/personal.png" style="width: 25px; height :25px;" /></td>
	 </c:when>
	 <c:when test="${ '1' eq memberslist.kind }" >
	 <td> <img src="/picksell/resources/img/business-icon.png" style="width: 25px; height :25px;" /></td>
	</c:when>
	</c:choose>
	
	</tr>

</c:forEach>

</tbody>
</table>
<div class="paging">
		${pagingHtml}
</div>

<button onclick="window.location='/picksell/admin/member/list'">목록</button>
</div>
</body>
</html>
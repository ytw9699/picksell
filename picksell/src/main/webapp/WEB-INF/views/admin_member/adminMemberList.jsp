<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.main{
	 margin-left: 160px; 
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
<form action="/picksell/admin/member/search" >
<select name="searchNum">
		<option value="0">이름</option>
		<option value="1">ID</option>	
</select>
<input type="text" name="isSearch" id="memberSearch" placeholder="회원검색" />
<button type="submit">Search</button>
</form>
</div>

<h1>회원목록</h1>
<c:choose>
<c:when test="${ 0 lt searchCount }">
검색 결과는 ${searchCount }건 입니다.
</c:when>
<c:when test="${ 0 lt a }">
전체 회원 수는 ${a}명 입니다.
</c:when>
</c:choose>
<table align="center" border="1px">
   <thead>
 	<tr>
 		<th>번호</th>
 		<th>id</th>
 		<th>이름</th>
 		<th>프로필이미지</th>
 		<th>이메일</th>
 		<th>권한</th>
 	</tr>
</thead>
<tbody>

<c:forEach var="memberslist" items="${memberslist}" varStatus="i" >
    <tr>  
     <td>${startNumber + i.index}</td>
   	 <td><a href="/picksell/admin/member/info/${memberslist.id}">${memberslist.id}</a></td>
	 <td>${memberslist.name }</td>
	 <td>${memberslist.profile_img }</td>
	 <td>${memberslist.email }</td>
     <c:choose>
	 <c:when test="${ '99' eq memberslist.kind }">
	 <td>관리자</td>
	 </c:when>
	 <c:when test="${ '0' eq memberslist.kind }" >
	 <td>개인회원</td>
	 </c:when>
	 <c:when test="${ '1' eq memberslist.kind }" >
	 <td>사업자 회원</td>
	</c:when>
	</c:choose>
	
	</tr>

</c:forEach>

</tbody>
</table>
<div class="paging">
		${pagingHtml}
</div>
<input type="submit" value="전체 목록" onclick="window.location='/picksell/admin/member/list'"/>

</div>
</body>
</html>
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
<input type="text" name="memberSearch" id="memberSearch" placeholder="회원검색" />
<button type="submit">Search</button>
</form>
</div>

<h1>회원목록</h1>
<c:choose>
<c:when test="${0 lt searchCount  }">
총 검색 결과는 ${searchCount }건 입니다.
</c:when>
<c:when test="${0 lt memberCount }">
총 회원 수는 ${memberCount }명 입니다.
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

<c:forEach var="memberslist" items="${memberslist}">
     
    <tr>
     
   	 <td class="indexx">번호</td>
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
<input type="submit" value="전체 목록" onclick="window.location='/picksell/admin/member/list'"/>
</div>
</body>
</html>
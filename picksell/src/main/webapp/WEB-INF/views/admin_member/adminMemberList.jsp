<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member계정</title>
</head>
<body>
<form action="/picksell/admin/member/search">
<select name="searchNum">
		<option value="0">이름</option>
		<option value="1">ID</option>	
</select>
<input type="text" name="memberSearch" id="memberSearch" placeholder="회원검색" />
<button type="submit">Search</button>
</form>
<h1>회원목록</h1>
<table border="1px">
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

<c:forEach var="memberslist" items="${memberslist}" >
   
    <tr>
     <td>번호</td>
     <td>${memberslist.id}</td>
 	 <td>${memberslist.name }</td>
	 <td>${memberslist.profile_img }</td>
	 <td>${memberslist.email }</td>
	 <td>${memberslist.kind }</td>
	</tr>
	
</c:forEach>
</tbody>
</table>
</body>
</html>
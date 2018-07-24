<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

	table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}

	th, td {
    text-align: left;
    padding: 8px;
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

.button {
    background-color: #7151fc;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    margin-left : 1000px;
}

p{
	color : #7151fc;
}

</style>
</head>
<body>
<p>무료나눔 게시판 </p>

<table>
	<thead>
	<tr>
		<th style="text-align:center;" width="10%;">글번호</th>
		<th style="text-align:center;" width="50%;">제목</th>
		<th style="text-align:center;" width="10%;">기부자</th>
		<th style="text-align:center;" width="20%;">작성시간</th>
		<th style="text-align:center;" width="10%;">조회수</th>
	</tr>
	</thead>
	
	<c:forEach var="freeItemList" items="${mp}" varStatus="stat">
	<tr>
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_NUM}</td>
		<td style="text-align:center;vertical-align:middle;"><a href="/picksell/free_board/detail/${freeItemList.FB_NUM}">${freeItemList.FB_SUBJECT}</a></td>
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_WRITER}</td>
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_REGDATE}</td>
		<td style="text-align:center;vertical-align:middle;">${freeItemList.FB_HITCOUNT}</td> 
	</tr>
	</c:forEach>
</table>	
<!--  등록된 상품이 없을때 -->
<c:if test="${empty mp}">
	<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
</c:if> 
<br/>
<c:if test="${sessionScope.sessionStatus eq 0}">
<input type="button" class="button" value="글쓰기" onclick="javascript:location.href='writeForm'">
</c:if>

<br/>
<div class="paging">
		${pagingHtml}
</div>

<div class="row">
		<div style="text-align:center;">
			<div id="dataTables-example_filter" class="dataTables_filter">
				<form action=""> 
					<select class="form-control" name="searchNum" id="searchNum">
						<option value="0">제목</option>
						<option value="1">제목+내용</option>
						<option value="2">기부자</option>
					</select>
					<input class="form-control" type="text" name="isSearch" id="isSearch"/>
					<span>
						<button type="submit" class="btn btn-default">검색</button>
					</span>
				</form>
			</div>							
		</div>				
	</div>

</body>
</html>










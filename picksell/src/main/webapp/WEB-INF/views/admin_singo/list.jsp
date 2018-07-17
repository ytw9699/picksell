<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고 리스트</title>
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

tr:nth-child(even){background-color: #f2f2f2}

.main{ 
 	 margin-left: 200px;  
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
</head>
<body>
<div class="main">
<div style="overflow-x:auto;">
<table>
	<thead>
		<tr role="row">
			<th style="text-align:center;">신고번호</th>
			<th style="text-align:center;">판매글 번호</th>
			<th style="text-align:center;">피신고자</th>
			<th style="text-align:center;">신고자</th>										
			<th style="text-align:center;">신고일자</th>
			<th style="text-align:center;">신고내용</th>
			<th style="text-align:center;">게시글상태</th> <!-- board_status -->
		</tr>
	</thead>
	
	<div class="singoList">
 		<c:forEach var="singoList" items="${singoList2}" varStatus="stat">
 			<tr class="orderListContents" role="row">
 				<td style="text-align:center;vertical-align:middle;">${singoList2.singo_num}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.product_num}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.singoee}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.singo_writer}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.singo_regdate}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.singo_content}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.board_status}</td>
 				<br/>
 			</tr>
 		</c:forEach>
 	</div>
	
</table>
</div>

	<!--  등록된 상품이 없을때 -->
	<c:if test="${empty singoList2}">
		<tr><td colspan="9" style="text-align:center;">등록된 신고가 없습니다</td></tr>
	</c:if> 
	
	<div class="paging">
		${pagingHtml}
	</div>
	
	
	<div class="row">
		<div style="text-align:center;">
			<div id="dataTables-example_filter" class="dataTables_filter">
				<form action=""> 
					<select class="form-control" name="searchNum" id="searchNum">
						<option value="0">피신고자</option>
						<option value="1">신고자</option>
						<option value="2">신고내용</option>
					</select>
					<input class="form-control" type="text" name="isSearch" id="isSearch"/>
					<span>
						<button type="submit" class="btn btn-default">검색</button>
					</span>
				</form>
			</div>							
		</div>				
	</div>
</div>	
</body>
</html>
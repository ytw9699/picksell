<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

.main{
   margin-left: 200px; /* Same as the width of the sidenav */

}

table.adminProductList{
 border-collaspe : separate;
 boarder-spacing : 1px;
 text-align: center;
 line-height : 1.5;
 margin: 10px 5px;

}
table.adminProductList th {
    width: 200px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #337ab7;
   
}
table.adminProductList td {
    width: 200px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #fff;
}
input[type=submit]{

      
		text-align: center;	
		background: #d3d3d3;
		transition:all 0.8s;
	
}
input[type=submit]:hover {
  
  box-shadow:inset 0px 0px 0 100px rgba(0,0,0,0.5);
  color:#fff;		
    
}

</style>
<head>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script>
setInterval(function(){
	  $(".blind").toggle();
	}, 250);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 중 리스트</title>
</head>
<body>
<h1 style="margin-left: 208px;">현재 판매 중인 상품 글 리스트</h1>
<div class="main">
<c:choose>
	<c:when test="${ 0 eq total }">
	 판매 중인 상품이 없습니다.
	 
	</c:when>
	<c:when test="${0 lt total }">

<table class="adminProductList"  style="text-align:center">
 	<tr>
 	 	<th>번호</th>
 	    <th>상품 번호</th>
 		<th>판매자 ID</th>
 		<th>판매 상태</th>
 		<th>글 제목</th>
 		<th>조회수</th>
 		<th>상품 수</th>
 		<th>상품 가격</th>
 		<th>게시글 상태</th>
 		<th>상품 등록 날짜</th>
 	</tr>
 
 	<c:forEach var="maplist" items="${maplist }" varStatus="i">
 	<tr>
 	 <td>${i.count }</td>
 	 <td>${maplist.PRODUCT_NUM}</td>
 	 <td>${maplist.SELLER_ID }</td>
 	 <td>판매중</td>
 	 <c:choose>
 	 <c:when test="${fn:length(maplist.SUBJECT) gt 3}">
 	 <td>
 	 <a href="/picksell/products/detail/${maplist.CATEGORY_NUM }/${maplist.PRODUCT_NUM}">${fn:substring(maplist.SUBJECT,0,3)}...</a></td>
 	 </c:when>
 	 <c:when test="${fn:length(maplist.SUBJECT) le 3}">
 	 <td><a href="/picksell/products/detail/${maplist.CATEGORY_NUM }/${maplist.PRODUCT_NUM}">${maplist.SUBJECT }</a></td>
 	 </c:when>
 	 </c:choose>
 	 <td>${maplist.HITCOUNT }</td>
 	 <td>${maplist.STOCK }</td>
 	 <td>${maplist.PRICE }</td>
 	 <td>
 	 <c:choose>
 	 <c:when test="${ '0'  eq maplist.BOARD_STATUS}">
 	 <a style="font-color:black;">정 상</a>
 	 <br>
 	 <input type="submit"  value="블라인드" onclick="location.href='/picksell/admin/member/productBlindProc?id=${maplist.SELLER_ID}&product_num=${maplist.PRODUCT_NUM }&status=1'" />
 	 </c:when>
 	 <c:when test="${ '1' eq maplist.BOARD_STATUS }">
 	 <span class="blind"><font color="red">블라인드</font></span>
 	 <br> 
 	 <input type="submit" value="정상처리" onclick="location.href='/picksell/admin/member/productBlindProc?id=${maplist.SELLER_ID}&product_num=${maplist.PRODUCT_NUM }&status=0'" />
 	 </c:when>
 	 </c:choose></td>
 	 <td><fmt:formatDate  value="${maplist.PRODUCT_REGDATE }" pattern="yyyy-MM-dd" /></td>
 	</tr>
 	</c:forEach>	
</table>
</c:when>
</c:choose>
</div>
</body>
</html>
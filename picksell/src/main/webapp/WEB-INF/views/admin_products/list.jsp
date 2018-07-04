<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매제품 리스트</title>
<style type="text/css">

.main{
	 margin-left: 160px; 
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
<table>
	<thead>
		<tr role="row">
			<th style="width: 7%; text-align:center;">번호</th>
			<th style="width: 7%; text-align:center;">카테고리번호</th>
			<th style="width: 7%; text-align:center;">판매자</th>
			<th style="width: 7%; text-align:center;">판매방법</th>										
			<th style="width: 7%; text-align:center;">조회수</th>
			<th style="width: 7%; text-align:center;">재고</th>
			<th style="width: 7%; text-align:center;">등록일자</th>
			<th style="width: 7%; text-align:center;">거래상태</th>
			<th style="width: 7%; text-align:center;">게시글상태</th>
			<th style="width: 9%; text-align:center;">내용</th>
			<th style="width: 7%; text-align:center;">이미지</th>
			<th style="width: 7%; text-align:center;">제목</th>
			<th style="width: 7%; text-align:center;">제품상태</th>
			<th style="width: 7%; text-align:center;">가격</th>
		</tr>
	</thead>
	
	<div class="productsList">
 		<c:forEach var="productsList" items="${productsList}" varStatus="stat">
 			<tr class="orderListContents" role="row">
 				<td style="text-align:center;vertical-align:middle;">${productsList.product_num}</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.category_num}</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.seller_id}</td>
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${productsList.howtosell eq 0}">
					일반안전거래
					</c:if>
					<c:if test="${productsList.howtosell eq 1}">
					일반 or 쿨거래
					</c:if>
					<c:if test="${productsList.howtosell eq 2}">
					사업자 안전거래 
					</c:if></td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.hitcount}</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.stock}</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.product_regdate}</td>
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${productsList.deal_status eq 0}">
					판매중
					</c:if>
					<c:if test="${productsList.deal_status eq 1}">
					거래중
					</c:if>
					<c:if test="${productsList.deal_status eq 2}">
					판매완료
					</c:if>
 					</td>
 					<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${productsList.board_status eq 0}">
					정상
					</c:if>
					<c:if test="${productsList.board_status eq 1}">
					블라인드
					</c:if>
 					</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.content}</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.first_img}</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.subject}</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.product_status}</td>
 				<td style="text-align:center;vertical-align:middle;">${productsList.price}</td>
 				<br/>
 			</tr>
 		</c:forEach>
 	</div>
	
</table>

	<!--  등록된 상품이 없을때 -->
	<c:if test="${fn:length(productsList) le 0}">
		<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
	</c:if> 
	
	<div class="paging">
		${pagingHtml}
	</div>
	
	
	<div class="row">
		<div style="text-align:center;">
			<div id="dataTables-example_filter" class="dataTables_filter">
				<form action=""> 
					<select class="form-control" name="searchNum" id="searchNum">
						<option value="0">판매자</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
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
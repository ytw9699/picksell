<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고 리스트</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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

.button {
    background-color: #7151fc;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

.button9 {
    background-color: #CEB6FE;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

</style>

<script>

function alarmInsert(ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND){
	var allData = "ALARM_TARGET="+ALARM_TARGET+"&ALARM_VARIABLE1="+ALARM_VARIABLE1+"&ALARM_VARIABLE2="+ALARM_VARIABLE2+"&ALARM_WRITER="+ALARM_WRITER+"&ALARM_KIND="+ALARM_KIND;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmInsert",
				dataType : 'json',
				data : allData,
				success : function(data){
				}
			});	
	}
	function doBlind(product_num,singoee,subject){
		
		var k = confirm("블라인드 처리 하시겠습니까?");
		
		if(k==true){
			
		  var str = '';
		  var content;
		  content = prompt('블라인드 사유를 입력해주세요' , str);
		
		  alarmInsert(singoee, subject, content, 'admin','13');
		  
		  alert('블라인드 처리되었습니다');
			
		window.location.href="http://localhost:8080/picksell/admin_singo/doBlind?product_num="+product_num;
		}else if(k==false){ 
			window.location.href="http://localhost:8080/picksell/admin_singo/list";
		}
		
	}
</script>
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
			<th style="text-align:center;">게시글상태</th> 
			<th style="text-align:center;">블라인드처리</th> <!-- board_status -->
		</tr>
	</thead>
	
	<div class="singoList">
 		<c:forEach var="singoList2" items="${singoList2}" varStatus="stat">
 			<tr class="orderListContents" role="row">
 				<td style="text-align:center;vertical-align:middle;">${singoList2.SINGO_NUM}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.PRODUCT_NUM}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.SINGOEE}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.SINGO_WRITER}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.SINGO_REGDATE}</td>
 				<td style="text-align:center;vertical-align:middle;">${singoList2.SINGO_CONTENT}</td>
 				<td style="text-align:center;vertical-align:middle;">
 				
 					<c:if test ="${singoList2.BOARD_STATUS eq 0}">정상</c:if>
 					<c:if test ="${singoList2.BOARD_STATUS eq 1}">블라인드</c:if>
 				</td>
<%--  				<input type="hidden" id="product_num" value="${singoList2.BOARD_STATUS}"/> --%>
 				<td style="text-align:center;vertical-align:middle;">
 				<c:if test ="${singoList2.BOARD_STATUS eq 0}">
<button class="button" onclick="doBlind('${singoList2.PRODUCT_NUM}','${singoList2.SINGOEE}','${singoList2.SUBJECT}')">블라인드 처리</button>
 				</c:if>
 				<c:if test ="${singoList2.BOARD_STATUS eq 1}">
 					<button class="button9">블라인드 처리</button>
 				</c:if>
 				</td>
 				
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
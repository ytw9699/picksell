<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오더 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
.button1 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
}

.button1:hover {
    background-color: #008CBA;
    color: white;
}

.fa-check {
    color: green;
}

.fa-remove {
    color: red;
}

.main {
    margin-left: 74px;
    margin-top: 96px;
    width: 103%;
}

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
<script>
/* 알람부분 by태원 */
function alarmInsert(ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND){
	var allData = "ALARM_TARGET="+ALARM_TARGET+"&ALARM_VARIABLE1="+ALARM_VARIABLE1+"&ALARM_VARIABLE2="+ALARM_VARIABLE2+"&ALARM_WRITER="+ALARM_WRITER+"&ALARM_KIND="+ALARM_KIND;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmInsert",
				dataType : 'json',
				data : allData,
				success : function(data){
					alert("알람입력완료");
				}
			});	
	}
/* 알람부분 by태원 */
// $(document).ready(function () {
// 	$(‘body’).on(‘click’, ‘.feed-id’,function(){
// 	document.getElementById(“feed_id”).value = $(this).attr(‘data-id’);
// 	console.log($(this).attr(‘data-id’));
// 	});
// 	});

$(document).on("click", ".open-AddBookDialog", function () {
    var myBookId = $(this).data('id');
    var var1 = $(this).data('var1');
    var var2 = $(this).data('var2');
    
//     $(".form-group #usr").val( myBookId );
//     $(".form-group #pwd").val( myBookId ); 
    $("#haha").val(myBookId);
    $("#haha2").val(var1);
    $("#haha3").val(var2);
    // As pointed out in comments, 
    // it is superfluous to have to manually call the modal.
    // $('#addBookDialog').modal('show');
});

</script>


</head>
<body>
<div class="container">
<div class="main">
<div style="overflow-x:auto;">
<table>

	<thead>
		<tr role="row">
			<th style="text-align:center;">구매자</th>
			<th style="text-align:center;">배송상태</th>
			<th style="text-align:center;">총 가격</th>										
			<th style="text-align:center;">배송지</th>
<!-- 			<th style="text-align:center;">계좌</th> -->
<!-- 			<th style="text-align:center;">입금주</th> -->
<!-- 			<th style="text-align:center;">은행명</th> -->
			<th style="text-align:center;">주문번호</th>
<!-- 			<th style="text-align:center;">택배사</th> -->
<!-- 			<th style="text-align:center;">송장번호</th> -->
			<th style="text-align:center;" >입금시각</th>
			<th style="text-align:center;">입금확인</th>
			<th style="text-align:center;">배송시각</th>
			<th style="text-align:center;">배송확인</th>
			<th style="text-align:center;">인수시각</th>
			<th style="text-align:center;">인수확인</th>
			<th style="text-align:center;">상세보기</th>
			<th style="text-align:center;">판매자</th>
		</tr>
	</thead>

	<div class="orderList">
		<c:forEach var="ps_order" items="${orderList}" varStatus="orderListStatus">
 			<tr class="orderListContents" role="row">
 			
 			<%-- <c:if test="${status.first}"> --%>
 			
 				<td style="text-align:center;vertical-align:middle;">${ps_order.BUYER_ID}</td>
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${ps_order.STATUS eq 0}">
					입금대기
					</c:if>
					<c:if test="${ps_order.STATUS eq 1}">
					입금완료 및 배송대기중
					</c:if>
					<c:if test="${ps_order.STATUS eq 2}">
					배송 및 인수확인 대기
					</c:if>
					<c:if test="${ps_order.STATUS eq 3}">
					인수확인 및 거래완료 
					</c:if>
					<c:if test="${ps_order.STATUS eq 4}">
					결제취소
					</c:if>
 				</td>
 				<td style="text-align:center;vertical-align:middle;">${ps_order.TOTAL_PRICE}</td>
 				<td style="text-align:center;vertical-align:middle;">${ps_order.DESTINATION}</td>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.account}</td> --%>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.account_name}</td> --%>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.bank}</td> --%>
 				<td style="text-align:center;vertical-align:middle;">${ps_order.ORDER_NUM}</td>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.delivery_company}</td> --%>
<%--  				<td style="text-align:center;vertical-align:middle;">${orderList.invoice_num}</td> --%>
 				
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${empty ps_order.STEP2_DATE}">
					<i class="fa fa-remove"></i>
					</c:if>
					<c:if test="${not empty ps_order.STEP2_DATE}">
					<i class="fa fa-check"></i>
					</c:if>
 				</td>
 				<td style="text-align:center;vertical-align:middle;">
<%--  				<c:url var="status1" value="/admin_order/confirmProc" > --%>
<%-- 					<c:param name="order_num" value="${orderList.order_num}" />				 --%>  
<%-- 				</c:url> --%>																	<%-- ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND) alarmInsert('admin','empty','empty','${sessionScope.sessionId}',12)"/> --%>
				 <a href="/picksell/admin_order/confirmProc?order_num=${ps_order.ORDER_NUM}"><input type="button" value="입금완료" onclick="alert('완료되었습니다')"></a>
				 <%-- ('${ps_order.BUYER_ID}','${ps_order.ORDER_NUM}','empty','픽셀 관리자','16') --%> 
<%-- 				 <a href="${status1}"><input type="button" value="입금완료"></a>
 				</td>
 				  <%--  <c:forEach var="joinMap" items="${orderSubList[orderListStatus.index]}">
 				<script>
 				function alarmInsert2(){
 					alert(1);
 					alert('${joinMap.SELLER_ID}');
 					alert('${joinMap.SELLER_ID}');
 					//(ALARM_TARGET, ALARM_VARIABLE1, ALARM_VARIABLE2, ALARM_WRITER,ALARM_KIND){
 					//alarmInsert('${ps_order.BUYER_ID}','${ps_order.ORDER_NUM}','empty','픽셀 관리자','16');
 					alert(1);
 					} 
 				</script>
 				${joinMap.SELLER_ID}
 		    	</c:forEach> --%>
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${empty ps_order.STEP3_DATE}">
					<i class="fa fa-remove"></i>
					</c:if>
					<c:if test="${not empty ps_order.STEP3_DATE}">
					<i class="fa fa-check"></i>
					</c:if>
 				</td>
 				
 				<td style="text-align:center;vertical-align:middle;">
 				
 				<c:url var="status2" value="/admin_order/deliveryProc" >
					<c:param name="order_num" value="${ps_order.ORDER_NUM}" />							
				</c:url>
				
				<input type="button" data-toggle="modal" class="open-AddBookDialog btn btn-primary" data-target="#myModal" data-id="${ps_order.ORDER_NUM}" data-var1="${ps_order.BUYER_ID}" data-var2="${ps_order.ORDER_NUM}" value="배송중">
				 <!-- Modal -->
  				<div class="modal fade" id="myModal" role="dialog">
   				 <div class="modal-dialog">
    			  <!-- Modal content-->
     			 <div class="modal-content">
      			  <div class="modal-header">
      	  			  <button type="button" class="close" data-dismiss="modal">&times;</button>
      		   		 <h4 class="modal-title">택배사 / 송장번호 입력   ${ps_order.BUYER_ID}</h4>
      			  </div>
     		    <form action="/picksell/admin_order/deliveryProc" method="post">
   				 	<div class="form-group">
    				  <label for="delivery">택배사</label>
    				  <input type="text" name="delivery_company" value="Please type in a delivery company name"class="form-control" id="delivery">
   					 </div>
   					 <div class="form-group">
          	 		  <label for="invoice">송장번호</label>
    				  <input type="text" name="invoice_num" value="Please type in a invoice number"class="form-control" id="invoice">
  		  			</div>
  		  			<input type="hidden" id="haha" name="order_num" value=""/>
  		  			<input type="hidden" id="haha2" name="ALARM_TARGET" value=""/>
  		  			<input type="hidden" id="haha3" name="ALARM_VARIABLE1" value=""/>
  		  			<input type="submit" class="btn btn-default" value="입력완료" onclick="test()"/>
 		 		</form>
<!--        			 <div class="modal-footer"> -->
<%--          			<a href="${status2}">  <button type="button" class="btn btn-default" >입력완료</button> </a> --%>
        
<!--       	 		 </div> -->
     		 </div>
      
   		 </div>
 			 </div>
				 	 
 				</td>
 				
 				<td style="text-align:center;vertical-align:middle;">
 					<c:if test="${empty ps_order.STEP4_DATE}">
					<i class="fa fa-remove"></i>
					</c:if>
					<c:if test="${not empty ps_order.STEP4_DATE}">
					<i class="fa fa-check"></i>
					</c:if>
 				</td>
 				<td style="text-align:center;vertical-align:middle;">
 				<c:url var="status3" value="/admin_order/orderTerminate" >
					<c:param name="order_num" value="${ps_order.ORDER_NUM}" />							
				</c:url>
				 <a href="${status3}"><input type="button" value="인수확인" onclick="alarmInsert()"></a>
 				</td>
 				
 				<td style="text-align:center;vertical-align:middle;">

					<a href="/picksell/admin_order/orderDetail/${ps_order.ORDER_NUM}"><button class="button button1">상세보기</button></a>
<!--  				<a href="#" class="button button1"><input type="button" value="상세보기"></a> -->
 				</td>
 				
 			<%-- </c:if> --%>
 				<td style="text-align:center;vertical-align:middle;">
 			   <c:forEach var="joinMap" items="${orderSubList[orderListStatus.index]}">
 				<div>${joinMap.SELLER_ID}</div>
 		    	</c:forEach>
 		    	</td>
 				<%-- <td style="text-align:center;vertical-align:middle;">${orderList.seller_id}</td> --%>
 			</tr>
 			
 		</c:forEach>
 	</div>
</table> 
</div>	

 	<!--  등록된 상품이 없을때 -->
	<c:if test="${empty orderList}">
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
						<option value="0">구매자</option>
						<option value="1">상태</option>
						<option value="2">택배사</option>
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
</div>
</body>
</html>
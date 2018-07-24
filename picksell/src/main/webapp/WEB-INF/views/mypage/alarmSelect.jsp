<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
a.deleteA {
    color: #999999;
    height: 50px;
    width: 40px;
    line-height: 80px;
    background: url(/picksell/resources/img/cancel1.png) 50% 30% no-repeat;
    background-size: 15px;
    display: block;
    font-size: 15px;
    text-align: center;
    margin: 0 auto;
}
.paging {
    margin-top: 40px;
    text-align: center;
}
span.currentPaging {
    width: 40px;
    height: 40px;
    display: inline-block;
    background-color: #7151fc;
    color: white;
    border-radius: 30px;
    font-size: 23px;
}
a.paging {
    width: 40px;
    height: 40px;
    display: inline-block;
    color: #666;
    border-radius: 21px;
    font-size: 23px;
}
.orderkind {
    background-color: #7151fc;
    color: white;
    border-radius: 0px;
    width: 180px;
    height: 120px;
    line-height: 21px;
    display: inline-block;
    text-align: center;
    margin: -1px;
}
.my__stat__num-font {
    color: #fff;
    font-size: 50px;
    line-height: 83px;
}
.my__i-stat1 {
    font-size: 17px;
    line-height: 28px;
}
.alarm1 {
    display: inline-block;
    width: 35%;
    text-align: left;
    margin: 1%;
    margin-right: -14%;
}
.alarm2 {
    display: inline-block;
    width: 3%;
    text-align: center;
    margin: 0%;
    margin-right: 0%;
}
.alarm3 {
    display: inline-block;
    width: 22%;
    text-align: center;
    margin: 1%;
    margin-left: 16%;
}
.alarm4 {
    display: inline-block;
    width: 22%;
    text-align: center;
    margin: 1%;
    margin-left: -15%;
}
.alarm0 {
    font-size: 17px;
}
.next {
    width: 40%;
    margin: 0 auto;
    margin-left: 52%;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 5px;
    font-size: 12px;
}
#myAlarm2 {
    margin-right: -18%;
    background-color: #e80935;
    color: white;
    font-size: 12px;
    border-radius: 203px;
    width: 20px;
    height: 21px;
    line-height: 21px;
    display: inline-block;
    text-align: center;
    margin-left: 15%;
}
#myAlarm3{
    margin-right: -18%;
    background-color: white;
    color: white;
    font-size: 12px;
    border-radius: 203px;
    width: 20px;
    height: 21px;
    line-height: 21px;
    display: inline-block;
    text-align: center;
    margin-left: 15%;
}
</style>
</head>
<body>
<div>
<a href="/picksell/mypage/alarmSelect">
<span class="orderkind"><div class="my__i-stat1">알림 전체</div>
<span class="my__stat__num-font">${alarmCountKind.one}</span>개</span></a>

<a href="/picksell/mypage/alarmSelect?ALARM_CHECK=YES">
<span class="orderkind"><div class="my__i-stat1">읽음</div>
<span class="my__stat__num-font">${alarmCountKind.three}</span>개</span></a>

<a href="/picksell/mypage/alarmSelect?ALARM_CHECK=NO">
<span class="orderkind"><div class="my__i-stat1">읽지 않음</div>
<span class="my__stat__num-font">${alarmCountKind.two}</span>개</span></a>

<a href="#" onclick="AllAlarmDelete()"/>
<span class="orderkind"><div class="my__i-stat1">알림 전체 삭제</div>
<span class="my__stat__num-font">${alarmCountKind.one}</span>개</span></a>
</div>

<script>
function AllAlarmDelete(){
	if (confirm("정말 모두 삭제하시겠습니까?")) {
		location.href='/picksell/mypage/AllAlarmDelete';
		}
}
function alarmRead(ALARM_NUM){
	var allData = "ALARM_NUM="+ALARM_NUM;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmRead",
				dataType : 'json',
				data : allData,
				success : function(data){
				//alert("알람을 읽었습니다");
				}
			});	
}
function alarmDelete(ALARM_NUM){
	var allData = "ALARM_NUM="+ALARM_NUM;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmDelete",
				dataType : 'json',
				data : allData,
				success : function(data){
				
				alert("알림을 삭제했습니다");
				location.reload();//일단 새로고침으로 페이지 이동..ㅠㅠinnerhtml안쓰고..새로고침안하는방법을..찾아봅시당..
				}
			});	
}
</script>
<div class="alarm0">
<c:if test="${fn:length(alarmList) > 0}" >
	<c:forEach var="alarmMap" items="${alarmList}" varStatus="Index">
	<div class="alarm2"> ${Index.index+1} </div>
			 
		<c:if test="${alarmMap.ALARM_KIND == '2'}">
			<div class="alarm1">
			<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
			 		${alarmMap.ALARM_WRITER}님께서 구매신청을 수락하셨습니다.
			</a>
			</div>
		</c:if>
		
		 <c:if test="${alarmMap.ALARM_KIND == '3'}">
				<div class="alarm1">
				<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 구매신청을 하셨습니다.
				</a>
				</div>
	     </c:if>
	    
	     
	      <c:if test="${alarmMap.ALARM_KIND == '4'}"> 
				<div class="alarm1">
				<a href="/picksell/mypage/orderDetail/${alarmMap.ALARM_VARIABLE1}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 배송을 시작하셨습니다.
					
				</a>
				</div>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '5'}">
				<div class="alarm1">
				<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 구매신청을 거부 하셨습니다.
				</a>
				</div>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '6'}">
				<div class="alarm1">
				<a href="/picksell/mypage/saleDetail/${alarmMap.ALARM_VARIABLE1}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 인수확인 및 거래 종료 하셨습니다.
				</a>
				</div>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '7'}">
				<div class="alarm1">
				<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 구매신청을 취소 하셨습니다.
				</a>
				</div>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '8'}">
				<div class="alarm1">
				<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 구매신청 수락을 다시 취소 하셨습니다.
				</a>
				</div>
	     </c:if>
	     
	      <c:if test="${alarmMap.ALARM_KIND == '9'}">
				<div class="alarm1">
				<a href="/picksell/mypage/saleList" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 주문을 완료하셨습니다
				</a>
				</div>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '10'}">
				<div class="alarm1">
				<a href="/picksell/mypage/saleDetail/${alarmMap.ALARM_VARIABLE1}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 결제를 취소 하셨습니다.
				</a>
				</div>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '11'}">
				<div class="alarm1">
				<a href="/picksell/mypage/saleDetail/${alarmMap.ALARM_VARIABLE1}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 결제를 취소 하셨습니다.
				</a>
				</div>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '12'}">
				<div class="alarm1">
				<a href="/picksell/admin_order/list?searchNum=0&isSearch=${alarmMap.ALARM_WRITER}" onclick="alarmRead('${alarmMap.ALARM_NUM}')">
					${alarmMap.ALARM_WRITER}님께서 입금 하셨습니다. 관리자는 확인후 입금완료 바랍니다.
				</a>
				</div>
	     </c:if>
	     		<c:if test="${alarmMap.ALARM_CHECK == 'NO'}">
	     		<span class="myAlarm2" id="myAlarm2">1</span>
	     		</c:if>
	     		<c:if test="${alarmMap.ALARM_CHECK == 'YES'}">
	     		<span class="myAlarm3" id="myAlarm3"></span>
	     		</c:if>
	     		<div class="alarm3"><fmt:formatDate value="${alarmMap.ALARM_REGDATE}" pattern="yy-MM-dd HH:mm" /></div>
	     		<div class="alarm4">
	     		<a href="#" onclick="alarmDelete('${alarmMap.ALARM_NUM}')" id="alarmDelete" class="deleteA">삭제</a>
	     		<%-- <input type="button" class="next" id="alarmDelete" value="삭제" onclick="alarmDelete('${alarmMap.ALARM_NUM}')" /> --%>
	     		</div>
		<br>
	</c:forEach>
</c:if>
</div>
<c:if test="${fn:length(alarmList) < 1}">
<div>알람이 없습니다</div>
</c:if>
<div class="paging">
${pagingHtml}
</div>
</body>
</html>

<%-- <c:if test="${alarmMap.ALARM_CHECK == 'YES'}">
		읽음
		</c:if>
		<c:if test="${alarmMap.ALARM_CHECK == 'NO'}">
		안읽음
		</c:if> --%>

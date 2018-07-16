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
<title>알림 읽기</title>
<h2>알림 읽기</h2>
<br>
<a href="#">전체 보기/</a>
<a href="#">읽지 않은 알림/</a>
<a href="#">읽은 알림/</a>
<br>
<br>
</head>
<body>
<script>
function alarmRead(ALARM_NUM){
	var allData = "ALARM_NUM="+ALARM_NUM;
			$.ajax({
				type : "GET",
				url : "/picksell/mypage/alarmRead",
				dataType : 'json',
				data : allData,
				success : function(data){
				
				alert("알람을 읽었습니다");
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
<c:if test="${fn:length(alarmList) > 0}" >
	<c:forEach var="alarmMap" items="${alarmList}" varStatus="Index">
		
		<td>${Index.index+1}.</td>
		
		<c:if test="${alarmMap.ALARM_KIND == '2'}">
			<td>
			<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}?ALARM_NUM=${alarmMap.ALARM_NUM}">
			 		${alarmMap.ALARM_WRITER}님께서 구매신청을 수락하셨습니다.
			</a>
			</td>
		</c:if>
		
		 <c:if test="${alarmMap.ALARM_KIND == '3'}">
				<td>
				<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}?ALARM_NUM=${alarmMap.ALARM_NUM}">
					${alarmMap.ALARM_WRITER}님께서 구매신청을 하셨습니다.
				</a>
				</td>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '6'}">
				<td>
				<a href="/picksell/mypage/saleDetail/${alarmMap.ALARM_VARIABLE1}">
					${alarmMap.ALARM_WRITER}님께서 인수확인 및 거래 종료 하셨습니다.
				</a>
				</td>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '7'}">
				<td>
				<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}?ALARM_NUM=${alarmMap.ALARM_NUM}">
					${alarmMap.ALARM_WRITER}님께서 구매신청을 다시 취소 하셨습니다.
				</a>
				</td>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '8'}">
				<td>
				<a href="/picksell/products/detail/${alarmMap.ALARM_VARIABLE1}/${alarmMap.ALARM_VARIABLE2}?ALARM_NUM=${alarmMap.ALARM_NUM}">
					${alarmMap.ALARM_WRITER}님께서 구매신청 수락을 다시 취소 하셨습니다.
				</a>
				</td>
	     </c:if>
	     
	      <c:if test="${alarmMap.ALARM_KIND == '9'}">
				<td>
				<a href="/picksell/mypage/saleList">
					${alarmMap.ALARM_WRITER}님께서 주문을 완료하셨습니다
				</a>
				</td>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '10'}">
				<td>
				<a href="/picksell/mypage/saleDetail/${alarmMap.ALARM_VARIABLE1}?ALARM_NUM=${alarmMap.ALARM_NUM}">
					${alarmMap.ALARM_WRITER}님께서 결제를 취소 하셨습니다.
				</a>
				</td>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '11'}">
				<td>
				<a href="/picksell/mypage/saleDetail/${alarmMap.ALARM_VARIABLE1}?ALARM_NUM=${alarmMap.ALARM_NUM}">
					${alarmMap.ALARM_WRITER}님께서 결제를 취소 하셨습니다.
				</a>
				</td>
	     </c:if>
	     
	     <c:if test="${alarmMap.ALARM_KIND == '12'}">
				<td>
				<a href="/picksell/admin_order/list?searchNum=0&isSearch=${alarmMap.ALARM_WRITER}">
					${alarmMap.ALARM_WRITER}님께서 입금 하셨습니다. 관리자는 확인후 입금완료 바랍니다.
				</a>
				</td>
	     </c:if>
	     		<td>-<fmt:formatDate value="${alarmMap.ALARM_REGDATE}" pattern="yy-MM-dd HH:mm" /></td>
	     		<td>
	     		<input type="button" id="alarmDelete" value="삭제" onclick="alarmDelete('${alarmMap.ALARM_NUM}')" />
	     		</td>
		<br>
	</c:forEach>
</c:if>

<c:if test="${fn:length(alarmList) < 1}">
<p>알람이 없습니다</p>
</c:if>
</body>
</html>

<%-- <c:if test="${alarmMap.ALARM_CHECK == 'YES'}">
		읽음
		</c:if>
		<c:if test="${alarmMap.ALARM_CHECK == 'NO'}">
		안읽음
		</c:if> --%>

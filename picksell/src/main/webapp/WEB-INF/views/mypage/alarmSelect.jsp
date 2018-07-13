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
<title>알람 읽기</title>
<h2>알람 읽기</h2>
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
</script>
<c:if test="${fn:length(alarmList) > 0}" >
	<c:forEach var="alarmMap" items="${alarmList}" varStatus="Index">
		<c:if test="${alarmMap.ALARM_KIND == '3'}">
			<a href="/picksell/products/detail/${alarmMap.ALARM_CATEGORY_NUM}/${alarmMap.ALARM_BOARD_NUM}?ALARM_NUM=${alarmMap.ALARM_NUM}">
			${Index.index+1}.  ${alarmMap.ALARM_WRITER}님께서 구매신청을 하셨습니다.
			</a>
		<%-- <c:if test="${alarmMap.ALARM_CHECK == 'YES'}">
		읽음
		</c:if>
		<c:if test="${alarmMap.ALARM_CHECK == 'NO'}">
		안읽음
		</c:if> --%>
		</c:if>
	</c:forEach>
</c:if>

<c:if test="${fn:length(alarmList) < 1}">
<p>알람이 없습니다</p>
</c:if>
</body>
</html>

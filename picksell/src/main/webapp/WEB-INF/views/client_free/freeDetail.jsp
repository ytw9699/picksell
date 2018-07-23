<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/picksell/free_board/list">
    <input type="submit" value="목록보기" />
</form>

<!-- 수정 삭제는 기부자 이름과 세션아이딕 값이 같을 때 보인다.  -->
<c:if test="${map.FB_WRITER == sessionScope.sessionId}">
<form action="/picksell/free_board/modifyForm/${map.FB_NUM}" method="post">
<%-- 	<input type="hidden"  name="FB_NUM" value="${map.FB_NUM}"/> --%>
<%-- 	<input type="hidden"  name="FB_SUBJECT" value="${map.FB_SUBJECT}"/> --%>
<%-- 	<input type="hidden"  name="FB_WRITER" value="${map.FB_WRITER}"/> --%>
<%-- 	<input type="hidden"  name="FB_REGDATE" value="${map.FB_REGDATE}"/> --%>
<%-- 	<input type="hidden"  name="FB_CONTENT" value="${map.FB_CONTENT}"/> --%>
<%-- 	<input type="hidden"  name="FB_HITCOUNT" value="${map.FB_HITCOUNT}"/> --%>
    <input type="submit" value="수정하기" />
</form>
<form action="/picksell/free_board/deleteEverything/${map.FB_NUM}" method="post">
    <input type="submit" value="삭제하기" />
</form><br/>
</c:if>
무료나눔 게시글 상세보기 <br/><br/><br/>
글 번호 : ${map.FB_NUM}<br/>
글 제목 : ${map.FB_SUBJECT}<br/>
작성자 : ${map.FB_WRITER}<br/>
작성 일시 :${map.FB_REGDATE} <br/>
내용 : ${map.FB_CONTENT}<br/>
조회수 : ${map.FB_HITCOUNT}<br/>
<br/>

<p rows="20" style="width:100%;">댓글 ▽</p>
<table rows="20" style="width:100%;">
	<c:forEach var="commentMap" items="${commentMap}" varStatus="stat">
	<tr>
<%-- 		<td style="text-align:center;vertical-align:middle;">${commentMap.FC_NUM}</td> --%>
<%-- 		<td style="text-align:center;vertical-align:middle;">${commentMap.FB_NUM}</td> --%>
		<td style="text-align:center;vertical-align:middle;">작성자 : ${commentMap.FC_WRITER}</td>
		<td style="text-align:center;vertical-align:middle;">댓글 내용 : ${commentMap.FC_CONTENT}</td>
		<td style="text-align:center;vertical-align:middle;">작성 시간 : ${commentMap.FC_REGDATE}</td> 
		<td style="text-align:center;vertical-align:middle;">
			<form action="/picksell/free_board/deleteComment/${commentMap.FC_NUM}/${commentMap.FB_NUM}">
   			 <input type="submit" value="삭제" />
</form>
		</td>
	</tr>
	</c:forEach>
</table>
<c:if test="${empty commentMap}">
	<tr><td colspan="9" style="text-align:center;">등록된 댓글이 없습니다</td></tr>
</c:if> 

  
 	<form action="/picksell/free_board/commentWrite/${map.FB_NUM}" method="post" name="recommentForm" >
         <input type="hidden" value="${map.FB_NUM}" name="FB_NUM" />
           <input type="hidden" value="${sessionScope.sessionId}" name="FC_WRITER"/>
         <textarea  placeholder="댓글을 작성 하실 수 있습니다." name="FC_CONTENT" rows="20" style="width:100%;"></textarea>
 		<br/> <br/>       
         <input type="submit"  value="작성" />
      </form>



</body>
</html>
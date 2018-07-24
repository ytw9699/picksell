<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<style>

table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
    background-color:#E6E6E6;
}

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
}

	.button1{
    background-color: #7151fc;
    border: none;
    color: white;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 2px 1px;
    cursor: pointer;
}

.button2{
    background-color: #7151fc;
    border: none;
    color: white;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 2px 1px;
    cursor: pointer;
    margin-left : 1100px;
}

span.hi{
	font-size: 10px;
	color : 
}

</style>

<script>

function modify(){

	var fb_num = document.getElementById('fb_num').value;
	
	var r = confirm("진짜 수정 하실거에요?");
	
	if(r==true){
		window.location.href="http://localhost:8080/picksell/free_board/modifyForm/"+fb_num;
	}else if(r == false){
		window.location.href="http://localhost:8080/picksell/free_board/detail/"+fb_num;
	}

};

function dele(){
	
	var fb_num = document.getElementById('fb_num').value;
	
	var p = confirm("진짜 삭제 하실거죠?!");
	
	if(p == true){
		window.location.href="http://localhost:8080/picksell/free_board/deleteEverything/"+fb_num;
	}else if(p == false){
		window.location.href="http://localhost:8080/picksell/free_board/detail/"+fb_num;
	}
	
};

function confirmDele(fc_num){
	
// 	var fc_num = document.getElementById('fc_num').value;
 	var fb_num = document.getElementById('fb_num').value;
	
	
	var b = confirm("정말 댓글을 삭제할거죠?!");
	
	if(b == true){
		
		window.location.href="http://localhost:8080/picksell/free_board/deleteComment?fc_num="+fc_num+"&fb_num="+fb_num;
	}else if(b == false){
		alert(fc_num);
		window.location.href="http://localhost:8080/picksell/free_board/detail/"+fb_num;
	}
};

function listt(){
	window.location.href="http://localhost:8080/picksell/free_board/list";
};

</script>



<!-- <form action="/picksell/free_board/list"> -->
    <input type="submit" class="button" value="목록보기" onclick="listt()" />
<!-- </form> -->

<!-- 수정 삭제는 기부자 이름과 세션아이딕 값이 같을 때 보인다.  -->
<c:if test="${map.FB_WRITER == sessionScope.sessionId}">
<%-- <form action="/picksell/free_board/modifyForm/${map.FB_NUM}" method="post"> --%>
	<input type="hidden" id="fb_num" name="FB_NUM" value="${map.FB_NUM}"/>
<%-- 	<input type="hidden"  name="FB_SUBJECT" value="${map.FB_SUBJECT}"/> --%>
<%-- 	<input type="hidden"  name="FB_WRITER" value="${map.FB_WRITER}"/> --%>
<%-- 	<input type="hidden"  name="FB_REGDATE" value="${map.FB_REGDATE}"/> --%>
<%-- 	<input type="hidden"  name="FB_CONTENT" value="${map.FB_CONTENT}"/> --%>
<%-- 	<input type="hidden"  name="FB_HITCOUNT" value="${map.FB_HITCOUNT}"/> --%>
    <input type="submit" class="button"  value="수정하기" onclick="modify()" />
<!--    	<button onclick="modify()">수정하기</button><br/> -->
<!-- </form> -->
<%-- <form action="/picksell/free_board/deleteEverything/${map.FB_NUM}" method="post"> --%>
    <input type="submit" class="button" value="삭제하기" onclick="dele()" /><br/>
<!-- </form> -->


</c:if>
<br/>
무료나눔 게시글 상세보기 <br/><br/><br/>

글 번호 : ${map.FB_NUM}<br/>
글 제목 : ${map.FB_SUBJECT}<br/>
작성자 : ${map.FB_WRITER}<br/>
작성 일시 :${map.FB_REGDATE} <br/>
조회수 : ${map.FB_HITCOUNT}<br/>
내용 : ${map.FB_CONTENT}<br/>

<br/>

<p rows="20" style="width:100%;">댓글 ▽</p>
<table rows="20" style="width:100%;">
	<c:forEach var="commentMap" items="${commentMap}" varStatus="stat">
	<tr>
<%-- 		<td style="text-align:center;vertical-align:middle;">${commentMap.FC_NUM}</td> --%>
<%-- 		<td style="text-align:center;vertical-align:middle;">${commentMap.FB_NUM}</td> --%>
		<td style="text-align:left;vertical-align:middle;" width="70%;" > ${commentMap.FC_WRITER} &nbsp; <span class="hi"> [${commentMap.FC_REGDATE}] </span><br/>&nbsp;&nbsp;&nbsp;${commentMap.FC_CONTENT}</td>
<%-- 		<td style="text-align:center;vertical-align:middle;"> ${commentMap.FC_CONTENT}</td> --%>
<%-- 		<td style="text-align:center;vertical-align:middle;" width="20%;"> ${commentMap.FC_REGDATE}</td>  --%>
		
		
		<td style="text-align:center;vertical-align:middle;" width="10%;">
		
<%-- 		<input type="hidden" id="fc_num" name="FC_NUM" value="${commentMap.FC_NUM}"/> --%>
		<c:if test="${commentMap.FC_WRITER == sessionScope.sessionId}">
<%-- 			<form action="/picksell/free_board/deleteComment/${commentMap.FC_NUM}/${commentMap.FB_NUM}" onsubmit="confirmDele()"> --%>
				<button class="button1" onclick="confirmDele('${commentMap.FC_NUM}')">삭제</button>
<!--    			 <input type="submit" class="button1" value="삭제" onclick="confirmDele()" /> -->
<!-- 			</form> -->
		</c:if>
			
		</td>
	</tr>
	</c:forEach>
</table>
<br/>
<c:if test="${empty commentMap}">
	<tr><td colspan="9" style="text-align:center;">등록된 댓글이 없습니다</td></tr>
</c:if> 

  
 	<form action="/picksell/free_board/commentWrite/${map.FB_NUM}" method="post" name="recommentForm" >
         <input type="hidden" value="${map.FB_NUM}" name="FB_NUM" />
           <input type="hidden" value="${sessionScope.sessionId}" name="FC_WRITER"/>
         <textarea  placeholder="댓글을 작성 하실 수 있습니다." name="FC_CONTENT" rows="20" style="width:100%;"></textarea>
 		<br/> <br/>       
         <input type="submit" class="button2"  value="작성"  />
     </form>



</body>
</html>
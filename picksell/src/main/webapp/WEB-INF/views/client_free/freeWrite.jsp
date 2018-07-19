<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 스마트에디터 -->
<script type="text/javascript" src="/picksell/resources/se/js/HuskyEZCreator.js" charset="utf-8" ></script>
<script type="text/javascript" src="/picksell/resources/se/js/jindo.min.js" charset="utf-8" ></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="/picksell/resources/js/forEditer/common.js"></script>
<script type="text/javascript" src="/picksell/resources/js/forEditer/cc.js"></script>

<title>Insert title here</title>
</head>
<body>
무료나눔 글쓰기 <br/>

	<form id="freeItemForm" method="post" action="freeWrite" enctype="multipart/form-data">
		<input type="hidden" id="FB_WRITER" name="FB_WRITER" value="${sessionScope.sessionId}"/>
		제목 <input type="text" id="FB_SUBJECT" name="FB_SUBJECT" rows="20" style="width:100%;"/><br/>
		내용 
		<div class="contentDiv">
		<textarea id="FB_CONTENT" name="FB_CONTENT" rows="20" style="width:100%;"></textarea><br/>
		</div>
		<input type="submit" value="등록">
		
	</form>

<script>
//스마트에디터
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: document.getElementById('FB_CONTENT'), // html editor가 들어갈 textarea id
sSkinURI: "/picksell/resources/se/SmartEditor2Skin.html",  // html editor가 skin url
fOnAppLoad: function () { 
    //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
     var subject = '${item.subject}';               
     var content = '${item.content}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
     document.getElementById("title").value = subject;     
     oEditors.getById["txtContent"].exec("PASTE_HTML", [content]); //로딩이 끝나면 contents를 txtContent에 넣음
 },
 fCreator: "createSEditor2"
	});
</script>

</body>
</html>
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

<!-- 

글 번호 : ${map.FB_NUM}<br/>
글 제목 : ${map.FB_SUBJECT}<br/>
작성자 : ${map.FB_WRITER}<br/>
작성 일시 :${map.FB_REGDATE} <br/>
내용 : ${map.FB_CONTENT}<br/>
조회수 : ${map.FB_HITCOUNT}<br/>

 -->

<form id="freeModifyForm" method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="FB_NUM" value="${map.FB_NUM}"/>
	
	
	글 번호 : ${map.FB_NUM}<br/>
	글 제목 :<input type="text" name="FB_SUBJECT"value="${map.FB_SUBJECT}"/><br/>
	작성자 : ${map.FB_WRITER}<br/>
	수정 일시 : ${map.FB_REGDATE}<br/>
	내용
	<div class="contentDiv">
		<textarea id="FB_CONTENT" name="FB_CONTENT"  rows="20" style="width:100%;">${map.FB_CONTENT}</textarea><br/>
	</div>
	조회수 : ${map.FB_HITCOUNT}<br/>
	<input type="button"  onclick="onWrite()" value="수정"  />
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
    // var subject = '${item.subject}';               
    // var content = '${item.content}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
    // document.getElementById("title").value = subject;     
     oEditors.getById["FB_CONTENT"].exec("PASTE_HTML", [content]); //로딩이 끝나면 contents를 txtContent에 넣음
 },
 fCreator: "createSEditor2"
	});
	
/* 사진업로드 타입 유효성검증 */
var validationType = function(fileName){
	var type = fileName.substring(fileName.lastIndexOf('.')+1, fileName.length);
	if(type.toUpperCase() == 'JPG' || type.toUpperCase() == 'GIF' || type.toUpperCase() == 'PNG' || type.toUpperCase() == 'BMP'){
		return true;
	}else
		return false;
};

var pasteHTML = function(filename){
    var sHTML = '<img src="${pageContext.request.contextPath}/resources/productUpload/'+filename+'">';
    oEditors.getById["FB_CONTENT"].exec("PASTE_HTML", [sHTML]);
};

var onWrite = function(){
	oEditors.getById["FB_CONTENT"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	/* alert("밸류값"+document.getElementById('txtContent').value);
	alert("이너html"+document.getElementById('txtContent').innerHTML);
	alert("이너text"+document.getElementById('txtContent').innerTEXT); */
	var sm_contentValue = $("#FB_CONTENT").val();

    if( sm_contentValue == ""  || sm_contentValue == null || sm_contentValue == '&nbsp;' || sm_contentValue == '<p>&nbsp;</p>')  {
         alert("상품의 상세내용을 입력하세요");
       //  Animate2id('#c3');
         oEditors.getById["FB_CONTENT"].exec("FOCUS"); //포커싱
         return false;
        
    }else if(confirm("상품을 수정하시겠습니까?")){
    	var productForm = document.getElementById("freeModifyForm");  
		
		productForm.action ="/picksell/free_board/freeModify";              
		productForm.submit();
    }else{
    	return false;
    }
	
}

</script>


</body>
</html>
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

<style>
body{ overflow-x:hidden;}
.profileButtons{background-color: #ddd;
	border: none;
    width: 50%;
    margin: 0 auto;
    text-align: center;
    font-size: 17px;
    margin-top: 15px;
    padding: 5px;
    border-radius: 8px;}
    
    #container {
	/* background-color: red; */
	position: relative;
	left: 0;
	width: 10000px;
	top: 0;
	min-height: 500px;
}
#c1{width:1200px; height:100%; float:left; background-color: white; padding: 25px;}
#c2{width:1200px; height:100%; float:left; background-color: white; padding: 50px;}
#c3{width:1200px; height:100%; float:left; background-color: white; padding: 50px;}
#c4{width:1200px; height:100%; float:left; background-color: white; padding: 50px;}
.contentDiv {
    width: 80%;
}

</style>
</head>
<body>
	<div id="container">
		<form id="productForm"  method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="seller_id" value="플러스판매자test" />
		<input type="hidden" name="howtosell" value="${howtosell }" />
		<input type="hidden" name="product_status" value="0" />
		<!-- <input type="hidden" name="stock" value="1" /> -->
		
		<!-- 제품이미지 업로드단계 -->
		<div id="c1">
			<p>대표이미지를 선택해주세요
			<p>
			<div class="mainImg">
				<img src="#" id="mainPic" />
			</div>
	
			<label for="ex_file1" class="profileButtons" id="profileSearch">이미지 찾기</label>	
			<input type="file" name="first_img" id="ex_file1" />

			<a href="#" onClick="Animate2id('#c2','easeInOutExpo'); return false">다음</a>
			<!-- onClick="Animate2id('#c2','easeInOutExpo'); return false" -->	
		</div>
		
		<!-- 카테고리 및 제품사용여부 체크단계 -->
		<div id="c2">
			<p>제품 카테고리를 선택해주세요
			카테고리등록:
			<select name="category_num">
				<option value="0">카테고리선택</option>
				<option value="1">전자제품</option>
				<option value="2">패션/의류</option>
				<option value="3">패션/잡화</option>
				<option value="4">화장품/미용</option>
				<option value="5">스포츠/레저</option>
				<option value="6">유아동/출산</option>
				<option value="7">완구/문구/취미</option>
				<option value="8">도서/음반/DVD</option>
				<option value="9">가구/인테리어</option>
				<option value="10">생활/건강</option>
			</select>
	
			<!-- <p>사용 미사용체크
			<p>제품사용여부:
			<input type="radio" name="product_status" value="0" />
			<input type="radio" name="product_status" value="1" /> -->
	
			<p>
			<!-- <p><a href="#" onclick="Animate2id('#c3','easeInOutExpo'); return false" >아이디 찾기</a> -->
			<p><input type="button" value="다음" onclick="Animate2id('#c3','easeInOutExpo'); return false" class="c2_button" />
			<!-- <p><a href="#" onClick="Animate2id('#c1'); return false" >취소</a> -->
			<p><input type="button" value="뒤로" onclick="Animate2id('#c1'); return false" class="c2_cancel" />
		</div>
		
		<!-- 상품제목 및 상세내용 입력단계 -->
		<div id="c3">
			<p>상품제목입력해주세요 <input type="text" name="subject" />
			<p>상품내용입력해주세요
			<p>스마트에디터
			<div class="contentDiv">
		 	<textarea id="txtContent" name="content" rows="20" style="width:100%;"></textarea>
			</div>
			
			<p><input type="button" value="다음" onclick="Animate2id('#c4','easeInOutExpo'); return false" class="c2_button" />
			<!-- <p><a href="#" onClick="Animate2id('#c1'); return false" >취소</a> -->
			<p><input type="button" value="뒤로" onclick="Animate2id('#c2'); return false" class="c2_cancel" />
				
		</div>
		
		<!-- 제품가격 입력단계 -->
		<div id="c4">

			<p>제품 가격을 입력해주세요
			<p><input type="text" name="price" />
			
			<p>제품 수량을 입력해주세요
			<p><input type="text" name="stock" />
			<p><input type="button" value="뒤로" onclick="Animate2id('#c3'); return false" class="c2_cancel" />
			<!-- <p><a href="#" onClick="Animate2id('#c1'); return false">취소</a> -->
			<!-- <p><input type="submit" value="작성" /> -->
			
			<input type="button" onclick="onWrite()" value="작성" />
		</div>
		</form>
	</div>
	<!-- mmmmmmm -->
	<script type="text/javascript" src="/picksell/resources/js/jquery.easing.1.3.js"></script>
	<script>
	$(document).ready(function(){
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) { 
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#mainPic').attr('src', e.target.result);
					//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
					//(아래 코드에서 읽어들인 dataURL형식)
				}					
				reader.readAsDataURL(input.files[0]);
				//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}//readURL()--

		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#ex_file1").change(function(){
			//alert(this.value); //선택한 이미지 경로 표시
			readURL(this);
		});
		
	 });
	
	//이레이징
	function Animate2id(id,ease){ //the id to animate, the easing type
		var animSpeed=1000; //set animation speed
		var $container=$("#container"); //define the container to move
		if(ease){ //check if ease variable is set
			var easeType=ease;
		} else {
	    	var easeType="easeOutQuart"; //set default easing type
		}
		//do the animation
	    $container.stop().animate({"left": -($(id).position().left)}, animSpeed, easeType);
	}
	
	//스마트에디터
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id
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
	
	var pasteHTML = function(filename){
	    var sHTML = '<img src="${pageContext.request.contextPath}/resources/productUpload/'+filename+'">';
	    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
	};
	
	var onWrite = function(){
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
		var productForm = document.getElementById("productForm");  
		//var fileValue = document.getElementById("firstImg").value;
		productForm.action ="/picksell/sell/sellProc";              
		productForm.submit();
	}
		/*  if(validationType(fileValue)){
			 productForm.action ="/summer/board/write";              
			 productForm.submit();
		}else if(fileValue == ""){
			alert("대표사진을 등록해야합니다");
			return false;
		}else if(!validationType(fileValue)){
			alert("사진파일이 아닙니다");
			return false;
		} */
	</script>
</body>
</html>
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
/* body{ overflow-x:hidden;} */
#ex_file1 { /* 파일 필드 숨기기 */
position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0,0,0,0);
border: 0; left: 140px; top: 292px;}
body{
overflow-x: hidden;
}
.profileButtons {
    background-color: white;
    border: 1px solid #7151fc;
    color: #7151fc;
    width: 20%;
    display: block;
    margin: 0 auto;
    text-align: center;
    font-size: 17px;
    margin-top: 60px;
    padding: 15px;
}
    
#container {
    /* background-color: red; */
    position: relative;
    left: 0;
    width: 10000px;
    top: 0;
    min-height: 820px;
}
#c1{width:1200px; height:100%; float:left; background-color: white; padding-right: 20%;}
#c2{width:1200px; height:100%; float:left; background-color: white; padding-right: 20%;}
#c3{width:1200px; height:100%; float:left; background-color: white; padding-right: 20%;}
#c4{width:1200px; height:100%; float:left; background-color: white; padding-right: 20%;}
.contentDiv {
    width: 100%;
    margin: 0 auto;
    margin-top: 40px;
}
span.step1TEXT {
    display: block;
    font-size: 25px;
    text-align: center;
    margin-top: 20px;
    color: #7151fc;
}
img#mainPic {
    width: 100%;
    max-height: 360px;
}
.mainImg {
    width: 30%;
    margin: 0 auto;
    min-height: 300px;
    max-height: 300px;
}
/* 버튼업 */
input.nextBtn {
    display: block;
    width: 23%;
    margin: 0 auto;
    margin-top: 23px;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 15px;
    font-size: 15px;
}
span.step2TEXT {
    display: block;
    font-size: 25px;
    text-align: center;
    margin-top: 70px;
    color: #7151fc;
}
select#categorySELECT {
    padding: 10px;
    padding-left: 25px;
    font-size: 15px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    display: block;
    width: 30%;
    margin: 0 auto;
    margin-top: 25px;
    -webkit-appearance: none;
}
.step2_radioBtnWrap {
    width: 50%;
    margin: 0 auto;
    margin-top: 30px;
}
input.status_check_btn {
    width: 48%;
    outline: none;
    border: none;
    background-color: #ecf0f1;
    color: #9b9b9b;
    padding: 10px;
    font-size: 15px;
    box-sizing: border-box;
}
input.status_checked_btn{
	background-color: white;
    border: 1px solid #7151fc;
    color: #7151fc;
}
.step2_moveWrap {
    width: 50%;
    margin: 0 auto;
    margin-top: 150px;
}
input.step2_prevBtn {
    display: inline-block;
    width: 48%;
    margin: 0 auto;
    /* margin-top: 23px; */
    border: 1px solid #7151fc;
    color: #7151fc;
    background-color: white;
    padding: 15px;
    font-size: 15px;
}

input.step2_nextBtn {
    display: inline-block;
    width: 48%;
    margin: 0 auto;
    /* margin-top: 23px; */
    margin-left: 5px;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 15px;
    font-size: 15px;
}
/* step3 */
span.step3TEXT {
    display: block;
    font-size: 25px;
    text-align: center;
    margin-top: 70px;
    color: #7151fc;
}
input.contentINPUT {
    border: 1px solid #d8d8d8;
    display: block;
    width: 50%;
    margin: 0 auto;
    margin-top: 20px;
    padding: 15px;
    padding-left: 30px;
    font-size: 15px;
}
.step3_moveWrap {
    width: 50%;
    margin: 0 auto;
    margin-top: 60px;
}

input.step3_nextBtn {
    display: inline-block;
    width: 48%;
    margin: 0 auto;
    /* margin-top: 23px; */
    margin-left: 5px;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 15px;
    font-size: 15px;
}

input.step3_prevBtn {
    display: inline-block;
    width: 48%;
    margin: 0 auto;
    /* margin-top: 23px; */
    border: 1px solid #7151fc;
    color: #7151fc;
    background-color: white;
    padding: 15px;
    font-size: 15px;
}
input.contentPRICE_INPUT {
    border: none;
    border-bottom: 1px solid #d8d8d8;
    display: block;
    width: 25%;
    text-align: center;
    margin: 0 auto;
    margin-top: 20px;
    padding: 15px;
    font-size: 20px;
    color: #666;
    outline: none;
}

span.step4TEXT {
    display: block;
    font-size: 25px;
    text-align: center;
    margin-top: 70px;
    color: #7151fc;
}
.step4_moveWrap {
    width: 50%;
    margin: 0 auto;
    margin-top: 60px;
}

input.step4_prevBtn {
    display: inline-block;
    width: 48%;
    margin: 0 auto;
    /* margin-top: 23px; */
    border: 1px solid #7151fc;
    color: #7151fc;
    background-color: white;
    padding: 15px;
    font-size: 15px;
}

input.step4_nextBtn {
    width: 48%;
    margin: 0 auto;
    /* margin-top: 23px; */
    margin-left: 5px;
    border: none;
    color: white;
    background-color: #7151fc;
    padding: 15px;
    font-size: 15px;
}
/* 버튼disabled */
input.nextDisabled {
    background-color: #999;
}

</style>
</head>
<body>
	<div id="container">
		<form id="productForm"  method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="seller_id" value="${sessionScope.sessionId }" />
		<input type="hidden" name="howtosell" value="${howtosell }" />
		<input type="hidden" name="stock" value="1" />
		
		<!-- 제품이미지 업로드단계 -->
		<div id="c1" class="innerContentWrap">
			<span class="step1TEXT">대표이미지를 선택해주세요</span>
			
			<div class="mainImg">
				<img class="mainImgtag" src="/picksell/resources/img/for_first_img.png" id="mainPic" />
			</div>
	  
			<label for="ex_file1" class="profileButtons" id="profileSearch">이미지 찾기</label>	
			<input type="file" name="first_img" id="ex_file1" />

			<input type="button" id="step1_nextBtn" class="nextBtn nextDisabled" onclick="Animate2id('#c2','easeInOutExpo'); return false" value="다음" disabled="disabled" />
			<!-- <a href="#" onClick="Animate2id('#c2','easeInOutExpo'); return false">다음</a> -->
			<!-- onClick="Animate2id('#c2','easeInOutExpo'); return false" -->	
		</div>
		
		<!-- 카테고리 및 제품사용여부 체크단계 -->
		<div id="c2" class="innerContentWrap">
			<span class="step2TEXT">제품 카테고리를 선택해주세요</span>
			<select class="categorySELECT" id="categorySELECT" name="category_num">
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
	
			<span class="step2TEXT">제품 사용 여부를 체크해주세요</span>
			<input type="hidden" name="product_status" id="hid_status" value="" />
			
			<div class="step2_radioBtnWrap">
				<input type="button" value="미사용" class="status_check_btn" onclick="selectStatus('0',this);" />
				<input type="button" value="사용" class="status_check_btn" onclick="selectStatus('1',this);" />
			</div>
			
			<div class="step2_moveWrap">
				<input type="button" class="step2_prevBtn" value="뒤로" onclick="Animate2id('#c1'); return false" class="c2_cancel" />
				<input type="button" class="step2_nextBtn nextDisabled" value="다음" onclick="Animate2id('#c3','easeInOutExpo'); return false" id="c2_button" class="c2_button" disabled="disabled" />	
			</div>
		</div>
		
		<!-- 상품제목 및 상세내용 입력단계 -->
		<div id="c3" class="innerContentWrap">
			<span class="step3TEXT">상품제목을 입력해주세요</span>
			<input type="text" class="contentINPUT" id="contentSUBJECT" name="subject" />
			<span class="step3TEXT">상품내용을 입력해주세요</span>
			<div class="contentDiv">
		 	<textarea id="txtContent" name="content" rows="20" style="width:100%;"></textarea>
			</div>
			
			<div class="step3_moveWrap">
				<input type="button" value="뒤로" class="step3_prevBtn" onclick="Animate2id('#c2'); return false" class="c2_cancel" />
				<input type="button" value="다음" class="step3_nextBtn nextDisabled" id="step3_nextBtn" onclick="Animate2id('#c4','easeInOutExpo'); return false" disabled="disabled"/>
			</div>
		</div>
		
		<!-- 제품가격 입력단계 -->
		<div id="c4" class="innerContentWrap">

			<span class="step4TEXT">제품 가격을 입력해주세요</span>
			<input type="hidden" id="contentPRICE_HIDDEN" name="price" value="" />
			<input type="text" class="contentPRICE_INPUT" id="contentPRICE_INPUT" />
			
			<div class="step4_moveWrap">
				<input type="button" value="뒤로" class="step4_prevBtn" onclick="Animate2id('#c3'); return false" class="c2_cancel" />
				<!-- <p><a href="#" onClick="Animate2id('#c1'); return false">취소</a> -->
				<input type="button" id="total_submitINPUT" class="step4_nextBtn nextDisabled" onclick="onWrite()" value="작성" disabled="disabled" />
			</div>
		</div>
		</form>
	</div>
	<!-- mmmmmmm -->
	<script type="text/javascript" src="/picksell/resources/js/jquery.easing.1.3.js"></script>
	<script>
	$(document).ready(function(){
		
		var currentWindowWidth = document.body.offsetWidth - (document.body.offsetWidth / 100 * 20);
		var paddingValue = document.body.offsetWidth / 100 * 20;
		$('.innerContentWrap').css('width', currentWindowWidth);
		$('.innerContentWrap').css('padding-right', paddingValue);
		//$('#c1').css('width', currentWindowWidth);id를 이용한 연속css수정은 한번밖에 안되는부분이있음
		//$('#c2').css('width', currentWindowWidth);
		//$('#c3').css('width', currentWindowWidth);
		//$('#c4').css('width', currentWindowWidth);
		
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
			if(!validationType(this.value)){
				alert("사진파일이 아닙니다");
				$('#mainPic').attr('src', '/picksell/resources/img/for_first_img.png');
				$('#step1_nextBtn').addClass('nextDisabled');
				$('#step1_nextBtn').attr('disabled','disabled');
				return false;
			}else if(validationType(this.value)){
				$('#step1_nextBtn').removeClass('nextDisabled');
				$('#step1_nextBtn').removeAttr('disabled');
				readURL(this);
			}
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
	
	/* 콤마변환 */
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
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
	    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
	};
	
	var onWrite = function(){
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
		/* alert("밸류값"+document.getElementById('txtContent').value);
		alert("이너html"+document.getElementById('txtContent').innerHTML);
		alert("이너text"+document.getElementById('txtContent').innerTEXT); */
		var sm_contentValue = $("#txtContent").val();

        if( sm_contentValue == ""  || sm_contentValue == null || sm_contentValue == '&nbsp;' || sm_contentValue == '<p>&nbsp;</p>')  {
             alert("상품의 상세내용을 입력하세요");
             Animate2id('#c3');
             oEditors.getById["txtContent"].exec("FOCUS"); //포커싱
             return false;
            
        }else if(confirm("상품을 등록하시겠습니까?")){
        	var productForm = document.getElementById("productForm");  
    		
    		productForm.action ="/picksell/sell/sellProc";              
    		productForm.submit();
        }else{
        	return false;
        }
		
	}
	
	//step2 다음버튼 유효성검증
	function step2_validation(){
		if($('#categorySELECT').val() != '0' && $('#hid_status').val() != ''){
			$('#c2_button').removeAttr("disabled");
			$('#c2_button').removeClass("nextDisabled");
		}else{
			$('#c2_button').attr("disabled","disabled");
			$('#c2_button').addClass('nextDisabled');
		}
	}
	
	//setp3 다음버튼 유효성검증
	$('#contentSUBJECT').blur(function(){
		if(this.value == ''){
			$('#step3_nextBtn').attr("disabled", "disabled");
			$('#step3_nextBtn').addClass("nextDisabled");
		}else if(this.value != ''){
			$('#step3_nextBtn').removeAttr("disabled");
			$('#step3_nextBtn').removeClass("nextDisabled");
		}
	/* 	if(this.value != '')
			$('#step3_nextBtn').removeAttr("disabled");
		else if(this.value == '')
			$('#step3_nextBtn').addAttr("disabled", "disabled"); */
	});
	
	 //step4 가격버튼 blur focus
	$('#contentPRICE_INPUT').on({
		focus : function(){
			$(this).css('border-bottom', '1px solid #7151fc').val("");
			$('#contentPRICE_HIDDEN').val("");
		},
		keyup : function(){
			$(this).css('border-bottom', '1px solid #d8d8d8');
			var regExp = /^[0-9]+$/;
			if(!regExp.test($(this).val())){
				$(this).val("").focus();
				$('#total_submitINPUT').addClass("nextDisabled").attr("disabled", "disabled");
			}else{
				$('#contentPRICE_HIDDEN').val($(this).val());
				//$(this).val(addComma($(this).val()+" 원"));
				$('#total_submitINPUT').removeClass("nextDisabled").removeAttr("disabled");
			}
		},
		blur : function(){
			$(this).val(addComma($(this).val()+" 원"));
		}
	}); 
	
	//step2 체인지테스트
	$('#categorySELECT').change(function(){
		if(this.value == '0')
			alert('카테고리를 선택해주세요');
		
		step2_validation();
	});
	
	//step2 라디오기능
	function selectStatus(status, elements){
		$('#hid_status').val(status);
		//alert(elements.value);
		$('.status_check_btn').removeClass('status_checked_btn');
		$(elements).addClass('status_checked_btn');
		
		step2_validation();
	}
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	.btn {
  		border: none;
  		outline: none;
  		padding: 12px 16px;
 		 background-color: #f1f1f1;
 		 cursor: pointer;
		}

	.btn:hover {
 		 background-color: #ddd;
		}
</style>

<script>

$(function(){ 
    $('#id01').on('click',function(){ 
              alert("데이터 요청!> <");  
      $.ajax({ 
           url:'test05_3.jsp?dummy='+new Date().getTime, 
           type:'get', 
           success : function(t){ 
                 $(t).find("person").each(function(){ 
                           var name = $(this).find('name').text(); 
                           var age = $(this).find('age').text();
                           var salary = $(this).find('salary').text();
                           $('<h1></h1>').text(name+" "+age+" "+salary).appendTo('body'); 
                  }); 
            } , 
            error : function(){ 
                         alert('실패 ㅠㅠ'); 
             } 
      }); 
    }); 

    $('#id02').on('click',function(){ 
              alert("데이터 전송~ ^^*"); 
       $.ajax({ 
               url:'test05_2.jsp', //가져오고자하는 서버페이지 주소를 넣는다. 
               type:'post', //데이터를 서버로 전송하게 된다. 
               data:{ 
                      name: $('#name1').val(),  //에디터박스의 아이디를 넣으면 해당 에디터박스의 데이터를 보내준다.
                      age: $('#age1').val(), 
                      salary: $('#salary1').val() 
               } , 
               success : function(t){ 
                             alert('성공!');
               } , 
               error : function(){ 
                         alert('실패 ㅠㅠ'); 
               } 
        });
    }); 
}); 





function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      myFunction(this);
    }
  };
  xhttp.open("GET", "cd_catalog.xml", true); //xml : ps_order테이블로부터 가져온다. 
  xhttp.send();
}
function myFunction(xml) {
  var i;
  var xmlDoc = xml.responseXML;
  var table="<tr><th>번호</th><th>구매자</th><th>배송상태</th><th>총 가격</th><th>배송지</th><th>계좌</th><th>입금주</th><th>은행명</th><th>주문번호</th><th>택배사</th><th>송장번호</th></tr>";
  var x = xmlDoc.getElementsByTagName("CD"); //이것도 따로 정해주어야 한다. 
  for (i = 0; i <x.length; i++) { 
    table += "<tr><td>" + //테이블도 마저 정리해줘야 한다. 
    x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue + 
    "</td><td>" 
    x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue +
    "</td></tr>";
  }
  document.getElementById("demo").innerHTML = table;
}
</script>


</head>
<body>

	<h2>관리자페이지</h2>

	<div id="myBtnContainer">
	  	<button class="btn active" onclick=""> 계정관리</button>
 	 	<button class="btn" onclick=""> 판매관리</button>
  		<button id="id01" class="btn" onclick=""> 주문관리</button>
  		<button class="btn" onclick=""> 신고관리</button>
	</div>

</body>
</html>
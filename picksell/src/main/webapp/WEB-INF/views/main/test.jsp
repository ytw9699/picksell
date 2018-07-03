<!DOCTYPE html>
<html>
<head>
<title>Ajax Test</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
 $(function() {
  $('#AjaxStart').click(function() {
   var allData = "test1=1&test2=2";
   $.ajax({
    type : "POST",//GET
    dataType : 'text',//dataType: "json",
    data : allData,
    url : "/SpringMVC01/game/ajax",
    success : function(data) {
     alert(data);
    }
   });
  });
 });
</script>

</head>
<body>
 <button  id="AjaxStart">Ajax Start</button>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
${howtosell }
	<form>
	<input type="hidden" name="seller_id" value="일반판매자test" />
	<input type="hidden" name="howtosell" value="${howtosell }" />
	<input type="hidden" name="stock" value="1" />
	카테고리등록:
	<select name="category_num">
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
	</select>
	상품제목: <input type="text" name="subject" />
	<p>제품사용여부: <input type="radio" name="product_status" value="0" />
	<input type="radio" name="product_status" value="1" />
	
	
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var redirectValue = ${redirect}
	
	switch (redirectValue) {
	case 1:
		alert('상품문의가 등록되었습니다');
		document.location.href='/picksell/products/detail/'+${category_num}+'/'+${product_num}+'/'+${currentPage};
		break;
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var redirectValue = ${redirect}
	
	switch (redirectValue) {
	case 1:
		alert('상품문의가 등록되었습니다');
		//document.location.href='/picksell/products/detail/'+${category_num}+'/'+${product_num}+'/'+${currentPage};
		break;
	case 2:
		alert('구매신청이 완료되었습니다 \n판매자의 수락까지 기다려주세요');
		//document.location.href='/picksell/products/detail/'+${category_num}+'/'+${product_num}+'/'+${currentPage};
		break;
	case 3:
		alert('해당상품을 장바구니에 담았습니다');
		//document.location.href='/picksell/products/detail/'+${category_num}+'/'+${product_num}+'/'+${currentPage};
		break;
	case 4:
		alert('구매신청이 취소되었습니다');
		//document.location.href='/picksell/products/detail/'+${category_num}+'/'+${product_num}+'/'+${currentPage};
		break;
	}
</script>
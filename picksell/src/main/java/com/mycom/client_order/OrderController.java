package com.mycom.client_order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.Mypage.mypageService;

@Controller
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@RequestMapping(value="/purchase/order", method=RequestMethod.POST)
	public String orderProc(
			OrderModel orderModel,
			HttpServletRequest request,
			Model model,
			@RequestParam(value="o_list[0].product_num", required=false, defaultValue="0") String product_num, //by 태원
			@RequestParam(value="o_list[0].seller_id", required=false, defaultValue="0") String seller_id, //by 태원
			@RequestParam(value="buyer_id", required=false, defaultValue="0") String buyer_id //by 태원
			) {
		List<OrderListModel> parameterList = orderModel.getO_list();
		orderModel.setBuyer_id(request.getSession().getAttribute("sessionId").toString());
		
		orderService.insertBatchOrder(orderModel, parameterList);
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();//by 태원
		
		
		//여기서부터
		parameterMap.put("PRODUCT_NUM",product_num);//and 현우 지울 구매신청리스트를 위한 상품번호
		parameterMap.put("BUYER_ID", buyer_id);//and 현우 지울 구매신청리스트를 위한 바이어아이디
		
		if(!product_num.equals("0")) {
		orderService.deletePURCHASE_LIST(parameterMap);//일반구매 완료시 오더리스트 한줄 삭제 by 태원
		}
		for(int i = 0 ; i < orderModel.getO_list().size() ; i++) {
			
			
			parameterMap.put("ALARM_TARGET", orderModel.getO_list().get(i).getSeller_id());//by태원 알람입력추가 + 각각의 판매자
			parameterMap.put("ALARM_VARIABLE1","empty");//by태원 알람입력추가 + 별도의 타겟링크는 없음
			parameterMap.put("ALARM_VARIABLE2","empty");//by태원 알람입력추가 + 별도의 타겟링크는 없음
			parameterMap.put("ALARM_WRITER", orderModel.getBuyer_id());//by태원 알람입력추가 + 구매자(나의아이디)
			parameterMap.put("ALARM_KIND","9");//by태원 알람입력추가
			
			orderService.alarmInsert(parameterMap);//by태원 알람입력추가
			
		}
		//여기까지
		
		model.addAttribute("total_price", orderModel.getTotal_price());
		
		return "orderSuccess";
	}

}

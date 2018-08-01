package com.mycom.Mypage;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.mycom.client_product.ProductService;
import com.mycom.config.CommandMap;
import java.util.Date;

@Controller
public class mypageController {
	
	//페이징
	private int totalCount; 		 
	private int blockCount = 10;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private ProductPaging page;
	private orderListPaging page2;
	private alarmSelectPaging page3;
	private recentProductPaging page4;
			
	Map<String, Object> resultMap = new HashMap<String, Object>();//공통사용
	
	@Resource(name="mypageService")
	private mypageService mypageService;
	
	@Resource(name="productService")
	private ProductService productService;
	
	@RequestMapping(value="/mypage/memberCheck", method=RequestMethod.GET)
	public String memberCheck(){
		return "memberCheck";
	}
	@RequestMapping(value="/mypage/memberCheck", method=RequestMethod.POST)
	public String memberCheck2(HttpServletRequest request, Model model, HttpSession session){
		String DbPassword= mypageService.userCheck((String)session.getAttribute("sessionId"));
		String PASSWORD = request.getParameter("PASSWORD");
		
		if(!DbPassword.equals(PASSWORD)){
			model.addAttribute("resultPW", "WRONG");//비밀번호가 틀리다면
			return "memberCheck";
		}
		return "redirect:/mypage/modify";
	}
	
	@RequestMapping(value="/mypage/modify",method=RequestMethod.GET)
	public String modify(HttpSession session, Model model, HttpServletRequest request) {	
		
		String sessionId =(String)session.getAttribute("sessionId");
		
		resultMap = mypageService.userInfo(sessionId);//세션아이디에 해당하는 회원정보 한줄가져옴
		
		model.addAttribute("resultMap", resultMap);
		
		String Updated =  request.getParameter("updated");
		if(Updated != null) {
			model.addAttribute("Updated", "Updated");
		}
		return "modify";
	}
	@RequestMapping(value="/mypage/modify",method=RequestMethod.POST)
	public String modify(CommandMap map, Model model) {	
		
		if(map.get("business_number") == null) {
			mypageService.updatePersonal(map.getMap());//일반 회원수정	
			}
			else{
				mypageService.updateBusiness(map.getMap());//사업자 회원수정	
			}
		return "redirect:/mypage/modify?updated=updated";
	}
	
	@RequestMapping("/mypage/sellList")
	public String sellList(
	@RequestParam(value="HowToSell", required=false, defaultValue="3") String HowToSell,//기본값 3은 전체보기 
	@RequestParam(value="deal_status", required=false, defaultValue="3") String deal_status,//기본값 3은 전체보기
	@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber,
	Model model, HttpSession session) {
		
	Map<String, Object> parameterMap = new HashMap<String, Object>();
	
	String sessionId =(String)session.getAttribute("sessionId");
	
	parameterMap.put("HowToSell", HowToSell);
	parameterMap.put("deal_status", deal_status);
	parameterMap.put("sessionId", sessionId);
	
	List<Map<String, Object>> sellList = mypageService.sellList(parameterMap);
	
    totalCount = sellList.size();
    
	page = new ProductPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/mypage/sellList", HowToSell, deal_status);
	
	pagingHtml = page.getPagingHtml().toString();
	
	int lastCount = totalCount;
	
	if(page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;
	
	sellList = sellList.subList(page.getStartCount(), lastCount);
	
	model.addAttribute("pagingHtml", pagingHtml);
	model.addAttribute("HowToSell", HowToSell);
	model.addAttribute("sellList", sellList);
	model.addAttribute("currentPage", currentPageNumber);
	
	return "sellList";
}
	//중고구매 신청 리스트
	@RequestMapping("/mypage/purchaseList")
	public String purchaseList(Model model, HttpSession session) {	
		
		String sessionId =(String)session.getAttribute("sessionId");
		
		List<Map<String, Object>> purchaseList = mypageService.purchaseList(sessionId);
		
		model.addAttribute("purchaseList", purchaseList);
		
		return "purchaseList";
	}
	
	//중고구매 판매리스트
	@RequestMapping("/mypage/secondSellList")
	public String secondSellList(Model model, HttpSession session) {
		
		String sessionId =(String)session.getAttribute("sessionId");
		
		List<Map<String, Object>> secondSellList = mypageService.secondSellList(sessionId);
		
		model.addAttribute("secondSellList", secondSellList);
		
		return "secondSellList";
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage/deletePurchaseList", method=RequestMethod.GET)
	public int deletePurchaseList(@RequestParam(value="PURCHASE_NUM") String PURCHASE_NUM) {
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("PURCHASE_NUM",PURCHASE_NUM);
		
		int deleteReturn = mypageService.deletePurchaseList(parameterMap);//삭제되면 1리턴
		
		return deleteReturn;
	}
	
	@RequestMapping(value="/admin_order/list2",method=RequestMethod.GET)
	public String adminOrderList(Model model, HttpSession session ) {	
		
 	Map<String, Object> parameterMap = new HashMap<String, Object>();

    List orderSubList = new ArrayList();
    
    List<Map<String, Object>> adminOrderList = mypageService.adminOrderList();
    
    for(int i = 0 ; i < adminOrderList.size() ; i++) {
    	parameterMap.put("ORDER_NUM",String.valueOf(adminOrderList.get(i).get("ORDER_NUM")));
    	orderSubList.add(mypageService.orderSubList2(parameterMap));
    }
    
    model.addAttribute("orderList", adminOrderList);
    model.addAttribute("orderSubList", orderSubList);
    
	return "/admin_order/orderList";
	}
	
	@RequestMapping(value="/mypage/orderList",method=RequestMethod.GET)
	public String orderList(Model model, HttpSession session,
	@RequestParam(value="status", required=false, defaultValue="5") String status,//기본값 5는 전체보기
	@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber
	) {	
		
	Map<String, Object> parameterMap = new HashMap<String, Object>();
	
	parameterMap.put("status", status);
	
    List orderSubList = new ArrayList();//PS_ORDERLIST + PS_PRODUCT 테이블 조인
    
    String sessionId =(String)session.getAttribute("sessionId");
    
    parameterMap.put("sessionId", sessionId);
    
    List<Map<String, Object>> orderList = mypageService.orderList(parameterMap);//PS_ORDER
    //select * from ps_order where buyer_id = #{sessionId}
   
    totalCount = orderList.size();
    
    page2 = new orderListPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/mypage/orderList", status);
	
	pagingHtml = page2.getPagingHtml().toString();
	
	int lastCount = totalCount;
	
	if(page2.getEndCount() < totalCount)
		lastCount = page2.getEndCount() + 1;
	
	orderList = orderList.subList(page2.getStartCount(), lastCount);
    
    for(int i = 0 ; i < orderList.size() ; i++) {
    	parameterMap.put("ORDER_NUM",String.valueOf(orderList.get(i).get("ORDER_NUM")));
    	
    	orderSubList.add(mypageService.orderSubList(parameterMap));//리스트하나를 GET하고 다시 맵에서 GET
    }
    
    Map<String, Object> orderCount =  mypageService.orderCount(sessionId);
  
    model.addAttribute("orderCount", orderCount);
    model.addAttribute("orderList", orderList);
    model.addAttribute("orderSubList", orderSubList);
    model.addAttribute("pagingHtml", pagingHtml);

	return "orderList";
}
	
	@RequestMapping("/mypage/saleList")
	public String saleList(Model model, HttpSession session	,
	@RequestParam(value="status", required=false, defaultValue="5") String status,//기본값 5는 전체보기
	@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber
	) {	
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("status", status);
		
		 List saleSubList = new ArrayList();//PS_ORDERLIST + PS_PRODUCT 테이블 조인
		 
		 String sessionId =(String)session.getAttribute("sessionId");
		    
		 parameterMap.put("sessionId", sessionId);
		 
		 List<Map<String, Object>> saleList = mypageService.saleList(parameterMap);
		  
		 totalCount = saleList.size();
		
		 page2 = new orderListPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/mypage/saleList", status);
	
		 pagingHtml = page2.getPagingHtml().toString();
			
		int lastCount = totalCount;
			
		if(page2.getEndCount() < totalCount)
			lastCount = page2.getEndCount() + 1;
			
		saleList = saleList.subList(page2.getStartCount(), lastCount);
		
		for(int i = 0 ; i < saleList.size() ; i++) {
	    	parameterMap.put("ORDER_NUM",String.valueOf(saleList.get(i).get("ORDER_NUM")));
	    	
	    	saleSubList.add(mypageService.saleSubList(parameterMap));//리스트하나를 GET하고 다시 맵에서 GET
	    }
		
		Map<String, Object> saleCount =  mypageService.saleCount(sessionId);
		  
	    model.addAttribute("saleCount", saleCount);
	    model.addAttribute("saleList", saleList);
	    model.addAttribute("saleSubList", saleSubList);
	    model.addAttribute("pagingHtml", pagingHtml);
	    
	return "saleList";
}
	@RequestMapping(value="/mypage/orderDetail/{ORDER_NUM}", method=RequestMethod.GET)
	public String orderDetail(Model model, @PathVariable("ORDER_NUM") int ORDER_NUM) {	
		
			Map<String, Object> orderDetail = mypageService.orderDetail(ORDER_NUM);
			
			model.addAttribute("orderDetail", orderDetail);
			
			List<Map<String, Object>> orderSubDetail = mypageService.orderSubDetail(ORDER_NUM);
			
			model.addAttribute("orderSubDetail", orderSubDetail);
			
		return "orderDetail";
	}
			
	@RequestMapping(value="/mypage/saleDetail/{ORDER_NUM}", method=RequestMethod.GET)
	public String sailDetail(Model model, @PathVariable("ORDER_NUM") int ORDER_NUM, HttpSession session,
			@RequestParam(value="ALARM_NUM",required=false, defaultValue="0") int ALARM_NUM
			) {	
		
			Map<String, Object> saleDetail = mypageService.saleDetail(ORDER_NUM);
			
			model.addAttribute("saleDetail", saleDetail);
			
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			
			String sessionId =(String)session.getAttribute("sessionId");
			
			parameterMap.put("sessionId", sessionId);
			parameterMap.put("ORDER_NUM",saleDetail.get("ORDER_NUM"));
			
			List<Map<String, Object>> saleSubDetail = mypageService.saleSubDetail(parameterMap);
			
			model.addAttribute("saleSubDetail", saleSubDetail);
			
			if(ALARM_NUM != 0) {
			mypageService.alarmRead(ALARM_NUM);//알람읽기	
			}
		return "saleDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage/pulsStock", method=RequestMethod.GET)
	public String pulsStock(HttpServletRequest Request) {//재고 1 증가
		
		String PRODUCT_NUM = Request.getParameter("PRODUCT_NUM");
		
		mypageService.pulsStock(PRODUCT_NUM);
		
		return "String";//ajax에서 json이 아니라 text여야함
	}	
	
	@ResponseBody//이렇게 선언하고
	@RequestMapping(value="/mypage/minusStock", method=RequestMethod.GET)
	public Map minusStock(HttpServletRequest Request) {//재고 1감소
		
		String PRODUCT_NUM = Request.getParameter("PRODUCT_NUM");
		
		mypageService.minusStock(PRODUCT_NUM);
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		return parameterMap;//값을 이렇게 걍 아무거나 넘겨줘야 dataType : 'json',과 연관되서
		//success : function(data) 안의 값이 실행됨
}
	
	@ResponseBody
	@RequestMapping(value="/mypage/alarmInsert", method=RequestMethod.GET)
	public Map alarmInsert(
			@RequestParam(value="ALARM_TARGET") String ALARM_TARGET,
			@RequestParam(value="ALARM_VARIABLE1", required=false, defaultValue="0") String ALARM_VARIABLE1,
			@RequestParam(value="ALARM_VARIABLE2", required=false, defaultValue="0") String ALARM_VARIABLE2,
			@RequestParam(value="ALARM_WRITER") String ALARM_WRITER,
			@RequestParam(value="ALARM_KIND") String ALARM_KIND
			) {
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("ALARM_TARGET",ALARM_TARGET);
		parameterMap.put("ALARM_VARIABLE1",ALARM_VARIABLE1);
		parameterMap.put("ALARM_VARIABLE2",ALARM_VARIABLE2);
		parameterMap.put("ALARM_WRITER",ALARM_WRITER);
		parameterMap.put("ALARM_KIND",ALARM_KIND);
		
		mypageService.alarmInsert(parameterMap);//알람 입력
		
		return parameterMap;
}
	
	@RequestMapping("/mypage/alarmSelect")//알람을 허용한 사람만 리스트 가져오기
	public String alarmSelect(HttpSession session, Model model, 
	@RequestParam(value="ALARM_CHECK", required=false, defaultValue="ALL") String ALARM_CHECK,//기본값 ALL 은 전체보기
	@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber
	) {	
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		String sessionId =(String)session.getAttribute("sessionId");//세션아이디값
		String sessionAlarm =(String)session.getAttribute("sessionAlarm");//세션알람값
		
		parameterMap.put("ALARM_CHECK", ALARM_CHECK);
		parameterMap.put("sessionId", sessionId);
	
	if(!sessionAlarm.equals("ON")){
	 return "alarmSelect";
	}
	else {//알림이 ON일때만 리스트 가져오자
		List<Map<String, Object>> alarmList = mypageService.alarmSelect(parameterMap);//세션아이디에 해당하는 알람 가져옴
		
		totalCount = alarmList.size();
	  
		page3 = new alarmSelectPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/mypage/alarmSelect", ALARM_CHECK);
		
		pagingHtml = page3.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page3.getEndCount() < totalCount)
			lastCount = page3.getEndCount() + 1;
		
		alarmList = alarmList.subList(page3.getStartCount(), lastCount);
		
		Map<String, Object> alarmCountKind =  mypageService.alarmCountKind(sessionId);

		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("alarmCountKind", alarmCountKind);
		
		return "alarmSelect";
    } 
}
	@ResponseBody
	@RequestMapping(value="/mypage/alarmDelete", method=RequestMethod.GET)
	public int alarmDelete(@RequestParam(value="ALARM_NUM") String ALARM_NUM) {
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("ALARM_NUM",ALARM_NUM);
		
		int deleteReturn = mypageService.alarmDelete(parameterMap);//삭제되면 1리턴

		return deleteReturn;
	}
	//알람 전체삭제
	@RequestMapping("/mypage/AllAlarmDelete")
	public String AllAlarmDelete(HttpSession session) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		mypageService.AllAlarmDelete(sessionId);

		return "redirect:/mypage/alarmSelect";
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage/canclePs_order", method=RequestMethod.GET)
	public Map canclePs_order(@RequestParam(value="ORDER_NUM") String ORDER_NUM,
							@RequestParam(value="PRODUCT_NUM", required=false, defaultValue="0") String PRODUCT_NUM) {
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("ORDER_NUM",ORDER_NUM);
		parameterMap.put("PRODUCT_NUM",PRODUCT_NUM);
		
		mypageService.canclePs_order(parameterMap);//주문번호를 결제취소 44로바꿈
		mypageService.cancleDate(parameterMap);//Ps_order의 주문 취소날짜입력
		
		if(!PRODUCT_NUM.equals("0")) {
		mypageService.updateDeal_status(parameterMap);//Ps_product의 Deal_status를 (판매중) 으로 다시 되돌리기
		}
		
		return parameterMap;
	}
	
	@RequestMapping(value="/mypage/completing", method=RequestMethod.GET)
	public String completing( 
			@RequestParam(value="ORDER_NUM",required=false, defaultValue="0") String ORDER_NUM,
			@RequestParam(value="BUYER_ID",required=false, defaultValue="0") String BUYER_ID,
			@RequestParam(value="SELLER_ID",required=false, defaultValue="0") String SELLER_ID
			) {	
			if(!ORDER_NUM.equals("0")) {
			
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			
			parameterMap.put("ORDER_NUM", ORDER_NUM);
		
			mypageService.completing(parameterMap);
			
			mypageService.step4_date(parameterMap);
			
			parameterMap.put("ALARM_TARGET",SELLER_ID);
			parameterMap.put("ALARM_VARIABLE1",ORDER_NUM);
			parameterMap.put("ALARM_VARIABLE2","empty");
			parameterMap.put("ALARM_WRITER", BUYER_ID);
			parameterMap.put("ALARM_KIND","6");
			
			mypageService.alarmInsert(parameterMap);//알람 입력
			
			return "completing";//인수확인 및 거래 완료가 정상적으로 됬을때
			}
			return "completing";//인수확인 및 거래 완료가 정상적으로 안됬을때
	}
	
	@RequestMapping("/mypage/recentProduct")
	public String recentProduct(HttpSession session,Model model,
			@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber) {
			
			String sessionId =(String)session.getAttribute("sessionId");
			
				List<Map<String, Object>> recentlist = mypageService.recentlist(sessionId);
				
				totalCount = recentlist.size();
				
				page4 = new recentProductPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/mypage/recentProduct");
				
				pagingHtml = page4.getPagingHtml().toString();
				
				int lastCount = totalCount;
				
				if(page4.getEndCount() < totalCount)
					lastCount = page4.getEndCount() + 1;
				
				recentlist = recentlist.subList(page4.getStartCount(), lastCount);
				
				model.addAttribute("pagingHtml", pagingHtml);
				model.addAttribute("currentPage", currentPageNumber);
				model.addAttribute("recentlist", recentlist);
		
		return "recentProduct";
	}
	
	/*최근본상품 전체삭제*/
	@RequestMapping("/mypage/deleteRecenPd")
	public String deleteRecenPd(HttpSession session,Model model) {
		
		String sessionId =(String)session.getAttribute("sessionId");
			
		mypageService.deleteRecenPd(sessionId);
		
		return "redirect:/mypage/recentProduct";
	}
	
	@RequestMapping("/mypage/EachdeleteRecenPd")
	public String EachdeleteRecenPd(@RequestParam(value="RECENT_NUM",required=false, defaultValue="0") int RECENT_NUM
			) {
		mypageService.EachdeleteRecenPd(RECENT_NUM);
		
		return "redirect:/mypage/recentProduct";
	}
	
	@RequestMapping("/mypage/alarmCount")
	@ResponseBody
	public Map<String, Object> alarmCount(HttpSession session){
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String sessionId = (String)session.getAttribute("sessionId");
		
	if(sessionId != null) {
		int alarmSum = mypageService.alarmCount(sessionId);
		//select count(*) from ps_alarm where alarm_target = #{sessionId} and alarm_check = 'NO'
		
		resultMap.put("alarmSum", alarmSum);
	}
		return resultMap;
}
	
	@RequestMapping("/mypage/deliveryInsert")
	public String deliveryInsert(Model model,//배송사항 입력
	@RequestParam(value="ORDER_NUM",required=false, defaultValue="0") String ORDER_NUM,
	@RequestParam(value="DELIVERY_COMPANY",required=false, defaultValue="0") String DELIVERY_COMPANY,
	@RequestParam(value="INVOICE_NUM",required=false, defaultValue="0") String INVOICE_NUM,
	@RequestParam(value="ALARM_TARGET",required=false, defaultValue="0") String ALARM_TARGET,
	@RequestParam(value="ALARM_WRITER",required=false, defaultValue="0") String ALARM_WRITER
	) {	
		if(!ORDER_NUM.equals("0")) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("ORDER_NUM",ORDER_NUM);
		parameterMap.put("DELIVERY_COMPANY",DELIVERY_COMPANY);
		parameterMap.put("INVOICE_NUM",INVOICE_NUM);
		parameterMap.put("ALARM_TARGET",ALARM_TARGET);
		parameterMap.put("ALARM_WRITER",ALARM_WRITER);
		
		mypageService.deliveryInsert(parameterMap);//배송사항 입력
		
		parameterMap.put("ALARM_VARIABLE1",ORDER_NUM);
		parameterMap.put("ALARM_VARIABLE2",ORDER_NUM);
		parameterMap.put("ALARM_KIND","4");
		
		mypageService.alarmInsert(parameterMap);//알람 입력
		
		}
	return "redirect:/mypage/saleDetail/"+ORDER_NUM;
    } 
	
	@RequestMapping("/mypage/alarmRead")
	@ResponseBody
	public Map<String, Object> alarmRead(
			@RequestParam(value="ALARM_NUM",required=false, defaultValue="0") int ALARM_NUM
			){
		
		productService.alarmRead(ALARM_NUM);
		
		return resultMap;
}
	//프로필 이미지 업로
		@RequestMapping(value="/mypage/profile", method=RequestMethod.POST)
		public String profile(
				CommandMap map,
				@RequestParam("PROFILE_IMG") MultipartFile file,
				HttpServletRequest request) throws IOException {
			
			String sessionId = (String) request.getSession().getAttribute("sessionId");
			
			//자신의아이디+현재시간+타입
			String imgFileName = file.getOriginalFilename();
			
			String imgFileType = imgFileName.substring(imgFileName.lastIndexOf("."), imgFileName.length());
			
			Calendar cal = Calendar.getInstance();
			
			String replaceName = sessionId+cal.getTimeInMillis()+imgFileType;
			
			//이미지 업로드
			String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"resources/profileImgUpload";
		
			File uploadPROFILE_IMG = new File(path, replaceName);
			
			file.transferTo(uploadPROFILE_IMG);
			//System.out.println(path); //경로확인
			
			map.put("PROFILE_IMG", replaceName);
			map.put("sessionId", sessionId);
			
			mypageService.profile(map.getMap());
			
			return "redirect:/mypage/modify";
		}
		
		@RequestMapping("/mypage/defaultProfile")
		public String profile(HttpSession session){
			
			String sessionId = (String) session.getAttribute("sessionId");
			
			mypageService.defaultProfile(sessionId);
			
			return "redirect:/mypage/modify";
		}
		
		@RequestMapping("/mypage/headerAlarmList")
		@ResponseBody
		  public List<Map<String, Object>> getMyAlarmHeaderList(
		         HttpServletRequest request){
			
		      List<Map<String, Object>> resultHeaderAlarmList;
		      
		      String currentID = request.getSession().getAttribute("sessionId").toString();
		      String currentONOFF = request.getSession().getAttribute("sessionAlarm").toString();
		      
		      int SEC = 60;
			  int MIN = 60;
			  int HOUR = 24;
			  int DAY = 30;
			  int MONTH = 12;
		      
		      if(currentID != null && currentONOFF.equals("ON")) {
		         resultHeaderAlarmList = mypageService.getMyAlarmHeaderList(currentID);
		         
		         for(int i = 0 ; i < resultHeaderAlarmList.size() ; i++) {
		        	 Date gettingTime = (Date) resultHeaderAlarmList.get(i).get("ALARM_REGDATE");
		        	 long curTime = System.currentTimeMillis();
		        	 long regTime = gettingTime.getTime();
			         long diffTime = (curTime - regTime) / 1000;
			         if (diffTime < SEC) {
				            // sec
			        	 resultHeaderAlarmList.get(i).put("ALARM_REGDATE", "방금 전");
			        	 //resultHeaderAlarmList.add("방금 전");
				         } else if ((diffTime /= SEC) < MIN) {
				            // min
				            //regtimeTextList.add(diffTime + "분 전");
				        	resultHeaderAlarmList.get(i).put("ALARM_REGDATE", diffTime+"분 전");
				         } else if ((diffTime /= MIN) < HOUR) {
				            // hour
				            //regtimeTextList.add((diffTime) + "시간 전");
				        	resultHeaderAlarmList.get(i).put("ALARM_REGDATE", diffTime+"시간 전");
				         } else if ((diffTime /= HOUR) < DAY) {
				            // day
				           // regtimeTextList.add((diffTime) + "일 전");
				        	 resultHeaderAlarmList.get(i).put("ALARM_REGDATE", diffTime+"일 전");
				         } else if ((diffTime /= DAY) < MONTH) {
				            // day
				            //regtimeTextList.add((diffTime) + "달 전");
				        	 resultHeaderAlarmList.get(i).put("ALARM_REGDATE", diffTime+"달 전");
				         } else {
				           // regtimeTextList.add((diffTime) + "년 전");
				        	 resultHeaderAlarmList.get(i).put("ALARM_REGDATE", diffTime+"년 전");
				         }
		         }
		         
		         return resultHeaderAlarmList;
		      }else {
		         return new ArrayList<Map<String,Object>>();
		      }
		  }
		
		//구매신청 거부
		@ResponseBody
		@RequestMapping("/mypage/refusalApprove")
		public Map<String, Object> refusalApprove(Model model,
		@RequestParam(value="PRODUCT_NUM",required=false, defaultValue="0") int PRODUCT_NUM,
		@RequestParam(value="BUYER_ID",required=false, defaultValue="0") String BUYER_ID
			){
			
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("product_num", PRODUCT_NUM);
		
		parameterMap.put("buyer_id", BUYER_ID);
		
		productService.deleteProductPurchaseList(parameterMap);
		return parameterMap;
}
}

		

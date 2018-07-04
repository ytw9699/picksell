package com.mycom.Mypage;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.mycom.Member.CookieBox;
import com.mycom.config.CommandMap;
import com.mycom.utils.FileUpload;

@Controller
public class mypageController {
	Map<String, Object> resultMap = new HashMap<String, Object>();//공통사용
	
	@Resource(name="mypageService")
	private mypageService mypageService;
	
	@RequestMapping(value="/mypage/modify",method=RequestMethod.GET)
	public String modify(HttpSession session, Model model) {	
		
		String sessionId =(String)session.getAttribute("sessionId");
		
		resultMap = mypageService.userInfo(sessionId);//세션아이디에 해당하는 회원정보 한줄가져옴
		
		model.addAttribute("resultMap", resultMap);
		
		return "modify";
	}
	@RequestMapping(value="/mypage/modify",method=RequestMethod.POST)
	public String modify(CommandMap map) {	
		
		if(map.get("business_number") == null) {
			mypageService.updatePersonal(map.getMap());//일반 회원수정	
			}
			else{
				mypageService.updateBusiness(map.getMap());//사업자 회원수정	
			}
		return "redirect:/mypage/modify";
	}
	@RequestMapping(value="/mypage/sellList/{DEAL_STATUS}", method=RequestMethod.GET)
	public String sellList(Model model, HttpSession session, @PathVariable("DEAL_STATUS") String DEAL_STATUS) {	
		
	String sessionId =(String)session.getAttribute("sessionId");
	if(DEAL_STATUS.equals("0")) {
		List<Map<String, Object>> sellList = mypageService.sellList0(sessionId);
		model.addAttribute("sellList", sellList);
	}
	if(DEAL_STATUS.equals("1")) {
		List<Map<String, Object>> sellList = mypageService.sellList1(sessionId);
		model.addAttribute("sellList", sellList);
		}
	if(DEAL_STATUS.equals("2")) {
		List<Map<String, Object>> sellList = mypageService.sellList2(sessionId);
		model.addAttribute("sellList", sellList);
	}
	
	return "sellList";
	}
	
	@RequestMapping(value="/mypage/purchaseList/{STATUS}",method=RequestMethod.GET)
	public String purchaseList(Model model, HttpSession session, @PathVariable("STATUS") String STATUS) {	
		
		String sessionId =(String)session.getAttribute("sessionId");
		
		if(STATUS.equals("0")) {
			List<Map<String, Object>> purchaseList = mypageService.purchaseList0(sessionId);
			model.addAttribute("purchaseList", purchaseList);
		}
	
		return "purchaseList";
	}
	@RequestMapping(value="/mypage/orderList",method=RequestMethod.GET)
	public String orderList(Model model, HttpSession session) {	
		
		String sessionId =(String)session.getAttribute("sessionId");
	
			List<Map<String, Object>> orderList = mypageService.orderList(sessionId);
			model.addAttribute("orderList", orderList);
	
		return "orderList";
	}
	@RequestMapping(value="/mypage/orderDetail/{PRODUCT_NUM}",method=RequestMethod.GET)
	public String orderList(Model model, @PathVariable("PRODUCT_NUM") int PRODUCT_NUM) {	
		
			Map<String, Object> orderDetail = mypageService.orderDetail(PRODUCT_NUM);
			model.addAttribute("orderDetail", orderDetail);
	
		return "orderDetail";
	}
}

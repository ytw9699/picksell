package com.mycom.admin_member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_member.AdminMemberModel;
import com.mycom.config.CommandMap;


@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
    

	//회원계정상태 변경처리

	//판매글 블라인드
	
	//회원검색
	private int searchNum;
	private String memberSearch;
	private int searchCount;
	
	@Resource
	private AdminMemberService adminMemberService;
	
	ModelAndView mav = new ModelAndView();
	List<AdminMemberModel> memberslist;
	List<Map<String,Object>> maplist;
	

	
	//전체 회원리스트
	@RequestMapping(value="/list")
	public ModelAndView adminMemberList(HttpServletRequest request) throws Exception{
	   
		memberslist= adminMemberService.AdminMemberList();
		
		mav.addObject("memberCount",memberslist.size());
		mav.addObject("searchCount",0);
		mav.addObject("memberslist",memberslist);
	    mav.setViewName("adminMemberList");
		return mav;
		//검색결과는 0 , memberCount = 전체 회원수 
	}
	
	//회원 검색
	@RequestMapping(value="/search")
	public ModelAndView adminMemberSearch(HttpServletRequest request) throws Exception{
		//name
        
	  searchNum = Integer.parseInt(request.getParameter("searchNum"));
	  memberSearch = request.getParameter("memberSearch");
      if(memberSearch == " ") {
    	  mav.setViewName("adminMemberList");
    	  return mav;
    	 
      }

	  if(memberSearch != null) { //검색어 있을 경우 
    	 if(searchNum == 0) { // value 이름
		    memberslist = adminMemberService.searchName(memberSearch);			
		 }else{
		    memberslist = adminMemberService.searchId(memberSearch);
    	 }
    	  	 
	  }
	    //공통
	  	mav.addObject("searchCount",memberslist.size()); 
	  	mav.addObject("memberslist",memberslist);
		mav.setViewName("adminMemberList");
		return mav;
	}
	
	//회원상세보기 
	@RequestMapping(value="/info/{memberId}")
	public String adminMemberDetail(@PathVariable("memberId")String id,Model model) throws Exception{
	
		Map<String,Object> resultmap = adminMemberService.selectOneMember(id);
		model.addAttribute("map",resultmap);
		return "adminMemberDetail";
	}
	
	
	//회원 주문 내역리스트
	@RequestMapping(value="/orderList/{memberId}")
	public String adminMemberOrderList(@PathVariable("memberId") String id,Model model) throws Exception {
		
		Map<String,Object> map = new HashMap<String,Object>();
		maplist = adminMemberService.adminOrderList(id);
	    int statusCheck;
	    map.put("mapSize", maplist.size());
	  
	    
		for(int i=0; i< maplist.size(); i++) {
		  
		   statusCheck =Integer.parseInt((String)maplist.get(i).get("STATUS"));
		   switch(statusCheck){
		   case 0:
			   maplist.get(i).put("STATUS", "입금대기");
			   break;
		   case 1:
			   maplist.get(i).put("STATUS", "입금완료 및 배송대기중");
			   break;
		   case 2:
			   maplist.get(i).put("STATUS", "배송 및 인수확인 대기");
			   break;
		   case 3:
			   maplist.get(i).put("STATUS", "인수확인 및 거래완료");
			   break;
		   }
		}
		
		model.addAttribute("map",map);
		model.addAttribute("maplist",maplist);
		
		return "adminMemberOrderList";
	}
   
	
	//회원 판매내역 리스트
	@RequestMapping(value="/sellHistory/{memberId}")
	public String adminSellHistory(@PathVariable("memberId") String id,Model model)throws Exception {
	 
		//판매내역개수
		maplist = adminMemberService.adminSellHistory(id);
		model.addAttribute("maplist", maplist);
		return "adminSellHistory";
	}

	//회원 구매내역리스트
	@RequestMapping(value="/purchaseHistory/{memberId}") 
	public String adminPurchaseHistory(@PathVariable("memberId") String id,Model model) throws Exception {
		maplist = adminMemberService.adminPurchaseHistory(id);
		model.addAttribute("maplist",maplist);
		
		
		
		
		
		return "adminPurchaseHistory";
	}
	
	
	//회원 판매글 리스트
	@RequestMapping(value="/products/{memberId}")
	public String Products(@PathVariable("memberId") String id,Model model) throws Exception{
		
		
		return "adminProducts";
		
		
	}
}

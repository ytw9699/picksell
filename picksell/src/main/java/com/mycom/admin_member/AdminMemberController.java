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
import com.mycom.common.Paging;
import com.mycom.config.CommandMap;


@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
    

	//회원계정상태 변경처리

	//판매글 블라인드
	
	//회원검색
	private int searchNum;
	private String isSearch;
	private int searchCount;

	//paging
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	
	
	@Resource
	private AdminMemberService adminMemberService;
	
	ModelAndView mav = new ModelAndView();
	List<AdminMemberModel> memberslist;
	List<Map<String,Object>> maplist;
	

	
	//전체 회원리스트
	@RequestMapping(value="/list")
	public ModelAndView adminMemberList(HttpServletRequest request) throws Exception{
	   
		memberslist= adminMemberService.AdminMemberList();
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
	
		isSearch = null;
		totalCount = memberslist.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list", searchNum,isSearch);
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		mav.addObject("memberCount",memberslist.size());
		mav.addObject("a",totalCount);
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		memberslist = memberslist.subList(page.getStartCount(), lastCount);
		
		int startNumber = (currentPage-1) * blockCount + 1;
		searchCount = 0;
		mav.addObject("startNumber",startNumber);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("searchCount",searchCount);
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
	  isSearch = request.getParameter("isSearch");
	
	  
	  if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
          currentPage = 1;
      } else {
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }
	  
	  if(isSearch != null) { //검색어 있을 경우 
    	 if(searchNum == 0) { // value 이름
		    memberslist = adminMemberService.searchName(isSearch);			
		 }else{
		    memberslist  = adminMemberService.searchId(isSearch);
    	 }
    	 mav.addObject("searchCount",memberslist.size());
    	 totalCount = memberslist.size();
	     page = new Paging(currentPage, totalCount, blockCount, blockPage, "search", searchNum, isSearch);
		 pagingHtml = page.getPagingHtml().toString();
		 int lastCount = totalCount;
		 if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
		  
		 memberslist = memberslist.subList(page.getStartCount(), lastCount);
	  
	  }
	  
	  if(isSearch == ""){
		  
		  adminMemberList(request);
	  }
	    //공통
	  	int startNumber = (currentPage-1) * blockCount + 1;
		mav.addObject("startNumber",startNumber);
	    mav.addObject("blockCount",blockCount);
	    mav.addObject("memberslist",memberslist);
		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum", searchNum);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("totalCount", totalCount);
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
	    map.put("mapSize", maplist.size());

		
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

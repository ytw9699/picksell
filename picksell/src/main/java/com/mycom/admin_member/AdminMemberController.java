package com.mycom.admin_member;



import java.util.ArrayList;
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
	//누구세요?
    //전체 회원리스트
	//회원상세보기 
	//회원계정상태 변경처리
	//회원 주문내역리스트
	//회원 판매내역 리스트
	//회원 구매내역리스트
	//회원 판매글 리스트
	//판매글 블라인드
	
	//회원검색
	private int searchNum;
	private String memberSearch;
	private int searchCount;
	
	@Resource
	private AdminMemberService adminMemberService;
	
	ModelAndView mav = new ModelAndView();
	List<AdminMemberModel> memberslist;
	
	@RequestMapping(value="/list")
	public ModelAndView adminMemberList(HttpServletRequest request) throws Exception{
	   
		memberslist= adminMemberService.AdminMemberList();
		
		mav.addObject("memberCount",memberslist.size());
		mav.addObject("searchCount",null);
		mav.addObject("memberslist",memberslist);
	    mav.setViewName("adminMemberList");
		return mav;
		//검색결과는 0 , memberCount = 전체 회원수 
	}
	
	
	@RequestMapping(value="/search")
	public ModelAndView adminMemberSearch(HttpServletRequest request) throws Exception{
		//name
        
	  searchNum = Integer.parseInt(request.getParameter("searchNum"));
	  memberSearch = request.getParameter("memberSearch");
      
	  if(memberSearch != null) { //검색어 있을 경우 
    	 if(searchNum == 0) {
			
			memberslist = adminMemberService.searchName(memberSearch);
			
    	 }else{
			
			memberslist = adminMemberService.searchId(memberSearch);
    	 }
    	 
   
    	 mav.addObject("searchCount",memberslist.size()); 
	  }
   
	    //공통
  		mav.addObject("memberslist",memberslist); //원래있던 memberlist
		mav.setViewName("adminMemberList");
		return mav;
	}
	
	
	@RequestMapping(value="/info/{memberId}")
	public String adminMemberDetail(@PathVariable("memberId")String id,Model model) throws Exception{
		System.out.println(id);
		Map<String,Object> resultmap = adminMemberService.selectOneMember(id);
		System.out.println(resultmap);
		model.addAttribute("map",resultmap);
		return "adminMemberDetail";
	}
	
 
	
}

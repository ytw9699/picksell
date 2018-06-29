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
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_member.AdminMemberModel;


@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
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

	@Resource
	private AdminMemberService adminMemberService;
	
	ModelAndView mav = new ModelAndView();
	List<AdminMemberModel> memberslist;
	
	@RequestMapping(value="/list")
	public ModelAndView adminMemberList(HttpServletRequest request) throws Exception{
	    
		memberslist= adminMemberService.AdminMemberList();
	    System.out.println(memberslist.size());
	   
	    for(int i=0; i < memberslist.size(); i++) {
	    
	    }
		mav.addObject("memberslist",memberslist);		
		mav.setViewName("/admin_member/adminMemberList");
		return mav;
	}
	
	
	@RequestMapping(value="/search/{searchNum}/{memberSearch}")
	public String adminMemberSearch(@PathVariable("searchNum") int searchNum, @PathVariable("memberSearch") String memberSearch,Model model) throws Exception{
		//name
		
		System.out.println(searchNum);
		
		if(searchNum == 0) {
			memberslist = adminMemberService.searchName(memberSearch);
			
		}else{
			
			memberslist = adminMemberService.searchId(memberSearch);
		}

        return "/admin_member/adminMemberList";
		
	}
	
}

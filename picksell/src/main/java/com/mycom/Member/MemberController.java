package com.mycom.Member;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.mycom.config.CommandMap;
import com.mycom.utils.FileUpload;

	@Controller
	public class MemberController {
	Map<String, Object> resultMap = new HashMap<String, Object>();//공통사용
	
	@Resource(name="memberService")
	private MemberService MemberService;
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String loginForm(Model model) {	
		return "/join/joinForm";
	}
	
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String join(CommandMap map) {
		
		MemberService.insertMember(map.getMap());
		
		return "redirect:/login";
	}
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm(HttpServletRequest request, Model model) throws IOException{
		
		CookieBox CookieBox = new CookieBox(request);
		
		String ID = CookieBox.getValue("ID");
		
		model.addAttribute("cookieID", ID);
		
		return "login/loginForm";
	}
	
/*	if(resultMap == null) {
		System.out.println("계정없음");
		return "login/loginForm";
	}else if(!resultMap.get("USERPW").equals(memberModel.getUserPw())) {
		System.out.println("비번틀림");
		return "login/loginForm";
	}else {
		request.getSession().setAttribute("logonID", memberModel.getUserId());
		return "redirect:/board/main";
	}
	*/
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(CommandMap map, HttpSession session, HttpServletResponse response, Model model, HttpServletRequest request)throws IOException{
		
		resultMap = MemberService.userCheck(map.getMap());
		String PASSWORD = request.getParameter("PASSWORD");
		
		if (resultMap == null) {
			
			model.addAttribute("resultID", "NO");
			return "login/loginForm";
        }
		if(resultMap != null) {
		if(!resultMap.get("PASSWORD").equals(PASSWORD)){
			model.addAttribute("resultID2", "NO");
			return "login/loginForm";
		}
		String ID = (String)resultMap.get("ID");
			
		session.setAttribute("sessionId", ID);//세션에 값저장
		
		response.addCookie(CookieBox.createCookie("ID",ID));//ID 쿠키 생성
		
		}
		return "redirect:/main";
	}
		@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginForm";
		}
	}
	
	

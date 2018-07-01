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
		return "joinForm";
	}
	
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String join(CommandMap map) {
		
		MemberService.insertMember(map.getMap());
		
		return "redirect:/loginForm";
	}
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm(HttpServletRequest request, Model model) throws IOException{
		
		CookieBox CookieBox = new CookieBox(request);
		
		String ID = CookieBox.getValue("ID");
		String PASSWORD = CookieBox.getValue("PW");
		
		model.addAttribute("cookieID", ID);
		model.addAttribute("cookiePW", PASSWORD);
		
		return "loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(
			CommandMap map,
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			Model model
			)throws IOException{
		
		resultMap = MemberService.userCheck(map.getMap());
		//SELECT ID,PASSWORD,NAME FROM PS_MEMBER WHERE ID = #{ID}
		String PASSWORD = request.getParameter("PASSWORD");
		String ID = request.getParameter("ID");
		
		if (resultMap == null) {
			model.addAttribute("resultID", "NULL");//아이디가 없다면
			model.addAttribute("formID", ID);//폼아이디값 넘겨주기
			return "loginForm";
        }
		if(resultMap != null) {
		if(!resultMap.get("PASSWORD").equals(PASSWORD)){
			model.addAttribute("resultPW", "WRONG");//비밀번호가 틀리다면
			model.addAttribute("formID", ID);//폼아이디값 넘겨주기
			return "loginForm";
		}
		session.setAttribute("sessionId", ID);//세션에 값저장
		
		if((request.getParameter("idSave")) != null) {
		if(((String)request.getParameter("idSave")).equals("save")) {
			response.addCookie(CookieBox.createCookie("ID",ID,999999999));//ID 쿠키 생성
			response.addCookie(CookieBox.createCookie("PW",PASSWORD,999999999));//ID 쿠키 생성
		}
		}
		}
		return "redirect:/main";
	}
		@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();//로그아웃후 다시 메인으로
		return "redirect:/main";
		}
	}
	
	

package com.mycom.Member;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.mycom.config.CommandMap;
import com.mycom.utils.FileUpload;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService MemberService;
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String loginForm(Model model) {	
		return "/join/joinForm";
	}
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String join(CommandMap map) {
		
		MemberService.insertMember(map.getMap());
		
		return "redirect:/joinForm";
	}
	
	
}

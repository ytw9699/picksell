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
public class mypageController {
	Map<String, Object> resultMap = new HashMap<String, Object>();//공통사용
	
	@Resource(name="mypageService")
	private mypageService mypageService;
	
	@RequestMapping("/mypage")
	public String mypage(Model model) {	
		return "mypage";//이렇게 해줘야 타일즈랑 연결됨
	}
	@RequestMapping(value="/mypage/modify",method=RequestMethod.GET)
	public String modify(CommandMap map,
			HttpSession session,
			Model model) {	
		String sessionId =(String)session.getAttribute("sessionId");
		
		resultMap = mypageService.userInfo(sessionId);
		model.addAttribute("resultMap", resultMap);
		
		return "modify";//이렇게 해줘야 타일즈랑 연결됨
	}
	
}

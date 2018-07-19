package com.mycom.client_free;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
///this is a test.
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.admin_order.AdminPaymentModel;
import com.mycom.admin_order.AdminPaymentListModel;
import com.mycom.admin_order.AdminPaymentService;
import com.mycom.admin_products.AdminSellService;
import com.mycom.common.Paging;
import com.mycom.config.CommandMap;

@Controller
@RequestMapping("/free_board")
public class FreeController {
	
	@Resource
	private FreeService freeService;
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping("/list")
	public ModelAndView freeList(HttpServletRequest request) {
		
		List<Map<String, Object>> mp = freeService.freeList();
		
		mav.addObject("mp", mp);
		mav.setViewName("client_free/freeBoard");
		return mav;
		
	}
	
	@RequestMapping("/writeForm")
	public ModelAndView freeWriteFrom() {
		
		mav.setViewName("client_free/freeWrite");
		
		return mav;
	}
	
	@RequestMapping("/freeWrite")
	public ModelAndView freeWrite(CommandMap map,
			@RequestParam("images") MultipartFile file,
			HttpServletRequest request) {
		return null;
	}
	
}





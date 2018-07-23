package com.mycom.client_free;

import java.io.IOException;
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


import com.mycom.common.Paging;
import com.mycom.config.CommandMap;

@Controller
@RequestMapping("/free_board")
public class FreeController {
	
	@Resource
	private FreeService freeService;
	
	ModelAndView mav = new ModelAndView();
	
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	
	@RequestMapping("/list")
	public ModelAndView freeList(HttpServletRequest request) {
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<Map<String, Object>> mp = freeService.freeList();
		
		isSearch = request.getParameter("isSearch");
		
		if(isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum==0) //제목 
				mp = freeService.freeSearch1(isSearch);
			else if(searchNum == 1) // 제목 + 내용
				mp = freeService.freeSearch2(isSearch);
			else if(searchNum == 2) // 기부자 
				mp = freeService.freeSearch3(isSearch);
			
			totalCount = mp.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "list", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString(); 
			int lastCount = totalCount;
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			mp =mp.subList(page.getStartCount(), lastCount);
			
		
		
		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum",searchNum);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("mp", mp);
		mav.setViewName("client_free/freeBoard");
		
		return mav;
		
		}
		
		totalCount = mp.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list");
		pagingHtml = page.getPagingHtml().toString(); 
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		mp =mp.subList(page.getStartCount(), lastCount);
		
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("mp", mp);
		mav.setViewName("client_free/freeBoard");
		System.out.println(isSearch+searchNum+totalCount+pagingHtml+currentPage);
		return mav;
	}
	
	@RequestMapping("/writeForm")
	public ModelAndView freeWriteFrom() {
		
		mav.setViewName("client_free/freeWrite");
		
		return mav;
	}
	
	@RequestMapping(value="/freeWrite", method=RequestMethod.POST)
	public String freeWrite(CommandMap map,
			HttpServletRequest request) throws IOException {
		System.out.println(map.getMap());
		freeService.freeCreate(map.getMap());
		
		return "redirect:/free_board/list";
	}
	
	@RequestMapping("/modifyForm/{fb_num}")
	public ModelAndView freeModifyForm(@PathVariable("fb_num") int fb_num) {
		
		Map<String, Object> map = freeService.freeDetail(fb_num);
		mav.addObject("map", map);
		mav.setViewName("client_free/freeModify");
		return mav;
	}
	
	@RequestMapping(value="/freeModify")
	public String freeModify(CommandMap map) {
		
		System.out.println(map.getMap());
		freeService.freeUpdate(map.getMap());
		return "redirect:/free_board/detail/" + map.get("FB_NUM");
	}
	
	@RequestMapping("/detail/{fb_num}")
	public ModelAndView freeDetail(@PathVariable("fb_num") int fb_num,
			HttpServletRequest request) {
		
		
		System.out.println(fb_num);
		
		Map<String, Object> map = freeService.freeDetail(fb_num);
		freeService.freeHitUpdate(fb_num);
		List<Map<String,Object>> commentMap = freeService.commentList(fb_num);
		System.out.println(map.size());
		mav.addObject("commentMap", commentMap);
		mav.addObject("map", map);
		mav.setViewName("client_free/freeDetail");
		
		return mav;
		
	}
	
	@RequestMapping(value="/commentWrite/{fb_num}", method=RequestMethod.POST)
	public String commentWrite(@PathVariable("fb_num") int fb_num, CommandMap map) throws IOException{
		
		freeService.commentCreate(map.getMap());
		System.out.println(map);
		return "redirect:/free_board/detail/"+fb_num;
		
		
	}
	
	@RequestMapping("/deleteComment")
	public String deleteComment(HttpServletRequest request) {
		String fc_num = request.getParameter("fc_num");
		String fb_num = request.getParameter("fb_num");
		freeService.commentDelete(Integer.parseInt(fc_num));
		return "redirect:/free_board/detail/"+fb_num;
	}
	
//	@RequestMapping("/deleteComment/{fc_num}/{fb_num}")
//	public String deleteComment(@PathVariable("fc_num") int fc_num, @PathVariable("fb_num") int fb_num) {
//		freeService.commentDelete(fc_num);
//		return "redirect:/free_board/detail/"+fb_num;
//	}
	
	@RequestMapping("/deleteEverything/{fb_num}")
	public String deleteEverything(@PathVariable("fb_num") int fb_num) {
		
	//	System.out.println(fb_num);
		freeService.freeDelete(fb_num);
		freeService.freeDeleteComment(fb_num);
		
		return "redirect:/free_board/list";
	}
	
	
}





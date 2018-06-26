package com.mycom.picksell;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.config.CommandMap;

@Controller
public class TestController {
	
	@Resource(name="testService")
	private TestService service;
	
	@RequestMapping("/test/testJSP")
	public String testJustJsp() {
		return "testJsp";
	}
	
	@RequestMapping(value="/commandMapTest", method=RequestMethod.POST)
	public String testJustJspPost(CommandMap map, TestBean bean, Model model) {
		System.out.println(map.getMap());
		System.out.println(bean.getTestInput1());
		System.out.println(bean.getTestInput2());
		
		Map<String, Object> resultMap = service.selectTest();
		
		model.addAttribute("resultValue", resultMap);
		System.out.println(resultMap);
		return "resultJsp";
	}
	
	@RequestMapping("/testTiles")
	public String testJustTiles() {
		return "testForm";
	}
	
	@RequestMapping(value="/download/file")
	public ModelAndView fileDownload(
			@RequestParam("filename") String name) {
		
		String path = "C:\\java\\upload";
		
		System.out.println(name);
		
		File file = new File(path, name);
		
		return new ModelAndView("download","downloadFile",file);
		
	}
	
	@RequestMapping("/noSession")
	public String noSession() {
		return "testNoSession";
	}
}

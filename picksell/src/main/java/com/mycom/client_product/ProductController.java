package com.mycom.client_product;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.mycom.config.CommandMap;
import com.mycom.utils.FileUpload;

@Controller
public class ProductController {
	
	/*픽셀플러스 인기상품 전체보기
	새로등록된 플러스상품 전체보기
	새로등록된 일반상품 전체보기
	상품등록폼(메인에서)
	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	픽셀플러스(헤더에서) -> 카테고리 분류있음
	일반상품(헤더에서) -> 카테고리 분류있음
	새로등록된상품(헤더에서) -> 카테고리 분류없음
	카테고리별 
	*/
	//등록폼: 판매방식확인 -> 등록폼 -> 확인 
	
	@Resource(name="productService")
	private ProductService productService;
	
	@RequestMapping("/sell/howto")
	public String howtosell() {
		return "howtosell";
	}
	
	@RequestMapping("/sell/{level}")
	public String sellForm(
			@PathVariable("level") String howtosell,
			Model model) {
		
		//System.out.println(howtosell);
		model.addAttribute("howtosell",howtosell);
		
		return "sellForm";
	}
	
	//스마트에디터 사진업로드(사업자판매와 일반판매 모두 같이사용합니다)
	@RequestMapping(value = "/sell/fileUpload", method = RequestMethod.POST)
	public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException{
		System.out.println("/sell/fileUpload 메서드");
		
		MultipartFile imgfile = multipartRequest.getFile("Filedata");
		Calendar cal = Calendar.getInstance();
		String fileName = imgfile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String replaceName = cal.getTimeInMillis() + fileType;  
		
		//서버에 올리기
		String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"resources/productUpload";
		System.out.println("파일경로::"+path);
		//C:\springWorkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\d_pro\resources\pet_img_upload
		//피시에 올리기
		//String path = "C:\\springWorkspace\\d_pro\\src\\main\\webapp\\resources\\pet_img_upload\\";
		//나의 야매방법
		//String path = getClass().getResource("/").getPath().substring(0, (getClass().getResource("/").getPath()).indexOf(".metadata"))+"/SQUARE/WebContent/static/img/profile_img/";
		
		FileUpload.fileUpload(imgfile, path, replaceName);
		
		model.addAttribute("path", path);
		model.addAttribute("filename", replaceName);
		return "client_product/file_upload";
	}
	
	//일반판매글 등록처리
	@RequestMapping(value="/sell/sellProc", method=RequestMethod.POST)
	public String sellFormProc(
			CommandMap map,
			@RequestParam("first_img") MultipartFile file,
			HttpServletRequest request) throws IOException {
		
		System.out.println(map.getMap());
		//대표이미지(썸네일) 업로드규칙은 자신의아이디+현재시간+타입
		String imgFileName = file.getOriginalFilename();
		String imgFileType = imgFileName.substring(imgFileName.lastIndexOf("."), imgFileName.length());
		Calendar cal = Calendar.getInstance();
		String replaceName = "세션아이디"+cal.getTimeInMillis()+imgFileType;
		
		//대표이미지 업로드
		String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"resources/productUpload";
		File uploadFirstImg = new File(path, replaceName);
		file.transferTo(uploadFirstImg);
		//System.out.println(path); 경로확인
		map.put("first_img", replaceName);
		
		productService.insertProduct(map.getMap());
		
		return "resultJsp";
	}
	
	//일반상품(일반판매) 리스트
	@RequestMapping("/products/goods")
	public String productList(
			@RequestParam(value="ca", required=false, defaultValue="0") int category_num) {
		
		//카테고리0 일때 전체상품카테고리
		//카테고리가0이 아니면 해당카테고리에 대한 모든 상품
		
		return "client_product/productList";
	}
	
	
	
	@RequestMapping("/sellPlus")
	public String sellPlusForm(
			Model model) {
		
		model.addAttribute("howtosell", 2);
		
		return "sellPlusForm";
	}
	
	
	

	
}

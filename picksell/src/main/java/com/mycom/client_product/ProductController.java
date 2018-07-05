package com.mycom.client_product;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.mycom.client_basket.BasketService;
import com.mycom.config.CommandMap;

import com.mycom.utils.FileUpload;

@Controller
public class ProductController {
	
	@Resource(name="productService")
	private ProductService productService;
	
	@Resource(name="basketService")
	private BasketService basketService;
	
	//페이징
	//private int currentPage = 1; //안쓰는변수 어노테이션으로 해결함
	private int totalCount; 		 
	private int blockCount = 10;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private ProductPaging page;
	
	//상품등록 진입점 
	@RequestMapping("/sell/howto")
	public String howtosell() {
		return "howtosell";
	}
	
	//상품등록폼(일반판매)
	@RequestMapping("/sell/{level}")
	public String sellForm(
			@PathVariable("level") String howtosell,
			Model model) {
		
		//System.out.println(howtosell);
		model.addAttribute("howtosell",howtosell);
		
		return "sellForm";
	}
	
	//상품등록폼(플러스상품)
		@RequestMapping("/sellPlus")
		public String sellPlusForm(
				Model model) {
			
			model.addAttribute("howtosell", 2);
			
			return "sellPlusForm";
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
	
	//판매글 등록처리
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
			@RequestParam(value="ca", required=false, defaultValue="0") int category_num,
			@RequestParam(value="od", required=false, defaultValue="0") int orderMethod,
			@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber,
			Model model) {
		
		//정렬은 0 > 최신순, 1 > 낮은가격순, 2 > 높은가격순
		
		//카테고리0 일때 전체상품카테고리 / 카테고리0 아닐때 해당 카테고리리스트
		//카테고리가0이 아니면 해당카테고리에 대한 모든 상품
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("category", category_num);
		parameterMap.put("orderMethod", orderMethod);
		List<Map<String, Object>> resultList = productService.getNomalProductList(parameterMap);
		
		totalCount = resultList.size();
		
		page = new ProductPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/products/goods", category_num, orderMethod);
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		resultList = resultList.subList(page.getStartCount(), lastCount);
		
		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("currentCategory", category_num);
		model.addAttribute("resultProductList", resultList);
		model.addAttribute("currentPage", currentPageNumber);
		
		return "productList";
	}
	

	//플러스상품 리스트
	@RequestMapping("/products/plus")
	public String productPlusList(
			@RequestParam(value="ca", required=false, defaultValue="0") int category_num,
			@RequestParam(value="od", required=false, defaultValue="0") int orderMethod,
			@RequestParam(value="p", required=false, defaultValue="1") int currentPageNumber,
			Model model) {
		
		//정렬은 0 > 최신순, 1 > 낮은가격순, 2 > 높은가격순
		
		//카테고리0 일때 전체상품카테고리 / 카테고리0 아닐때 해당 카테고리리스트
		//카테고리가0이 아니면 해당카테고리에 대한 모든 상품
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("category", category_num);
		parameterMap.put("orderMethod", orderMethod);
		List<Map<String, Object>> resultList = productService.getPlusProductList(parameterMap);
		
		totalCount = resultList.size();
		page = new ProductPaging(currentPageNumber, totalCount, blockCount, blockPage, "/picksell/products/plus", category_num, orderMethod);
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		resultList = resultList.subList(page.getStartCount(), lastCount);
		
		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("currentCategory", category_num);
		model.addAttribute("resultProductList", resultList);
		model.addAttribute("currentPage", currentPageNumber);
		
		return "productPlusList";
	}
	
	//상품 상세보기
	@RequestMapping("/products/detail/{category_num}/{product_num}")
	public String productsDetail(
			@PathVariable("product_num") int product_num,
			@PathVariable("category_num") int category_num,
			//@PathVariable("currentPage") int currentPage,
			Model model,
			HttpServletRequest request) {
		
		String currentID = (String) request.getSession().getAttribute("sessionId");
		
		
		//조회수 증가
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		parameterMap.put("product_num", product_num);
		productService.updateProductHitcount(parameterMap);
		
		//상품상세정보
		resultMap = productService.getProductDetail(parameterMap);
	
		//코멘트리스트++
		List<Map<String, Object>> resultCommentList = productService.getProductCommentList(product_num);

		//구매신청리스트++
		List<Map<String, Object>> resultPurchaseList = productService.getProductPurchaseList(product_num);

		//구매신청을 했는지
		model.addAttribute("alreadyPurchase", false);
		for(int i = 0 ; i < resultPurchaseList.size() ; i++) {
			if(resultPurchaseList.get(i).get("BUYER_ID").equals(currentID)) {
				model.addAttribute("alreadyPurchase", true);
				break;
			}
		}
		
		//장바구니에 담았는지
		model.addAttribute("alreadyBasket", false);
		Map<String, Object> basketParameterMap = new HashMap<String, Object>();
		basketParameterMap.put("product_num", product_num);
		basketParameterMap.put("basket_id", currentID);
		int isBasket = basketService.countingIsBasket(basketParameterMap);
		if(isBasket > 0) {
			model.addAttribute("alreadyBasket", true);
		}
		
		//디테일 정보 확인
		//System.out.println(resultMap);
		model.addAttribute("category_num", category_num);
		model.addAttribute("product_num", product_num);
		//model.addAttribute("currentPage", currentPage);

		//상품상세정보
		model.addAttribute("resultObject", resultMap);
		//상품문의리스트
		model.addAttribute("resultCommentList", resultCommentList);
		
		
		
		return "productDetail";
	}
	
	//상품문의 작성
	@RequestMapping(value="/products/commentProc", method=RequestMethod.POST)
	public String writeComment(CommandMap map, Model model) {
		
		System.out.println(map.getMap());
		productService.insertProductComment(map.getMap());
		
		model.addAttribute("redirect", 1);
		model.addAttribute("category_num", map.getMap().get("category_num"));
		model.addAttribute("product_num", map.getMap().get("product_num"));
		model.addAttribute("currentPage", map.getMap().get("currentPage"));
		//return "redirect:/products/detail/"+map.getMap().get("category_num")+"/"+map.getMap().get("product_num")+"/"+map.getMap().get("currentPage");
		return "client_product/redirecting";
	}
	
	//구매신청하기
	@RequestMapping("/products/purchseRequest/{pn}/{sessionID}")
	public String purchaseRequest(
			@PathVariable("pn") int product_num,
			@PathVariable("sessionID") String currentID,
			Model model) {
		
		
		
		//세션아이디 임시구매자
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("product_num", product_num);
		parameterMap.put("buyer_id", currentID);
		
		productService.insertProductPurchaseList(parameterMap);
		
		model.addAttribute("redirect", 2);

		model.addAttribute("product_num", product_num);

		return "client_product/redirecting";
	}
	
	//구매신청 취소
	@RequestMapping("/products/purchseRequestCancel/{pn}/{sessionID}")
	public String purchaseRequestCancel(
			@PathVariable("pn") int product_num,
			@PathVariable("sessionID") String currentID,
			Model model) {
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("product_num", product_num);
		parameterMap.put("buyer_id", currentID);
		productService.deleteProductPurchaseList(parameterMap);
		
		model.addAttribute("redirect", 4);
		model.addAttribute("product_num", product_num);

		return "client_product/redirecting";
	}
}

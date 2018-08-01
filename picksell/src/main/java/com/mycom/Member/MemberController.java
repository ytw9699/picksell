package com.mycom.Member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mycom.config.CommandMap;

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
		if(map.get("business_number") == null) {
		MemberService.insertMember(map.getMap());//일반 회원가입	
		}
		else{
			MemberService.insertBsMember(map.getMap());//사업자 회원가입	
		}
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
		
		int resultNumber = MemberService.checkJoinId((String)map.get("ID"));//해당아이디의 카운트를 구해옴
		//int의 기본값은 0
		if(resultNumber == 0) {//해당하는 아이디가 없으면 얼럿창띄우기위해
			model.addAttribute("resultNumber", resultNumber);//0을 넘기면 아이디가 없는것 //1이면 있고
			return "loginForm";
		}
		resultMap = MemberService.userCheck(map.getMap());
		if(resultMap.get("LATESTLOGIN1") != null ) {
		MemberService.changeDate(resultMap);// 날짜를 바꿔서입력
		}
		MemberService.insertDate(resultMap);//새로운 현시점의 날짜 입력
		//SELECT * FROM PS_MEMBER WHERE ID = #{ID}
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
		String checkLoginValue = MemberService.checkLogin((String)resultMap.get("ID")); //select status from ps_member where id = '2'
		if(checkLoginValue.equals("2")) {
			model.addAttribute("loginCheck", checkLoginValue);
			return "loginForm";
		}
		session.setAttribute("sessionId", ID);//세션에 값저장
		session.setAttribute("sessionName", (String)resultMap.get("NAME"));
		session.setAttribute("sessionKind", (String)resultMap.get("KIND"));
		//System.out.println((String)resultMap.get("KIND"));
		session.setAttribute("sessionPorfile_Img", (String)resultMap.get("PROFILE_IMG"));
		session.setAttribute("sessionStatus", (String)resultMap.get("STATUS"));
		session.setAttribute("sessionAlarm", (String)resultMap.get("ALARM_CONSENT"));
		
		
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
		
		
	@RequestMapping("/alarmChange")
	@ResponseBody
	public Map<String, Object> changeAlarmONOFF(
			HttpServletRequest request){
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//디비 알람상태 바꾸는 로직
		parameterMap.put("sessionId", request.getSession().getAttribute("sessionId").toString());
		parameterMap.put("currentAlarm", request.getParameter("currentAlarm"));
		MemberService.changeMyAlarm(parameterMap);
		
		//현재 세션도 바꿔주어야하기때문에 [알람세션] 도 재설정
		if(request.getParameter("currentAlarm").equals("ON"))
			request.getSession().setAttribute("sessionAlarm", "OFF");
		else if(request.getParameter("currentAlarm").equals("OFF"))
			request.getSession().setAttribute("sessionAlarm", "ON");
		
		return resultMap;
		}
		
	@RequestMapping("/checkJoinId")//아이디 중복확인
	public String checkJoinId(Model model, @RequestParam(value="id", required=false, defaultValue="0") String id//기본값 0
	){  
		if(!id.equals("0")) {//기본값이 아니라면
			
		int resultNumber = MemberService.checkJoinId(id);//해당아이디의 카운트를 구해옴
		//int의 기본값은 0
		
		model.addAttribute("resultNumber", resultNumber);//0을 넘기면 아이디 중복안되는것 //1이면 중복!
		model.addAttribute("id", id);
		
		}
		return "/join/checkJoinId";
	}
	
	@RequestMapping("/emailAuth")
     public ModelAndView emailAuth(HttpServletResponse reponse, HttpServletRequest request) throws Exception{
    	 
    	 String email = request.getParameter("email");
    	 String authNum = "";
    	 //int check = 0;
    	 
    	 authNum = RandomNum();
    	 
    	 sendEmail(email.toString(), authNum);
    	 
    	 ModelAndView mv = new ModelAndView();
    	 
    	 mv.setViewName("/join/emailAuth");
    	 mv.addObject("email",email);
    	 mv.addObject("authNum",authNum);
    	 
    	 return mv;
    	 
     }
	//이메일 인증 소스
	public void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = "picksell 인증";
		String fromName = "picksell 관리자";
		String from = "khiclass@gmail.com"; //보내는 메일
		String to1 = email;
		final String username = "khiclass@gmail.com";
		final String password = "khacademy";
		
		String content = "인증번호는 "+authNum+" 입니다.";
		
		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					String un = username;
					String pw = password;
					return new PasswordAuthentication(un,pw);
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=utf-8");
			
			Transport.send(msg);
		}catch(MessagingException e) { 
			e.printStackTrace(); 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i<=6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	@RequestMapping("/findIdForm")
	public String findId() throws IOException{
		return "findIdForm";//아이디 찾기폼
	}
	
	@RequestMapping("/findIdResult")//아이디 찾기 결과
	public String findId(HttpServletRequest request, Model model) throws IOException{
	
		String email = request.getParameter("email");
		String name = request.getParameter("name"); 
	
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("email", email);
		paramMap.put("name", name);
		
		String findId = MemberService.findId(paramMap);
		
		if(findId == null) {
			return "findIdResult";
		}
		else {
		model.addAttribute("findIdResult", findId);
		}
		return "findIdResult";
	}
	
	@RequestMapping("/resetPasswordForm")//비밀번호 재설정폼
	public String resetPasswordForm() throws IOException{
		return "resetPasswordForm";
	}
	
	@RequestMapping(value="/resetPassword",method=RequestMethod.POST)//비밀번호 재설정 결과
	public String insertRePs(CommandMap map, Model model) {	
		
	String selectRePs = MemberService.selectRePs(map.getMap());//해당하는 정보가있는지부터확인
	
	if(selectRePs == null) {
		model.addAttribute("resetFail", "resetFail");//해당하는 정보를 못가져옴
		return "/join/resetPasswordForm";
	}
	else {
	MemberService.resetPassword(map.getMap());//새로운비밀번호 설정
	model.addAttribute("resetSuccess", "resetSuccess");
	return "loginForm";
	}
	}
	}	
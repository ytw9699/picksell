## picksell 중고거래 플랫폼 ##

### 기본 패키지 설명 ###
- com.mycom.config: 
	> jsp 폼데이터 전달방식으로 map 을 사용하기 위한 CommandMap.java 와 설정을 위한 CustomMapArgumentResolver.java
	> 세션체크 인터셉터 위치
- com.mycom.picksell: 테스트용 패키지
- com.mycom.utils:
	> 업로드를 위한 FileUpload.java
	 ※ 업로드는 스프링api 를 사용하셔도 됩니다.
	> 다운로드를 위한 DownloadView.java
- com.mycom.validator: 폼데이터 유효성검사를 위한 *Validator.java 클래스 위치
- com.mycom.기능분담이름: 자신의 dao, service, controller 클래스 위치
- messages: 스프링메세지작업을 위한 .properties 파일 위치
- mybatis.config: myBatis.xml 파일 위치

### 각 기능에 대한 패키지 기본구조 ###
- *Command.java: [자바빈] > 필요에따라 작성해주세요
- *Dao.java: [인터페이스]
- *Service.java: [서비스클래스]
- *Controller.java: [컨트롤러클래스] 

### 업로드규칙 ###
- 업로드 경로는 webapp > resources 폴더 하위에 위치합니다 (직접 업로드할 폴더를 만들어야 합니다)
- 업로드경로
String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"resources/업로드폴더";

### 정적자원처리 ###
- js 파일: webapp > js 폴더에 위치시킴
- 관리자페이지css 파일: webapp > admincss 폴더에 위치시킴
- 고객용페이지css 파일: webapp > clientcss 폴더에 위치시킴 
- 업로드가 아닌 페이지소스용 이미지들에 대한 처리: webapp > img 

### 컨트롤러 메서드 인자방식 ###
- 필요에 따라 자바Bean 과 Map 모두 사용 

### 기본 viewResolver ###
- 타일즈 사용을 원칙으로함

### 개발 환경 ### 
    Programming Language - Java 1.7
    IDE - Eclipse
    DB - Oracle 11g 
    Framework - MyBatis, Spring 4
    Build Tool - Maven

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
<%-- <% --%>
//       try { 
//            String driver="oracle.jdbc.driver.OracleDriver"; 
//            Class.forName(driver); 
//            String url="jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL" ; 
//            String userName="KH00905" ; 
//            String passWord="oracle" ; 
//            Connection con = DriverManager.getConnection(url,userName,passWord); 
//            Statement st = con.createStatement(); 
//             //sql안의 데이터 보여주기 
//              String sql2="select * from ps_order order by order_num desc"; 
//              ResultSet rs = st.executeQuery(sql2); 
//              while(rs.next()){ 
//              int order_num = rs.getInt("order_num"); 
//              String buyer_id = rs.getString("buyer_id"); 
//              String status = rs.getString("status"); 
//              int total_price = rs.getInt("total_price");
//              String destination = rs.getString("destination");
//              String account = rs.getString("account");
//              String account_name = rs.getString("account_name");
//              String bank = rs.getString("bank");
//              int purchase_num = rs.getInt("purchase_num");
//              String delivery_company = rs.getString("delivery_company");
//              String invoice_num = rs.getString("invoice_num");

//              String strXML=" "; 
//              strXML+="<general>"; 
//              strXML+=	"<order>"; 
//              strXML+=		"<order_num>"+ order_num +"</order_num>"; 
//              strXML+=		"<buyer_id>"+ buyer_id +"</buyer_id>"; 
//              strXML+=		"<status>"+ status +"</status>";
//              strXML+=		"<total_price>"+ total_price +"</total_price>";
//              strXML+=		"<destination>"+ destination +"</destination>";
//              strXML+=		"<account>"+ account +"</account>";
//              strXML+=		"<account_name>"+ account_name +"</account_name>";
//              strXML+=		"<bank>"+ bank +"</bank>";
//              strXML+=		"<purchase_num>"+ purchase_num +"</purchase_num>";
//              strXML+=		"<delivery_company>"+ delivery_company +"</delivery_company>";
//              strXML+=		"<invoice_num>"+ invoice_num +"</invoice_num>";
//              strXML+=	"</order>"; 
//              strXML+="</general>"; 
//              out.write(strXML); 
//              } catch (Exception e) { 
//                  System.out.println(e);	
//        } 

<%-- %>  --%>




</body>


</html>
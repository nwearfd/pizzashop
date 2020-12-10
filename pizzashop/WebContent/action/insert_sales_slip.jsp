<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
String sales_id = request.getParameter("sales_id");
String sales_code = request.getParameter("sales_code");
String sales_date = request.getParameter("sales_date");
String pizza = request.getParameter("pizza");
int sales_amount = Integer.parseInt(request.getParamter("sales_amount"));

try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = conn.createStatement();
	
	String query = "INSERT INTO TBL_SALELIST_01(SALENO, SCODE, SALEDATE, PCODE, AMOUNT) VALUES('%s','%s','%s','%s','%d')";
	ResultSet rs = stmt.executeQuery(String.format(query, sales_id, sales_code, sales_date, pizza, sales_amount));
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("static/index.jsp");
%>
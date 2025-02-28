<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>상품별매출현황</h3>
<table border="1">
	<tr>
		<td>피자코드</td>
		<td>피자 명</td>
		<td>총매출액</td>
	</tr>
	<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT PIZZA.PCODE, PIZZA.PNAME, SUM(PIZZA.COST * SALELIST.AMOUNT) AS TOTAL_COST FROM TBL_SALELIST_01 SALELIST, TBL_PIZZA_01 PIZZA WHERE SALELIST.PCODE = PIZZA.PCODE GROUP BY PIZZA.PCODE, PIZZA.PNAME ORDER BY SUM(SALELIST.AMOUNT * PIZZA.COST) DESC";
		
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
				</tr>
			<%
		}
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</table>
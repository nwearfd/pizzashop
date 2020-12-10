<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>매출전표등록</h3>

<form action="action/insert_sales_slip.jsp" method="post" name="action_form">
	<table border="1">
		<tr>
			<td>매출전표번호</td>
			<td><input type="number" name="sales_id"></td>
		</tr>
		<tr>
			<td>지점코드</td>
			<td><input type="text" name="sales_code"></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input type="date" name="sales_date"></td>
		</tr>
		<tr>
			<td>피자코드</td>
			<td>
				<select name="pizza">
					<option value="0">피자선택</option>
					<%
						try{
							Class.forName("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
							
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT PCODE, PNAME FROM TBL_PIZZA_01");
							
							while(rs.next()){
								%>
									<option value="<%=rs.getString(1)%>"><%=String.format("[%s] %s", rs.getString(1), rs.getString(2) %></option>
								<% 
							}
							stmt.close();
							con.close();
						} 
						catch (Exception e){
							e.printStackTrace();
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="sales_amount"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="전표등록" onclick="submit_form">
				<input type="button" value="다시쓰기" onclick="reset_form">
			</td>
		</tr>
	</table>
</form>

<script>
function submit_form() {
	if(document.action_form.sales_id.value === ""){
		alert("매출전표번호가 입력되지 않았습니다!");
		document.action_form.sales_id.focus();
		return;
	}
	if(document.action_form.sales_code.value === ""){
		alert("지점코드가 입력되지 않았습니다!");
		document.action_form.sales_code.focus();
		return;
	}
	if(document.action_form.sales_date.value === ""){
		alert("판매일자가 입력되지 않았습니다!")
		document.action_form.sales_date.focus();
		return;
	}
	if(document.action_form.sales_amount.value === ""){
		alert("판매수량이 입력되지 않았습니다!");
		document.action_form.sales_amount.focus();
		return;
	}
	
	alert("정상적으로 등록이 완료되었습니다!");
	document.action_form.submit();
}
function reset_form(){
	alert("처음부터 다시 입력합니다!");
	document.action_form.reset();
	document.action_form.sales_id.focus();
}
</script>
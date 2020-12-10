<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자관리</title>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	
	<%
		String section = request.getParameter("section") != null ? request.getParameter("section") : "";
	%>
	
	<%
		switch(section){
		case "sales_slip":
			%><%@include file="page/sales_slip.jsp" %> <%
			break;
		case "sales_inquiry":
			%><%@include file="page/sales_inquiry.jsp" %> <%
			break;
		case "sales_status":
			%><%@include file="page/sales_status.jsp" %> <%
			break;
		case "sales_status_product":
			%><%@include file="page/sales_status_product.jsp" %> <%
			break;
		default:
			%><%@include file="static/index.jsp" %> <%
		}
	%>
	
	<%@include file="static/footer.jsp" %>
</body>
</html>
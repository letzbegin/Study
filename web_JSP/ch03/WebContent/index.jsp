<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>  
<%@ page import="java.util.Calendar" %>  
<%@ page trimDirectiveWhitespaces="true" %>  
<%!
	public int mul(int a, int b){
	int c = a*b;
	return c;
}
%>


<%
 Calendar cal = Calendar.getInstance();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
오늘은 <%= cal.get(Calendar.YEAR) %> 년
10*20=<%=mul(10,20) %>
</body>
</html>
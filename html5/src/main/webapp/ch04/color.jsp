<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor='<%=request.getParameter("color")%>'>
색 : <%=request.getParameter("color")%>
검색 : <%=request.getParameter("search") %>
</body>
</html>
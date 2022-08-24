<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String menu = request.getParameter("menu");

	// sendRedirect는 menu에 있는 url로 가라
	response.sendRedirect(menu);
%>

</body>
</html>
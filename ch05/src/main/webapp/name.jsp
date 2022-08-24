<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("name", "철수");
	RequestDispatcher rd = request.getRequestDispatcher("name_result.jsp");
	rd.forward(request, response);
%>
</body>
</html>
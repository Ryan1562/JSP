<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>취미</h2>
${hobbys }
<h2>취미</h2>
<%
	Set<String> hobbys = (Set<String>)request.getAttribute("hobbys");
	for(String hobby : hobbys) {
		out.println(hobby + " ");
	}
%>
</body>
</html>
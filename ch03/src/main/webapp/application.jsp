<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String realPath = application.getRealPath("/");
	String stdPath  = application.getContextPath();
	application.log("대박 사건");
%>
절대경로 : <%=realPath %><p>
표준경로 : <%=stdPath %>
</body>
</html>
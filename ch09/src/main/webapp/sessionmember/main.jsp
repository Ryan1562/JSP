<%@page import="ch09.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String id = (String)session.getAttribute("id");
	if (id == null || id.equals("")) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
	MemberDao md = MemberDao.getInstance();
	String name = md.getName(id);
%>
<h2><%=name %>님 환영합니다</h2>
<button onclick="location.href='logout.jsp'">로그 아웃</button>
</body>
</html>
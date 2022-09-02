<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	if (id.equals("java") && password.equals("1234")) {
		session.setAttribute("id", id);
		response.sendRedirect("sub4/winner.jsp");
	} else {
%>
<script type="text/javascript">
	alert("암호 또는 아이디가 드른데 꺼져 ");
	history.back();
</script>
<%  } %>
</body>
</html>
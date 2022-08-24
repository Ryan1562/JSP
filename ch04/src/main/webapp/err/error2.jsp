<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
불편을 드려서 죄송합니다<p>
더 좋은 서비스를 위하여 업그레드 중입니다<p>
<%
	String error = (String)request.getAttribute("error");
%>
원인 : <%=error %>
</body>
</html>
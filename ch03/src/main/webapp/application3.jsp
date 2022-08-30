<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String info = application.getServerInfo();
	int major = application.getMajorVersion();
	int minor = application.getMinorVersion();
%>
웹 컨테이너 이름과 버전 : <%=info %><p>
서블릿 버전 : <%=major %>.<%=minor %>
</body>
</html>
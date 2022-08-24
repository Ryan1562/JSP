<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch08.TestCall"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	TestCall tc = new TestCall();
	tc.setEmpno(7369);
	String result = tc.call();
%>
이름: <%=result %>
</body>
</html>
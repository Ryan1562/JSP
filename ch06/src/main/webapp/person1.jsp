<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
%>
<jsp:useBean id="person" class="ch06.Person" scope="request"></jsp:useBean>
<jsp:setProperty property="name" name="person" value="<%=name %>"/>
<jsp:setProperty property="age" name="person" value="<%=age %>"/>
<jsp:setProperty property="gender" name="person" value="<%=gender %>"/>

<jsp:forward page="person_result.jsp"></jsp:forward>
</body>
</html>
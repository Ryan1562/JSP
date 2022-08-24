<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	int number = Integer.parseInt(request.getParameter("number"));
	int sum = 0;
	for(int i = 1; i <= number; i++) {
		sum += i;
	}
%>
이름 : ${param.name }<p>
누계 : <%=sum %>
</body>
</html>
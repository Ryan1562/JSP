<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	request.setCharacterEncoding("utf-8");
	String[] food = request.getParameterValues("food");
	for(int i =0;i < food.length; i++) {
 		if (i == food.length - 1)
			out.println(food[i]);
 		else out.println(food[i] + ", ");
	}
%>
</body>
</html>
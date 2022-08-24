<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	List<String> fruits = new ArrayList<>();
	fruits.add("산딸기"); fruits.add("집딸기"); fruits.add("판딸기"); 
	fruits.add("죽은딸기"); fruits.add("알카리딸기"); fruits.add("산딸기"); 
	request.setAttribute("fruits", fruits);
	RequestDispatcher rd = request.getRequestDispatcher("fruits_result.jsp");
	rd.forward(request, response);
%>
</body>
</html>
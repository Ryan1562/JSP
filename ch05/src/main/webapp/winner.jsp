<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String[] winners = {"블랙핑크", "BTS", "봉준호"};
	request.setAttribute("winners", winners);
	RequestDispatcher rd = request.getRequestDispatcher("winner_result.jsp");
	rd.forward(request, response);
%>
</body>
</html>
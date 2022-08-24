<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	// 값, 중복허용 x
	Set<String> hobbys = new HashSet<>();
	hobbys.add("졸기"); hobbys.add("자기"); hobbys.add("침뱉기"); 
	hobbys.add("울기"); hobbys.add("놀기"); hobbys.add("졸기"); 
	request.setAttribute("hobbys", hobbys);
	RequestDispatcher rd = request.getRequestDispatcher("set_result.jsp");
	rd.forward(request, response);
%>
</body>
</html>
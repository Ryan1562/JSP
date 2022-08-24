<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	Map<String, String> map = new HashMap<>();
	map.put("name","윤여정");
	map.put("age", "65");
	map.put("hobby", "놀기");
	request.setAttribute("map", map);
	RequestDispatcher rd = request.getRequestDispatcher("map_result.jsp");
	rd.forward(request, response);
%>
</body>
</html>
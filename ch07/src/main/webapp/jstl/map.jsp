<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	Map<String, String> map = new HashMap<>();
	map.put("1","삼계탕"); map.put("2","사계탕"); map.put("3","오계탕"); map.put("4","육계탕"); 
	request.setAttribute("map", map);
%>
<jsp:forward page="map_result.jsp"></jsp:forward>
</body>
</html>
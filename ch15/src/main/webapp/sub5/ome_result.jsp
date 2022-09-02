<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>오늘의 메뉴</h2>
<%
	String[] menus = request.getParameterValues("menu");
	if (menus == null) out.println("먹을 께 없어");
	else 
		for (String menu : menus) {
			out.println(menu+"<br>");
		}
%>
</body>
</html>
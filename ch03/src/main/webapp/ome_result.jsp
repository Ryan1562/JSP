<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
대박사선<hr>
<%	
	out.flush();
	RequestDispatcher rd = request.getRequestDispatcher("ome_result2.jsp");
	rd.include(request, response);
%>
<hr>
ㅋㅋ
</body>
</html>
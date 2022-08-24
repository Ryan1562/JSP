<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%  // out은 servlet만들 때 JspWriter로 만든 객체
	int num = Integer.parseInt(request.getParameter("num"));
	out.println("<h2>구구단 "+num+"단</h2>");
	for (int i = 1; i <= 9;i++) {
		out.println(num+" * "+i+" = "+num*i+"<br>");
	}
%>
</body>
</html>
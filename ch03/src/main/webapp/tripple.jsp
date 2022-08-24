<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>세제곱</h2>
	2 ^ 3 = <%=tripple(2) %><p>
	3 ^ 3 = <%=tripple(3) %><p>
	4 ^ 3 = <%=tripple(4) %><p>
	5 ^ 3 = <%=tripple(5) %><p>
	6 ^ 3 = <%=tripple(6) %><p>
	7 ^ 3 = <%=tripple(7) %><p>
<%!
	int tripple(int x) {
		return x * x * x;
	}
%>
</body>
</html>
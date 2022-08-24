<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	int sum = 0;
	for (int i =1; i<=100; i++) {
		sum += i;
	}
	// 100까지 합계를 sum이름으로 request속성에 저장해서 전달
	request.setAttribute("sum", sum);
	RequestDispatcher rd = request.getRequestDispatcher("hundred_result.jsp");
	rd.forward(request, response);
%>
</body>
</html>
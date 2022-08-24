<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
난 중간 연산자<hr>
<%	out.flush(); // 현재까지 있는 데이터를 화면으로 밀어내라
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	// 저장할 때 setAttribute
	request.setAttribute("plus", num1 + num2);
	request.setAttribute("minus", num1 - num2);
	request.setAttribute("multiply", num1 * num2);
	request.setAttribute("divide", num1 / num2);
	RequestDispatcher rd = request.getRequestDispatcher("cal_forward_result.jsp");
	// forward 연산 결과를 cal_forward_result.jsp로 넘긴다
	// rd.forward(request, response);
	// include 연산 결과를 가지고 와서 이 화면과 같이 보인다
	rd.include(request, response);
%>
<hr>
보이나
</body>
</html>
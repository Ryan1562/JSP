<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%   // 쿠키 생성
	Cookie cookie = new Cookie("name", "kim");
	response.addCookie(cookie); // 사용자 pc 쿠키 저장
	RequestDispatcher rd = request.getRequestDispatcher("cookieView.jsp");
	rd.forward(request, response);
%>
</body>
</html>
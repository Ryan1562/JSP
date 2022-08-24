<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
취미 앞<hr>
<% request.setCharacterEncoding("utf-8"); %>
<!-- include를 이 프로그램으로 결과를 가지고 와서 같이 보여준다
	 forward는 결과 처리를 다른 프로그램으로 넘긴다 -->
<%-- <jsp:forward page="hobby_result.jsp"></jsp:forward> --%>
<!-- jsp:param를 이용하여 name이나 hobby를 변경할 수 있다 -->
<jsp:include page="hobby_result.jsp">
	<jsp:param value="더기" name="name"/>
</jsp:include>
<hr>
취미 뒤
</body>
</html>
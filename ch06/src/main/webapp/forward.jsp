<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
앞<hr>
<%	request.setCharacterEncoding("utf-8");	%>
<%-- <jsp:forward page="forward_result.jsp"></jsp:forward> --%>
<jsp:include page="forward_result.jsp">
	<jsp:param value="20" name="number"/>
</jsp:include>
<hr>아래 부분
</body>
</html>
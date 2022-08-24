<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<c:forEach var="menu" items="${map }">
	${menu }, 키 : ${menu.key }, 값 : ${menu.value }<br>
</c:forEach>
</body>
</html>
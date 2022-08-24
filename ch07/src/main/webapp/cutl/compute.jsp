<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>제곱</h2>
<u:compute end="7" var="n" start="3">
	${n }의 제곱은 ${n * n }<br>
</u:compute>
<h2>세제곱</h2>
<u:compute end="7" var="n" start="3">
	${n }의 세제곱은 ${n * n * n}<br>
</u:compute>
</body>
</html>
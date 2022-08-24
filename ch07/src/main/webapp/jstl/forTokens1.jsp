<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<c:set var="colors" value="red,orange,yellow,green,navy,violet"></c:set>
<h2>사자 생일날</h2>
<c:forTokens var="animal" items="늑대,사슴,원숭이,노루" delims=",">
	${animal }<br>
</c:forTokens>
<c:forTokens var="color" items="${colors }" delims=",">
	${color }<br>
</c:forTokens>
</body>
</html>
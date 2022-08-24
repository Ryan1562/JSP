<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head>
<body>
<h2>이동 수단</h2>
<c:choose>
	<c:when test="${param.num==1}">비행기 타세요</c:when>
	<c:when test="${param.num==2}">KTX 타세요</c:when>
	<c:when test="${param.num==3}">버스 타세요</c:when>
	<c:otherwise>걸어 가세요</c:otherwise>
</c:choose>
</body>
</html>
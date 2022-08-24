<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head>
<body>
<c:set var="code" value="a01" scope="request"></c:set>
<c:set var="name" value="라면" scope="request"></c:set>
<c:set var="price" value="2000" scope="request"></c:set>

<jsp:forward page="set3_result.jsp"></jsp:forward>
</body>
</html>
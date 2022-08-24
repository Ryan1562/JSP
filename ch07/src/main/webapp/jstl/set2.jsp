<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head>
<body>
<c:set var="plus" value="${param.num1 + param.num2 }" scope="request"></c:set>
<c:set var="minus" value="${param.num1 - param.num2 }" scope="request"></c:set>
<c:set var="mutiply" value="${param.num1 * param.num2 }" scope="request"></c:set>
<c:set var="divide" value="${param.num1 / param.num2 }" scope="request"></c:set>

<jsp:forward page="set2_result.jsp"></jsp:forward>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1부터 100까지 합 : <%=request.getAttribute("sum") %><p>
1부터 100까지 합 : ${sum }  <!-- Expression Language -->
</body>
</html>
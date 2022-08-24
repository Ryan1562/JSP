<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${empty param.name?"손":param.name }님 안녕하세요<p>
${not empty param.name?param.name:"손" }님 안녕하세요<p>
</body>
</html>
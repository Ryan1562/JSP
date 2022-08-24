<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<h2>부호 판정</h2>
입력 데이터 : ${param.num }<p>
<c:if test="${param.num > 0 }">양수입니다</c:if>
<c:if test="${param.num == 0}">영입니다</c:if>
<c:if test="${param.num < 0 }">음수입니다</c:if>
</body>
</html>
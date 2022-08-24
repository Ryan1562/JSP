<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<h2>현재 시간</h2>
<!-- both : date + time -->
Short형 : <fmt:formatDate value="${date }" type="both" dateStyle="short" timeStyle="short"/><p>
Medium형 : <fmt:formatDate value="${date }" type="both" dateStyle="medium" timeStyle="medium"/><p>
Long형 : <fmt:formatDate value="${date }" type="both" dateStyle="long" timeStyle="long"/><p>
Full형 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/><p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<!-- Date date = new Date() -->
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
오늘 날자 : ${date }<p>
 <!-- type="date"가 default -->
오늘 날자 : <fmt:formatDate value="${date }" type="date"/><br>
현재 시간 : <fmt:formatDate value="${date }" type="time"/>
</body>
</html>
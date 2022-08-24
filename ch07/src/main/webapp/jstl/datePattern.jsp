<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<!-- patter을 출력하느 방식
	mm 분, MM 월
	E 요일, a 오전/오후 -->
날자 : <fmt:formatDate value="${date }" type="both" pattern="yyyy/MM/dd (E)"/><p>
시간 : <fmt:formatDate value="${date }" type="time" pattern="(a) hh:mm:ss"/><p>
날자 : <fmt:formatDate value="${date }" type="date" pattern="yyyy-MM-dd (E)"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
1000000<p>
<!-- 1000단위 컴마 -->
<fmt:formatNumber value="1000000"></fmt:formatNumber><p>
<!-- 소숫점 갯수 -->
<fmt:formatNumber value="33.1415" pattern="#.##"></fmt:formatNumber><p>
<!-- 천단위 컴마, 소숫점 자릿수 -->
<fmt:formatNumber value="1234563.1415" pattern="#,###.##"></fmt:formatNumber><p>
<!-- 퍼센트로 변경 -->
<fmt:formatNumber value="0.5" type="percent"></fmt:formatNumber><p>
<!-- 그나라 화폐 한글 윈도는 원화 -->
<fmt:formatNumber value="123" type="currency"></fmt:formatNumber><p>
</body>
</html>
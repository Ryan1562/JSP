<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<c:set var="greet" value="How Are You ?"></c:set>
<h2>인사말</h2>
원글 : ${greet }<p>
대문자 : ${fn:toUpperCase(greet) }<p>
소문자 : ${fn:toLowerCase(greet) }<p>
Are위치 : ${fn:indexOf(greet,"Are") }<p>
Are를 Were로 변경 : ${fn:replace(greet,"Are","Were") }<p>
문자의 길이 : ${fn:length(greet) }
</body>
</html>
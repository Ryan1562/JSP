<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<!-- 배열, list, set, map 데이터를 받을 때는 items로  -->
<%-- items="${color } "red","orange","yellow","green","blue","navy","violet" --%>
<c:forEach var="col" items="${color }">
	<font color="${col }">야호</font>
</c:forEach><p>
<c:forEach var="col" items="${color }" varStatus="v">
	<font color="${col }" size="${v.count }">야호 ${v.count } ${v.index }</font>
</c:forEach><p>
<c:forEach var="col" items="${color }">
	<c:forEach var="i" begin="1" end="7">
		<font color="${col }" size="${i }">야호</font>
	</c:forEach>	
</c:forEach><p>
<c:forEach var="i" begin="1" end="7">
	<c:forEach var="col" items="${color }">	
		<font color="${col }" size="${i }">야호</font>
	</c:forEach>	
</c:forEach><p>
</body>
</html>
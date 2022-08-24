<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<%-- <c:set var="color" value="red,orange,yellow,green,blue,navy,violet"></c:set> --%>
<c:forTokens var="col" items="${color }" delims=",">
	<font color="${col }">야호</font>
</c:forTokens><p>
<c:forTokens var="col" items="${color }" varStatus="v" delims=",">
	<font color="${col }" size="${v.count }">야호 ${v.count } ${v.index }</font>
</c:forTokens><p>
<c:forTokens var="col" items="${color }" delims=",">
	<c:forTokens var="i" items="1,2,3,4,5,6,7" delims=",">
		<font color="${col }" size="${i }">야호</font>
	</c:forTokens>	
</c:forTokens><p>
<c:forTokens var="i" items="1,2,3,4,5,6,7" delims=",">
	<c:forTokens var="col" items="${color }" delims=",">	
		<font color="${col }" size="${i }">야호</font>
	</c:forTokens>	
</c:forTokens><p>
</body>
</html>
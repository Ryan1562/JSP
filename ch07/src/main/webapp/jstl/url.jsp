<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<!-- set의 기능과 유사하지만 url을 설정할 때 많이 사용 -->
<%-- <c:url var="url"  value="http://www.naver.com"></c:url> --%>
<c:url var="url" value="gugu.jsp">
	<c:param name="num" value="7"></c:param>
</c:url>
<c:redirect url="${url }"></c:redirect>
</body>
</html>
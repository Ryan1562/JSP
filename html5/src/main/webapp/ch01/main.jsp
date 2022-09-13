<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	header { height: 50px; background: yellow; }
	nav { background: cyan; width: 20%; float: left; }
	article { background: violet; width: 80%; float: right; }
	footer { height: 50px; background: orange; clear: both; }
</style></head><body>
<c:if test="${empty param.pgm }">
	<c:set var="pgm" value="home.html"></c:set>
</c:if>
<c:if test="${not empty param.pgm }">
	<c:set var="pgm" value="${param.pgm }"></c:set>
</c:if>
<header><jsp:include page="top.html"></jsp:include> </header>
<nav><jsp:include page="menu.jsp"></jsp:include> </nav>
<article><jsp:include page="${pgm }"></jsp:include> </article>
<footer> <jsp:include page="footer.html"></jsp:include> </footer>
</body>
</html>
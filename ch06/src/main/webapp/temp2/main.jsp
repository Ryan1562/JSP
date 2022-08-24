<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");
	header { background: yellow; height: 50px; text-align: center; }
	nav { background: violet; height: 400px; float: right; width: 20%; }
	article { background: pink; height: 400px; float: left; width: 80%; }
	footer { background: cyan; height: 50px; clear: both;  text-align: center; }
</style></head><body>
<%
	String pgm = request.getParameter("pgm");
	if (pgm == null || pgm.equals(""))
		pgm = "home.jsp";
	else pgm += ".jsp";
%>
	<!-- 태그 이름만 봐도 의미를 이해할 수있다 : 시메틱 html5 -->
	<header><jsp:include page="header.jsp"/></header>
	<nav><jsp:include page="menu.jsp"/></nav>
	<article><jsp:include page="<%=pgm %>"/></article>
	<footer><jsp:include page="footer.jsp"/></footer>
</body>
</html>
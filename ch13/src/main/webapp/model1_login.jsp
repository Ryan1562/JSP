<%@page import="ch13.service.IdCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head><body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	IdCheck ic = new IdCheck();
	int result = ic.idchk(id, password);
	if (result > 0) {
%>
<h2>메뉴</h2>
1. 세계 평화<p>
2. 환경 보호<p>
3. 국가 발전
<%  } else { %>
<script type="text/javascript">
	alert("아이디나 암호가 다릅니다");
	history.back();
</script>
<%  } %>
</body>
</html>
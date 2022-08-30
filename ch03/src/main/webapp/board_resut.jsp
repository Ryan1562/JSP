<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head><body>
<%	request.setCharacterEncoding("utf-8");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
%>
<table><caption>게시글 작성 결과</caption>
	<tr><th>제목</th><td><%=subject %></td></tr>
	<tr><th>작성자</th><td><%=writer %></td></tr>
	<tr><th>내용</th><td><pre><%=content %></pre></td></tr>
</table>
</body>
</html>
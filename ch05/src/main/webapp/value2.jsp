<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>좋아하는 영화</h2>
${paramValues.movie[0] } ${paramValues.movie[1] } ${paramValues["movie"][2] }
${paramValues.movie[3] } ${paramValues.movie[4] }
<h2>좋아하는 영화</h2>
<%
	String[] movie = request.getParameterValues("movie");
	for (String m:movie) {
		out.println(m+" ");
	}
%>
</body>
</html>
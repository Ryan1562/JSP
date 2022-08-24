<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head><body><table><caption>구구단</caption><tr>
<%	for(int i = 2; i <= 9; i++) {
		out.println("<th>"+i+"단</th>");
	}
	out.println("</tr><tr>");
	for (int i = 2; i <= 9; i++) {
		if (i % 2 == 0 ) out.println("<td>");
		else out.println("<td style='background:pink'>");
		for (int j=1; j<=9 ;j++) {
			out.println(i+" * "+j+" = "+i*j+"<br>");
		}
		out.println("</td>");
	}
%>
</tr></table>
</body>
</html>
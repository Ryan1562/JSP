<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head><body><h2>구구단</h2><table><tr>
<%	int i = 2, j =1;
	do {
		out.println("<th>"+i+"단</th>");  i++;
	}while(i <= 9);
	out.println("</tr><tr>");  i = 2;
	do {
		if (i %2 == 0) out.println("<td style='background:pink'>");
		else out.println("<td>");
		do {
			out.println(i+" * "+j+" = "+i*j+"<br>");	j++;
		}while(j <= 9);
		out.println("</td>"); i++; j = 1;
	}while(i <= 9);
%>
</tr></table>	
</body>
</html>
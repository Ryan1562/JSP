<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String realPath = application.getRealPath("/WEB-INF/input");
	BufferedReader br = new BufferedReader(new FileReader(realPath));
	while(true) {
		String str = br.readLine();
		if (str == null) break;
		else out.println(str+"<br>");
	}
	br.close();
%>
</body>
</html>
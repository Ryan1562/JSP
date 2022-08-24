<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<h2>소개</h2>
이름 : ${map.name }<p>
나이 : ${map.age }<p>
취미 : ${map.hobby }<p>
<h2>소개</h2>
<%
	Map<String, String> map = (Map<String, String>)request.getAttribute("map");
	Iterator<String> it = map.keySet().iterator();
	String[] str = {"이름", "나이","취미"};
	int i = 0;
	while(it.hasNext()) {
		out.println(str[i]+" : "+map.get(it.next())+"<p>");
		i++;
	}
%> 
</body>
</html>
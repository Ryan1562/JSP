<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	// 무작위 데이터를 저장하고 하나씩 순서대로 추출하여 처리할 때 사용하는 Interface
	// Enumeration hasMoreElement()   , nextElement()
    // Iterator    hasNext()          , next()
	Enumeration<String> et = session.getAttributeNames();
	while(et.hasMoreElements()) {
		String name = et.nextElement();
		String value = (String)session.getAttribute(name);
		out.println("세션명 : "+name+"<br>");
		out.println("세션값 : "+value+"<p>");
	}
%>
<h2>직접 읽기</h2>
아이디 : <%=session.getAttribute("id") %><br>
암호 : <%=session.getAttribute("pass") %>
</body>
</html>
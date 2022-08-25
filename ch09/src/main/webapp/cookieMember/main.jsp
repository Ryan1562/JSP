<%@page import="ch09.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	String id = "";
	Cookie[] cooks = request.getCookies();
	if (cooks == null) response.sendRedirect("loginForm.jsp");
	else {
		for(int i =0; i < cooks.length;i++) {
			if (cooks[i].getName().equals("id")) {
				id = cooks[i].getValue();
				break;
			}
		}
		if (id == null || id.equals("")) 
			response.sendRedirect("loginForm.jsp");
	}
	// MemberDao객체 생성 id를 가지고 이름을 읽어오는 getName(id)메서드 추가
	MemberDao md = MemberDao.getInstance();
	String name = md.getName(id);
%>
<!-- id대신에 이름을 출력 -->
<%-- <h2><%=id %>님 격하게 환영합니다</h2> --%>
 <h2><%=name %>님 격하게 환영합니다</h2>
<button onclick="location.href='logout.jsp'">로그 아웃</button>
</body>
</html>
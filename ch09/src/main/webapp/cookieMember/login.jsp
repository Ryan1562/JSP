<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch09.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao md = MemberDao.getInstance(); // 이미 만들었던 객체를 사용 singleton
	int result = md.loginChk(id, password); 
	if (result > 0) {  // 아이디와 암호가 일치
		Cookie cook = new Cookie("id", id);
		response.addCookie(cook);
		response.sendRedirect("main.jsp");
	} else if (result == 0) {
%>
<script type="text/javascript">
	alert("암호를 모르네, 암호 다시 대봐 ??");
	history.back();
</script>
<%  } else { %>
<script type="text/javascript">
	alert("넌 누구냐, 없는 아이디 입니다 회원가입 하세요");
	history.back();
</script>
<%  } %>
</body>
</html>
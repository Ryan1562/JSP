<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.delete(id);
	if (result > 0) {
		// 탈퇴릏 했으면 브라우저를 닫지 않더라도 현재사이트의 사용 못하게 만들기 위해서 세션 제거
		session.invalidate();
%>
<script type="text/javascript">
	alert("탈퇴했어 ! 꺼져 !!!");
	location.href="loginForm.jsp";
</script>
<%  } else { %>
<script type="text/javascript">
	alert("탈퇴 왜 안되지 ??");
	history.go(-1);
</script>
<%  } %>
</body>
</html>
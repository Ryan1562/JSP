<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="ch10.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.update(member);
	if (result > 0) {
%>
<script type="text/javascript">
	alert("수정됐다. 대 ~ 박");	
	location.href="main.jsp";
</script>
<%  } else { %>
<script type="text/javascript">
	alert("허걱 ! 왜 안되지");	
	history.go(-1);
</script>
<%  } %>
</body>
</html>
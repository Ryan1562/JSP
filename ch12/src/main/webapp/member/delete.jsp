<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bookshop.shopping.*"%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%	MemberDao md = MemberDao.getInstance();
	int result   = md.delete(id);  
	if (result > 0) { 
		session.invalidate(); %>
<script type="text/javascript">
	alert("탈퇴됐네"); location.href = "main.jsp";
</script> 
<%   } else { %>
<script type="text/javascript">
	alert("죽을 때 까지 같이"); history.go(-1);
</script>
<%  } %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<jsp:useBean id="member" class="ch06.Member" scope="request"></jsp:useBean>
<jsp:setProperty property="id" name="member" value='<%=request.getParameter("id") %>'/>
<jsp:setProperty property="pass" name="member" value='<%=request.getParameter("pass") %>'/>
<jsp:setProperty property="name" name="member" value='<%=request.getParameter("name") %>'/>
<jsp:setProperty property="tel" name="member" value='<%=request.getParameter("tel") %>'/>

<jsp:forward page="member_result.jsp"></jsp:forward>
</body>
</html>
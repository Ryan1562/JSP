<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,ch08.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
</head><body>
<%
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String driver = "com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://127.0.0.1:3306/test?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	String sql = "select * from dept where deptno="+deptno;
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "root", "mysql");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	Dept dept = new Dept();
	dept.setDeptno(deptno); dept.setDname(rs.getString(2)); dept.setLoc(rs.getString(3));
	pageContext.setAttribute("dept", dept);
	rs.close(); stmt.close(); conn.close();
%>
<form action="deptUpdate.jsp" method="post">
<table><caption>부서정보 수정</caption>
	<tr><th>부서코드</th><td><input type="number" name="deptno" value="${dept.deptno }"
		readonly="readonly"></td></tr>
	<tr><th>부서명</th><td><input type="text" name="dname" value="${dept.dname }"
		required="required" autofocus="autofocus"></td></tr>
	<tr><th>근무지</th><td><input type="text" name="loc" value="${dept.loc}"
		required="required"></td></tr>
	<tr><th colspan="2"><input type="submit"></th></tr>
</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*"%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	Connection conn = null;
	Context ctx = new InitialContext();
//	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MySql");
	conn = ds.getConnection();
	if (conn != null) out.println("연결 성공");
	else out.println("에휴");
	conn.close();
%>
</body>
</html>
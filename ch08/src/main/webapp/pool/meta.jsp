<%@page import="javax.naming.*,javax.sql.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String sql = "select * from emp";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	// MetaData : table명, 컬럼명, 컬럼 갯수, 데이터 타입의 정보를 가진 데이터, 순서 1부터
	// rsmd.getColumnCount() 컬럼의 갯수
	ResultSetMetaData rsmd = rs.getMetaData(); 
	for(int i = 1; i <= rsmd.getColumnCount();i++) {
		out.println(i+" 번째 컬럼 : " + rsmd.getColumnName(i)+"<br>");
		out.println(i+" 번째 컬럼 타입 : "+rsmd.getColumnTypeName(i)+"<p>");
	}
	// pool에서 close는 반납
	rs.close();  pstmt.close();  conn.close();
%>
</body>
</html>
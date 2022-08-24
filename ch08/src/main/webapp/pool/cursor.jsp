<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	String sql = "select * from emp";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql,
			ResultSet.TYPE_SCROLL_SENSITIVE,  // 데이터 읽는 순서를 내 마음대로 정할 수 있다
			ResultSet.CONCUR_UPDATABLE);      // 현재 읽은 데이터를 수정 가능
	ResultSet rs = pstmt.executeQuery();
	rs.last();  // 마지막 데이터
	out.println(rs.getInt("empno")+", "+rs.getString("ename")+"<br>");
	rs.first(); // 첫번째 데이터
	out.println(rs.getInt("empno")+", "+rs.getString("ename")+"<br>");
	rs.absolute(3); // 세번째 데이터
	out.println(rs.getInt("empno")+", "+rs.getString("ename")+"<br>");
	rs.close(); pstmt.close(); conn.close();
%>
</body>
</html>
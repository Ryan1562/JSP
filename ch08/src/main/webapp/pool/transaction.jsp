<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String sql = "insert into dept values(31,'방관팀','울산')";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/OracleDB");
	Connection conn = ds.getConnection();
	// default true // 여러 테이블 수정/삭제/입력하고 모두 성공일 때 만 commit일 때 사용
	conn.setAutoCommit(false);  
	Statement stmt = conn.createStatement();
	int result = stmt.executeUpdate(sql);
	if (result > 0) {
		out.println("입력 성공");
		conn.commit();   // commit
	} else {
		out.println("입력 실패");
		conn.rollback();  // 취소
	}
	conn.setAutoCommit(true);
	stmt.close(); conn.close();
%>
</body>
</html>
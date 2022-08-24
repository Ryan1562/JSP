<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String driver="oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "insert into dept values(?, ?, ?)";
	try {
		Class.forName(driver);   // driver load
		Connection conn = DriverManager.getConnection(url,"scott","tiger"); // DB연결
		PreparedStatement pstmt = conn.prepareStatement(sql);   // sql실행할 객체 생성
		pstmt.setInt(1, deptno);
		pstmt.setString(2, dname);
		pstmt.setString(3, loc);
		int result = pstmt.executeUpdate();  // 실행하고 성공한 갯수를 result에 저장
		pstmt.close();  conn.close();        // 성공하면 메모리에서 객체 제거
%>
<script type="text/javascript">
	alert("부서정보가 입력 되었습니다");   location.href="select.jsp";
</script>
<%	} catch(Exception e) {   %>
<script type="text/javascript">
	alert("으이그 실패네");    	history.go(-1); // history.back();
</script>
<%  } %>
</body>
</html>
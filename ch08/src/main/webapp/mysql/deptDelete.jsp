<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String driver = "com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://127.0.0.1:3306/test?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	String sql = "delete from dept where deptno="+deptno;
	Connection conn = null; Statement stmt = null;
	try {	Class.forName(driver);
			conn = DriverManager.getConnection(url,"root","mysql");
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			if (result > 0) {
%>
<script type="text/javascript">
	alert("삭제 성공 ㅋㅋ");  location.href="select.jsp";
</script>
<%  	} else out.println("삭제 에러");
	} catch(Exception e) { %>
<script type="text/javascript">
	alert("삭제 실패 ㅠㅠ");  history.go(-1);
</script>
<%  } finally{
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}	
%>
</body>
</html>
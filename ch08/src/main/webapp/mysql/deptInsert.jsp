<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8");
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String driver = "com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://127.0.0.1:3306/test?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	String sql = "insert into dept values(?, ?, ?)";
%>
<%  try { 
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, "root", "mysql");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno); pstmt.setString(2, dname); pstmt.setString(3, loc);
		int result = pstmt.executeUpdate();
%>	
<script type="text/javascript">
	alert("부서정보 입력 성공 ㅋㅋ");  location.href="select.jsp";
</script>	
<% }catch(Exception e) { %>
<script type="text/javascript">
	alert("똑바로 해, 다시");   history.back();
</script>		
<% } %>
</body>
</html>
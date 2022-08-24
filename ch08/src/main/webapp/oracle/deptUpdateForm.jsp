<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,ch08.Dept"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../common.css"></head><body>
<%	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String driver="oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "select * from dept where deptno="+deptno;
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Statement stmt  = conn.createStatement();
	ResultSet rs =  stmt.executeQuery(sql);
	rs.next(); // 조회한 데이터 읽기
	Dept dept = new Dept();
	dept.setDeptno(deptno);
	dept.setDname(rs.getString("dname"));
	dept.setLoc(rs.getString("loc"));
	pageContext.setAttribute("dept", dept);  // pageContext 현재 페이지에서 사용
	rs.close(); stmt.close(); conn.close();
%>
<form action="deptUpdate.jsp" method="post">
	<!-- 화면에는 보이지 않지만 action에 있는 프로그램으로 데이터는 전달한다 -->
	<input type="hidden" name="deptno" value="${dept.deptno }">
<table><caption>부서정보 수정</caption>
	<tr><th>부서코드</th><td>${dept.deptno } 
		<!-- readonly="readonly" : 화면에도 보이고 데이터도 action에 있는 프로그램으로 전달하지만 변경은 안됨 -->
		<%-- <input type="text" name="deptno" value="${dept.deptno}" readonly="readonly"> --%></td></tr>
	<tr><th>부서명</th><td><input type="text" name="dname" value="${dept.dname }" 
		required="required"></td></tr>
	<tr><th>근무지</th><td><input type="text" name="loc" value="${dept.loc }" 
		required="required"></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>
</form>
</body>
</html>
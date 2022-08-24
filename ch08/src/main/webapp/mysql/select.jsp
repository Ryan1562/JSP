<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,ch08.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
</head><body>
<%	List<Dept> list = new ArrayList<>();
	String driver = "com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://127.0.0.1:3306/test?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	String sql = "select * from dept order by deptno";
	Class.forName(driver);  // driver load
	Connection conn = DriverManager.getConnection(url,"root","mysql"); // DB연결
	Statement stmt  = conn.createStatement();  // sql실행할 객체 생성
	ResultSet rs = stmt.executeQuery(sql);     // sql을 실행하고 그 결과를 rs에 저장
	while(rs.next()) {  // rs에 저장된 여러건의 데이터를 한건씩을 출력하여 처리
		Dept dept = new Dept();
		dept.setDeptno(rs.getInt(1)); dept.setDname(rs.getString(2)); dept.setLoc(rs.getString(3));
		list.add(dept);
	}
	request.setAttribute("list", list);
	rs.close(); stmt.close(); conn.close();  // 사용한 객체를 메모리에서 제거
%>
<jsp:forward page="select_result.jsp"></jsp:forward>
</body>
</html>
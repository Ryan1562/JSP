<%@page import="java.util.*,ch08.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	List<Dept> list = new ArrayList<>();
	String driver="oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "select * from dept order by deptno";
	Class.forName(driver);     // driver load
	Connection conn = DriverManager.getConnection(url,"scott","tiger"); // DB 연결
	Statement stmt = conn.createStatement();  // sql을 실행할 객체 생성
	ResultSet rs = stmt.executeQuery(sql);  // sql을 실행하고 그 결과를 rs에 저장
	while(rs.next()) { // 데이터를 rs에서 처음부터 한건씩 읽는 것
		Dept dept = new Dept();    // dept 객체 생성
		dept.setDeptno(rs.getInt("deptno"));  // rs에서 부서코드를 읽어서 dept객체 저장 
		dept.setDname(rs.getString("dname")); //   "   부서명을        "
		dept.setLoc(rs.getString("loc"));     //   "   근무지를 읽어서   "
		list.add(dept);  // 데이터가 저장된 dept를 list에 추가
	}
	request.setAttribute("list", list);  // 여러건의 데이터를 가진 리스트를 request에 속성으로 담는다
	rs.close();  stmt.close(); conn.close();   // 사용한 객체를 메모리에서 제거
%>
<jsp:forward page="selet_result.jsp"></jsp:forward>
</body>
</html>
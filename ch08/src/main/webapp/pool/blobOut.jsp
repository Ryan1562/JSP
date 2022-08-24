<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*,java.io.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String id = request.getParameter("id");
	String sql = "select photo from test where id=?";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	Blob blob = rs.getBlob("photo");
	// 내장변수 out 충돌 방지
	out.clear();
	out=pageContext.pushBody();
	// 요청한 결과를 blobView.jsp로 보내는 파일을 생성
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	InputStream is = blob.getBinaryStream();
	int length = (int)blob.length();
	byte[] buffer= new byte[length];
	// -1은 더이상 읽을 데이터가 없음
	while((length = is.read(buffer)) != -1) {
		bos.write(buffer);
	}
	bos.close(); is.close(); pstmt.close(); conn.close();
%>
</body>
</html>
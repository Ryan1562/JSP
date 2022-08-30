<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8");
	String real = application.getRealPath("/fileSave");
	int maxSize = 1024 * 1024 * 10;  // 10M
	// DefaultFileRenamePolicy 파일명이 중복되면 이름을 변경하여 저장
	MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", 
			new DefaultFileRenamePolicy());
	// MultipartRequest를 사용하면 request대신에 mr를 사용해야 함
	String title = mr.getParameter("title");
	String name = mr.getParameter("name");
	String fileName = mr.getFilesystemName("file"); // 저장된 파일명, 이름이 변경 안되면 같지만 변경되면 다름
	String origin = mr.getOriginalFileName("file"); // 원래 파일면
	File file = mr.getFile("file");    // 저장된 그림 파일을 이용하여 파일 생성
	int fileSize = (int)file.length(); // 파일 크기
%>
<h2>업로드 결과</h2>
제목 : <%=title %><p>
이름 : <%=name %><p>
파일명 : <%=fileName %><p>
원래명 : <%=origin %><p>
파일크기 : <%=fileSize %><p>
<img alt="" src="../fileSave/<%=fileName%>" width="200">
</body>
</html>
<%@page import="java.util.Date,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8");
	String subject = request.getParameter("subject");
	String writer  = request.getParameter("writer");
	String content = request.getParameter("content");
	Date date = new Date();
	long time = date.getTime(); // 파일명을 중복되지 않게 생성
	String fileName = time+".txt";
	String real = application.getRealPath("/WEB-INF/"+fileName);
	FileWriter fw = new FileWriter(real);
	String str = "제목 : "+subject+"\r\n";
	str += "작성자 : "+writer+"\r\n";
	str += "내용 : "+content;
	fw.write(str);
	fw.close();
	out.println("저장 완료");
%>
</body>
</html>
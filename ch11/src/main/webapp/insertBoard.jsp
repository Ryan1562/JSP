<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	BoardDao bd = BoardDao.getInstance();
	for(int i =0; i < 229; i++) {
		Board board = new Board();
		board.setSubject("가을이 오네 "+i);
		board.setWriter("박보검 "+i);
		board.setPassword("1");
		board.setContent("여름이 가네 " + i);
		bd.insert(board);
	}
%>
입력 완료
</body>
</html>
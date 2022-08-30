<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
<%	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao bd = BoardDao.getInstance();
	bd.readCountUpdate(num);  // 반환 받지 않음
	Board board = bd.select(num);
	pageContext.setAttribute("board", board);
%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() { // 게시판에 대한 내용이 화면에 띄면 바로 아래 작업을 실행
		// $는 jQuery를 사용 #disp는 id가 disp인 곳에 
		// .load('list.jsp');는 list.jsp를 실행하여 결과를 보여줘리
		$('#disp').load('list.jsp?pageNum=<%=pageNum%>');
	});
</script></head><body>
<table><caption>게시글 상세 보기</caption>
	<tr><th>제목</th><td>${board.subject}</td></tr>
	<tr><th>작성자</th><td>${board.writer}</td></tr>
	<tr><th>조회수</th><td>${board.readcount}</td></tr>
	<tr><th>작성일</th><td>${board.reg_date}</td></tr>
	<tr><th>내용</th><td><pre>${board.content}</pre></td></tr>
</table>
<div align="center">
	<button onclick="location.href='updateForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정</button>
	<button onclick="location.href='deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">삭제</button>
	<button onclick="location.href='writeForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">답변</button>
	<button onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">게시글 목록</button>
</div>
<div id="disp"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head><body>
<form action="board2_write.jsp" method="post">
<table><caption>게시글 작성</caption>
	<tr><th>제목</th><td><input type="text" name="subject" autofocus="autofocus"
		required="required"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="writer" required="required"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="40" name="content"
		required="required"></textarea></td></tr>
	<tr><th colspan="2"><input type="submit"></th></tr>
</table>
</form>
</body>
</html>
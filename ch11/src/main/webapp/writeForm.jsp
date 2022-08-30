<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호확인이 다릅니다"); frm.password.focus();
			frm.password.value = ""; frm.confirmPass.value= ""; return false;
		}
	}
</script></head><body>
<%	int num = 0, ref = 0, re_step = 0, re_level = 0;
	String pageNum = request.getParameter("pageNum");
	num = Integer.parseInt(request.getParameter("num"));
	if (num != 0) { // 0이면 처음 쓴글, 0이 아니면 답변글
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(num);
		ref = board.getRef();   // 답변글 달 원글의 ref가 무었알기 위해
		re_step  = board.getRe_step();  // 원글의 re_step
		re_level = board.getRe_level(); //  "   re_level
	}
%>
<form action="write.jsp" method="post" name="frm" onsubmit="return chk()">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<!-- 처음 입력하면 ref/re_step/re_level 0인데 답변 게시글은 원본글의 ref/re_step/re_level을 값을 가지고 처리 -->
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re_step" value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
<table><caption>게시글 작성</caption>
<%	if (num == 0) { %>
	<tr><th>제목</th><td><input type="text" name="subject" required="required"
		autofocus="autofocus"></td></tr>
<%  } %>
<%	if (num != 0) { %>
	<tr><th>제목</th><td><input type="text" name="subject" required="required"
		autofocus="autofocus" value="답변) "></td></tr>
<%  } %>
	<tr><th>작성자</th><td><input type="text" name="writer" required="required"></td></tr>
	<!-- 암호를 아는 사람만 글 작성, 수정하기 위한 것.  회원 게시판에서는 필요없음 -->
	<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th>암호확인</th><td><input type="password" name="confirmPass" required="required"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="40" name="content" 
		required="required"></textarea></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>
</form>
</body>
</html>
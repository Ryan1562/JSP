<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="board" class="ch11.Board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%	String pageNum = request.getParameter("pageNum");
	BoardDao bd = BoardDao.getInstance();
	int result = bd.insert(board);
	if (result > 0) {
%>
<script type="text/javascript">
	alert("게시글 작성 성공 ㅋㅋ");
	location.href="list.jsp?pageNum=<%=pageNum%>";
</script>
<%  } else { %>
<script type="text/javascript">
	alert("헐 ~ 실패");
	history.go(-1);
</script>
<%  } %>
</body>
</html>
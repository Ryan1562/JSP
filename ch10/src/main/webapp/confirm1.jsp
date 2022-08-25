<%@page import="ch10.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
<%	String id = request.getParameter("id"); %>
<script type="text/javascript">
	function wincl() {
		// opener : joinForm.jsp, id를 표현식에 서 사용할 때 자바스크립트에는 큰 따움표 안에 넣어야 한다
		opener.frm.id.value = "<%=id%>";
		window.close();   // 현재창 닫기
	}
</script></head><body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.confirm(id);
	if (result > 0) {
%>
<h2>이미 있는 아이디이니 다른 것을 사용하세요</h2>
	<!-- action에 값이 없으면 현재 작업(confirm1.jsp)을 다시 실행 -->
	<form action="">
		아이디 : <input type="text" name="id" required="required" autofocus="autofocus"><p>
		<input type="submit" value="확인">
	</form>
<%  } else { %>
<h2>사용 가능한 아이디입니다</h2>
<button onclick="wincl()">창닫기</button>
<%  } %>
</body>
</html>
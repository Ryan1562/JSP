<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch09.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8"); // post방식에서 한글 보호 %>
<!-- Member member = new Member(); -->
<jsp:useBean id="member" class="ch09.Member"></jsp:useBean>
<!-- 아이디, 암호, 이름을 member객체에 저장 -->
<jsp:setProperty property="*" name="member"/>
<%	// singleton을 이용하여 객체 생성
	MemberDao md = MemberDao.getInstance();
	int result = md.insert(member); // md에 insert(member)를 수행 
	if (result > 0) {
%>
<script type="text/javascript">
	alert("회원가입을 축하합니다 !!");
	location.href="loginForm.jsp";
</script>
<%  }else { %>
<script type="text/javascript">
	alert("으이그 인간아! 똑바로 해");
	history.back();   // go(-1);
</script>
<%  } %>
</body>
</html>
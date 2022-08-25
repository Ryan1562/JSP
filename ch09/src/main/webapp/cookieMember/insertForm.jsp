<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호확인이 다릅니다"); frm.password.focus();
			frm.password.value = "";  frm.confirmPass.value = ""; 
			return false;
		}
	}
</script></head><body>
<form action="insert.jsp" method="post" name="frm" onsubmit="return chk()">
<table><caption>회원 가입</caption>
	<tr><th>아이디</th><td><input type="text" name="id" required="required"
		autofocus="autofocus"></td></tr>
	<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th>암호 확인</th><td><input type="password" name="confirmPass" required="required"></td></tr>
	<tr><th>이름</th><td><input type="text" name="name" required="required"></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>
<a href="loginForm.jsp">로그인</a>
</form>
</body>
</html>
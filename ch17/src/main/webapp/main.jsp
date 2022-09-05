<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
<script type="text/javascript">
	function del() {
		// 정말로 탈퇴 하겠습니까 ?
		var ch = confirm("점말로 탙퇴하시겠습니까 ?");
		if (ch) location.href="delete.do";
		else alert("탈퇴가 취소 되었습니다");
	}
	function chk() {
		// 자바스크립트에서 EL을 사용할 때는 큰따움표("")를 묶어서 사용
		var id = "${member.id}";
		// 자바에서는 문자 비교할 때 equals를 사용하지만 자바스크립에서드 ==사용
		if (id != 'master') {
			alert("리스트를 사용할 권한이 없습니다");
			return;
		} else location.href="list.do";
	}
</script>
</head><body>
<table><caption>${member.name }님 환영합니다</caption>
	<tr><th><button onclick="location.href='updateForm.do'">회원정보 수정</button></th></tr>
	<tr><th><button onclick="del()">회원 탈퇴</button></th></tr>
	<tr><th><button onclick="chk()">회원 목록</button></th></tr>
	<tr><th><button onclick="location.href='logout.do'">로그 아웃</button></th></tr>
</table>
</body>
</html>
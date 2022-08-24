<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>오늘의 메뉴</h2>
<form action="ome_result.jsp" method="post">
	<fieldset><legend>음식 복수 선택</legend>
		<select name="food" multiple="multiple" size="6">
			<option>짜증날 때 짜장
			<option>우울할 때 우동
			<option>복잡할 때 볶음밥
			<option>서비스는 군만두
			<option>해장에는 짬뽕
			<option>탕탕탕탕 탕수육
		</select><p>
		<input type="submit" value="확인">
	</fieldset>
</form>
</body>
</html>